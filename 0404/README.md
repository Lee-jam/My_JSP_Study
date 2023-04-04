# 230404 JSP 필기
> 개별개별 서블릿이 생성된다는건 여러개의 서블릿이 만들어진다는 뜻. 클라이언트가   

page안에 있는 속성 : import   
include : file 속성을 통해 JSP 파일이나 외부 파일을 호출하여 삽입  
session나 request에 데이터를 넣어도 될껄 굳이 page에 넣어야 하는 이유에 대해서 생각  
pagecontext는 페이지 이동이 일어날 경우에는 별도의 pagecontext가 존재하여 지정된 값은 같이 옮겨지지 않음.

## Page 이동 방벙
---
### A태그를 이용한 이동


<br>

### response.sendRedirect
클라이언트가 서버로 request 보냈을 때 response가 돌아오고 새 페이지가 연결됨  
```JSP
request.setAttribute("request", "requestValue");

response.sendRedirect("redirect.jsp");

 //redirect.jsp
 //request 속성 값 : <%=request.getAttribute("request") %>
 포워딩될 때 브라우저의 주소 표시줄의  URL이 변경되어 request영역에서 공유한 속성값에 접근할 수 없음.
```

### request.getRequestDispatcher   
클라이언트가 서버로 request 보냈을 때 그 request와 response가 지정한 페이지로 같이 넘어감.   
클라이언트가 요청하면서 전송한 데이터가 그대로 유지함.
```JSP
RequestDispatcher dispatcher = request.getRequestDispatcher("dispatcher.jsp");

	      request.setAttribute("request","requestValue");

	     dispatcher.forward(request, response);

//dispatcher.jsp
//request 속성 값 : <%=request.getAttribute("request") %>
포워딩 되더라도 같은 request영역을 공유하고 있어 주소가 변경 되지않음.
```
차이점 : 연결, 종료 시점이 다름  


## SCOPE
---
Scope : 웹 서버에서 객체 또는 변수가 생성된 후 유효할 수 있는 범위/속성을 공유할 수 있는 유효 범위  
```
Page Scope : 페이지 내에서 지역변수처럼 사용

Request Scope : http요청을 WAS가 받아서 웹 브라우저에게 응답할 때까지 변수가 유지되는 경우 사용

Session Scope : 웹 브라우저 별로 변수가 관리되는 경우 사용

Application Scope : 웹 어플리케이션이 시작되고 종료될 때까지 변수가 유지되는 경우 사용
```


session은 연관이 없더라도 브라우저 상에 데이터를 남김 예전에 로그인 상태 유지할때 사용?

application은 브라우저를 꺼도 set한 데이터가 남아있음.
 


## Cookie
---
```
	Cookie cookie = new Cookie("cookie","뉴진스"); //내가만든쿠키 생성
	cookie.setPath(request.getContextPath()); //쿠키를 어디에 적용할 건지 적용 경로 설정
	cookie.setMaxAge(3600); //쿠기 유지기간 설정 초단위
	response.addCookie(cookie); //응답헤더에 넣어서 클라이언트에게 전달
```
팝업 구현하기 (오늘그만보기, 닫기)
ajax

아이디 저장 구현하기

jsp는 자바 클래스에서 처리된 내용을 화면에 뿌려주는 역할일 뿐 JSP에 모든 동작을 작성하면 안되는 건 아니지만 선호하지 않음.

JDBC

어플리케이션 간 상호간 연결하는 API가 있음.
자바 어플리케이션과 DBMS 간 연결하는 것이 JDBC
DBMS마다 적용되는 JDBC 가 다름

ojdbc = 오라클 db와 연결해주는 jdbc

### DB 속성을 방을 때 방식 세가지  
1. 직접 자바에 작성하는 경우  
2. JSP 내부에 스크립틀릿으로 파라미터 값으로 이어받는 경우  
3. web.xml에 param 값으로 받는 경우  
