# 230405 JSP 

애초에 커넥션을 생성하여 모아두고 다른 사람이 들어오면 해당하는 커넥션을 쓰고 반납하고
이러한 커넥션을 모아두는 것을 커넥션 풀이라고 함.

커넥션 풀을 만들기전에 server.xml 과 context.xml

```
<Resource   auth="Container" 
            driverClassName="oracle.jdbc.OracleDriver"
            initialSize="0" 
            maxIdle="20" 
            maxTotal="20" 
            maxWaitMillis="5000" 
            name="dbcp_my_oracle" 
            url="jdbc:oracle:thin:@localhost:1521:xe" 
            username="USER_ID" 
            password="USER_PW" 
            type="javax.sql.DataSource"/>
```

```
<ResourceLink   global="dbcp_my_oracle" 
                name="dbcp_my_oracle"
                type="javax.sql.DataSource"/>
```
참고하고있는 서버 툴 자체의 파일에서 값을 추가해주면 서버 재생성 시에도 변경값 그대로 적용됨.

### ❗ 커넥션 시 순서
```
Driver load → Connection → Statement||PreparedStatement(SQL문 실행 객체) → → ResultSet → Close  

정적인 쿼리문 => Statement 
동적인 쿼리문 => PreparedStatement 
SQL 문에 ?가 있으면 Prepardstatement를 사용
```


### ❗ 결과를 저장하는 excute
```
execute : 모든 SQL 구문에 수행 가능하며 Boolean타입으로 반환
executeQuery : SQL 구문 중 SELECT 구문에만 수행 가능하며 ResultSet 객체에 쿼리문 동작결과를 반환하여 저장  
executeUpdate : SQL 구문 중 SELECT 구문을 제외만 나머지 구문에 동작 가능하며 int 타입으로 반환 (Create랑 drop 은 -1)
```

❗ 배포서술자는 application객체를 이용하여 정의한 param 값을 param name으로 가져와 사용할 수 있음.

## Action Tag
---
JSP 표준 태그

작성 방식 : XML 표준 문법을 따름(반드시 종료 태그해야함...태그 사이에 주석X)
표현식 구현 가능(<%=%>)

||액션태그|지시어|
|--|--|--|
|표현식|사용 가능|사용 불가|
|포함방식|결과만 포함|하나의 페이지로 포함|
|변수|별개|하나의 페이지 변수로 변수명이 겹치면 안됨.|
|page 영역|page공유x|page공유x|

### include
```
<jsp:include>: 외부 파일을 현재 파일에 포함
	지시어 <%@ include file="filePath" %>
	두개가 차이가 있음.
	<jsp:include> : 적용시키면 적용한 페이지의 결과물만 가져옴. (사이에 표현식이 구현이 가능함.)
	<%@ include file="filePath" %> : 적용시키면 적용 페이지와 적용된 페이지 두개를 하나의 페이지로 봄
```

### forward
```
<jsp:forward> : 다른 페이지로 요청(request)을 넘김
request.getRequestDispatcher().forward(request,response)

<jsp:useBean>,<jsp:setProperty>,<jsp:getProperty>
	:자바빈즈 생성 값 할당 불러오기
	<jsp:useBean id="구분자" class="대상클래스" scope="기본값 page[저장될 영역]"/>
	<jsp:setProperty name = "자바빈즈 id" property="속성명(멤버변수명)" value"저장할 값"/>
	<jsp:getProperty name = "자바빈즈 id" property="속성명(멤버변수명)"/>
	
<jsp:param>: 다른 페이지로 매개변수 전달
	<jsp:include> <jsp:forward> 함께 사용
```

### 화면이동
```
	<jsp:forward>
	request.requestDispatcher().forward()
	javascript : location.href(), location.replace()
	response.sendRedirect()
	<meta http-equiv=refresh content="시간;url=목적지">
```

DB에 접근해서 로그인 처리하는 것을 하려고 함.
VO(Value Object) : 값 오브젝트로써 값을 위해 쓰임.  
DAO(Data Access Object) : DB에 접근하는 것에 관련된 객체
DTO(Data Transfer Object) : 계층 간 데이터 교환을 위해 사용하는 객체로 로직을 가지지 않는 순수한 데이터 객체
 - 유저가 자신의 브라우저에서 데이터를 입력하여 form에 있는 데이터를 DTO에 넣어서 전송,
 해당 DTO를 받은 서버가 DAO를 이용하여 데이터베이스로 데이터를 업데이트함.

## Design Pattern
---
Model 1 
Model 2(MVC(model view controller) Model)