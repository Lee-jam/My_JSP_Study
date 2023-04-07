# 230407
Paging
1000개 만개면 한화면에 뿌리기 힘듬  
하단에 페이지 버튼이 생기는걸 Paging이라고 함.

한페이지에 표시할 총 게시물의 갯수  
한페이지에 표시할 총 페이지의 갯수

rownum은 조건절이 먼저 실행 되고 붙는 경우가 있기 때문에 주의해야 함. 범위를 설정해주는 상태에서 

## EL Expression language
---
기존 jsp에서 사용하던 표현식 : <%= %>

변수나 메소드의 값을 출력할 때 사용하는 스크립트 언어  
4가지 영역(page,request,session,application) 속성 값  
내장 객체의 속성 사용  
산술, 비교, 논리 연산 호출 사용 가능  
${속성}  
액션태그나 JSTL과 혼용이 가능하지만 JSP스크립트 요소(선언부, 표현식, 스크립틀릿)들은 혼용해서 사용할 수 없음.  

### 내장객체 전달  
```jsp
<%
	pageContext.setAttribute("scopeVal","페이지 영역");
	request.setAttribute("scopeVal","요청 영역");
	session.setAttribute("scopeVal","세션 영역");
	application.setAttribute("scopeVal","어플리케이션 영역");
%>
	<h2>내장객체 속성 값 출력</h2>
	<ul>
		<li>${pageScope.scopeVal}</li>
		<li>${requestScope.scopeVal}</li>
		<li>${sessionScope.scopeVal}</li>
		<li>${applicationScope.scopeVal}</li>
	<h2>영역지정없이 속성 값 출력</h2>
		<li>${scopeVal}</li>
	</ul>
```
### 폼 전달  
```jsp
<!--다른 화면 form에서 submit 하여 데이터를 전달 -->
	<ul>
		<li>${param.name}</li>
		<li>${param.gender}</li>
		<li>${param.grad}</li>
		<li>${paramValues.hobby[0]}
			${paramValues.hobby[1]}
			${paramValues.hobby[2]}
			${paramValues.hobby[3]}
			${paramValues.hobby[4]}
		</li>
	</ul>
```
### 객체 전달  
```jsp
	<h2>객체 읽기</h2>
	<ul>
		<li><%=p.getName()%>,<%=p.getAge()%></li>
		<li>${personObj.name}, ${personObj.age}</li>
		<li>String ${requestScope.stringObj}</li>
		<li>Integer ${integerObj}</li>
	</ul>
	<h2>param 매개변수</h2>
	<ul>
		<li>${param.back+param['leeback']}</li>
		<li>${param.back}+${param['leeback']}</li>
	</ul>
```
### 연산자
```
<%
	int num1=100;
	pageContext.setAttribute("num2",97);
	pageContext.setAttribute("num3","3");
	pageContext.setAttribute("num4","23");
%>
	<h3>변수 선언 및 할당</h3>
	스크립틀릿 선언 ${num1}<br> //num1 변수를 선언
	영역 저장 ${num2}<br> //num2는 기존에 있던 값 출력
	변수 할당 즉시 출력${num1=11}<br> //num1 = 11이라는 값을 할당하고 출력
	변수 할당 이후 출력${num1=22;'입력'} =>> ${num1}<br> //출력 : 변수 할당 이후 출력입력 =>> 22
	num1=${num1},num2=${num2},num3=${num3},num4=${num4}
	
	<h3>산술연산자</h3>
	num1+num2=${num1+num2}<br> //넘버+넘버
	num1+"34"=${num1+"34"}<br> //넘버+문자인데 56이 됨
	num2+"이십"=\${num2+"이십"}<br> 
	<!-- 여기 EL에서 사용하는 +는 자바에서 사용되는 +와 다른 개념으로 작동되기 때문에 정상 작동이 되지 않는다. -->
	"삼십"+"이십"=\${"삼십"+"이십"}<br>
	num1-num2=${num1-num2}<br>
	num1*num2=${num1*num2}<br>
	num4/num3=${num4/num3}, ${num4 div num3}<br>
	num4%num3=${num4%num3}, ${num4 mod num3}<br>
	
	<h3>비교연산자</h3>
	num4 > num3 ${num4 gt num3}<br>
	num4 < num3 ${num4 lt num3}<br>
	num4 >= num3 ${num4 ge num3}<br>
	num4 <= num3 ${num4 le num3}<br>
	num4 == num3 ${num4 eq num3}<br>
	num4 != num3 ${num4 ne num3}<br>
	
	<h3>논리 연산자</h3>
	num3<=num4 && num3 == num4 ${num3 le num4 and num3 eq num4}<br>
	num3>num4 || num3 != num4 ${num3 ge num4 or num3 ne num4}<br>
	
	
	
<%
	pageContext.setAttribute("num5", 7);
	pageContext.setAttribute("num6", "12");
	pageContext.setAttribute("nullStr", null);
	pageContext.setAttribute("emptyStr", "");
	pageContext.setAttribute("zeroLeng", new Integer[0]);
	pageContext.setAttribute("zeroSize", new ArrayList<>());
%>
	<h3>empty</h3>
	${empty nullStr}<br>
	${empty emptyStr}<br>
	${empty zeroLeng}<br>
	${empty zeroSize}<br>
	
	<h3>삼항 연산자</h3>
	num1>num2?"참":"거짓" =>> ${num1 gt num2?"num1 큼":"num2 큼"}
	
	<h3>null</h3>
	null+10= ${null+10}<br>
	null String+ 10= ${nullStr+10}<br>
	param.no value>10 ${param.noVal > 10}
```

### taglib
```
taglib을 사용하기 위한 taglib.tld 파일 생성 방법

new -> other -> xml파일 -> Create file using a DTD or XML Schema file -> catalog entry -> jsptaglibrary_2.0 선택 -> prefix에서 j2ee를 누르고 edit로 삭제, 확인 -> finish
```