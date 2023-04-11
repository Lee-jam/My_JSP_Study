# 230411 JSP 필기
COS 라이브러리 : 웹페이지에서 파일 업로드 기능을 구현하는 방법 에서 사용하는 라이브러리 중 하나

MultipartRequest : COS 라이브러리에서 가장 핵심적인 역할을 하는 클래스로 파일 업로드를 직접적으로 담당하며, 안정성이 다른 파일업로드 라이브러리보다 뛰어난다고 함.

> application.getRealPath : 웹 어플리케이션 내에서 지정한 경로에 해당하는 자원의 시스템 상에서의 경로를 리턴
```
String saveDirectory = application.getRealPath("/Storage");
```
### Upload Logic
```java
try{
	//1.MultipartRequest 객체 생성
	MultipartRequest mr = new MultipartRequest(request,saveDirectory,maxPostSize,encoding);
	//MultipartRequest mr = new MultipartRequest(request, 저장할 공간, 파일 최대 크기, 인코딩 방식);
	//2.새로운 파일명 생성
	String fileName = mr.getFilesystemName("attachedFile"); //현재 파일명
	String ext = fileName.substring(fileName.lastIndexOf(".")); //중간에 혹시 모를 점이 있을 수 있으니까 맨뒤에서 부터 찾기
	String now = new SimpleDateFormat("yyyyMMdd_HMsS").format(new Date());
	String newFileName=now+ext; //새로운 파일명("업로드 일시.확장자")
	//3.파일명 변경
	File oldFile = new File(saveDirectory+File.separator+fileName);
	File newFile = new File(saveDirectory+File.separator+newFileName);
	oldFile.renameTo(newFile);
	//4. 다른 폼값 받기
	String name = mr.getParameter("name");
	String title = mr.getParameter("title");
	String[] cateArray = mr.getParameterValues("cate");
	StringBuffer cateBuf = new StringBuffer();
	if(cateArray==null){
		cateBuf.append("선택없음");
	}else{
		for(String s:cateArray){
			cateBuf.append(s+" ");
		}
	}
	//5.DTO 생성
	MyFileDto dto = new MyFileDto();
	dto.setName(name);
	dto.setTitle(title);
	dto.setCate(cateBuf.toString());
	dto.setOfile(fileName);
	dto.setNfile(newFileName);
	//6.DAO를 통해 데이터베이스에 반영
	MyFileDao dao = new MyFileDao();
	dao.insertFile(dto);
	dao.close();
	//7.파일 목록 jsp로 리디렉션
	response.sendRedirect("FileList.jsp");
}catch(Exception e){
	e.printStackTrace();
	request.setAttribute("errMsg", "파일 업로드 오류");
	request.getRequestDispatcher("FileUploadMain.jsp").forward(request, response);
}
%>
```
### download Logic
```java
String saveDirectory = application.getRealPath("/Storage");
String saveFilename=request.getParameter("nName").trim();
String originFilename=request.getParameter("oName").trim();
try{
	//파일을 찾아서 입력 스트림 생성
	File file=new File(saveDirectory,saveFilename);
	InputStream inStream=new FileInputStream(file);

	//한글 파일명 깨짐 방지
	String client=request.getHeader("User-Agent");
	if(client.indexOf("WOW64")==-1){
		originFilename=new String(originFilename.getBytes("UTF-8"),"ISO-8859-1");
	}else{
		originFilename=new String(originFilename.getBytes("KSC5601"),"ISO-8859-1");
	}
	
	response.reset();
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition","attachment; filename=\""+originFilename+"\"");
	response.setHeader("Content-Length",""+file.length());
	
	//출력 스트림 초기화
	out.clear();
	out=pageContext.pushBody();
	
	//response 내장 객체로 새로운 출력 스트림 생성
	OutputStream outStream = response.getOutputStream();
	byte b[] = new byte[(int)file.length()];
	int readBuffer=0;
	while((readBuffer=inStream.read(b))>0){
		outStream.write(b,0,readBuffer);	
	}
	inStream.close();
	outStream.close();
}catch(FileNotFoundException e){
	e.printStackTrace();
	AlertFunc.alertBack("파일을 찾을 수 없습니다.", out);
}catch(Exception e){
	e.printStackTrace();
	AlertFunc.alertBack("예외가 발생했습니다.", out);
}
%>
```

## Servlet
---
Servlet 작성규칙
```
>>import 해주어야 함. import javax.servlet
public
httpServlet 상속
doGet/doPost 하나라도 반드시 오버라이딩

```

Web.xml 방식과 어노테이션 방식 2가지가 있음.

web.xml 방식을 사용할 때 
```xml
<!-- web.xml안에 아래와 같이 작성해주어야함. -->
  <servlet>
  	<servlet-name>Servlet NAME</servlet-name>
  	<servlet-class>CLASS NAME</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>Servlet NAME</servlet-name>
  	<url-pattern>/13Servlet/MemberAuth.mvc</url-pattern>
  </servlet-mapping>
```

<br>

## 서블릿 어노테이션
---
@WebServlet
```java
@WebServlet("경로")
//어노테이션 안에 내부 매개변수 값을 지정할 수 있음.

@WebServlet(urlPatterns = "/13Servlet/MemberAuth.mvc", initParams= {@WebInitParam(name = "manager", value = "admin")})
```
서블릿 컨테이너에서 서블릿이 생성되고 수정되고 없어졌다가 일련의 과정들이 생기는데 이것을 Lifecycle이라고 함.  

<br>

**Servlet Life Cycle 과정**
```  
PostConstruct <<어노테이션  
---↓↓↓↓↓OVERRIDE↓↓↓↓↓---  
init  
service  
doget/dopost  
destroy  
---↑↑↑↑↑OVERRIDE↑↑↑↑↑---
PreDestroy<<어노테이션  
```

서블릿 구동 방식

<img src="https://velog.velcdn.com/images%2Fimok-_%2Fpost%2F71a1251c-b023-4261-8689-2c722026eb77%2F%EC%84%9C%EB%B8%94%EB%A6%BF%20%EA%B5%AC%EB%8F%99%EC%A0%88%EC%B0%A8.PNG">