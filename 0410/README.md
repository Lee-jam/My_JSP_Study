#  230410 JSP 필기
JSTL : JSP Standard Tag Library  
기본적으로 jsp에서 빈번하게 사용하는 반복문 조건문을 처리하는 동작을 모아 표준으로 만든 태그 라이브러리

해당하는 태그라이브러리를 통해 사용하게 됨.

|종류|기능|접두어(prefix)|uri|
|--|--|--|--|
|core|변수선언, 조건문, 반복문, URL 처리|c|uri="http://java.sun.com/jsp/jstl/core"|
|formatting|숫자, 날짜, 시간 등 포맷 지정|fmt|uri="http://java.sun.com/jsp/jstl/fmt"|
|xml|xml 파일 parsing|x|uri="http://java.sun.com/jsp/jstl/xml"|
|function|컬렉션, 문자열 처리|fn|uri="http://java.sun.com/jsp/jstl/functions"|
|sql|데이터베이스 연결 및 쿼리 실행|sql||


## Core
---
**변수 선언**<br>
JSP 문으로 setAttribute를 해서 변수를 선언하는 방식과 JSTL의 Core Tag Library를 사용한 변수 선언 방식은 차이가 있음.
```jsp
JSP 문법 방식
request.setAtrribute("변수값",변수명)

JSTL Core
<c:set var=변수명 value="변수값"/>
<c:set var=변수명 value="JSP표현식"/>
<c:set var=변수명 value="EL 문법"/>
<c:set var=변수명 value="변수값" scope="page"/>  //scope 기본 값은 page
```
Core 태그의 Set에서 자바빈즈 생성자를 값으로 사용하고 target과 property를 사용하여 값을 설정할 수 있음.
```java
class Person{
	private String name;
	private int age;
	public Person(){

	}
	public Person(String name, int age){
		this.name=name;
		this.age=age;
	}
}
```
위와 같은 만들어진 자바빈즈를 활용하여 아래와 같이 예시를 들 수 있음.

```jsp
<c:set var="person" value="<%=new Person()%>">
<c:set target="${person}" property="name" value="아무개">
<c:set target="${person}" property="age" value="50">
```
> 외에도 List, Map 등 set을 할 수 있음.
```jsp
//List 예시
	<h4>List</h4>
	<!-- 객체가 만들어져있다는 가정하기 위해 스트립틀릿 임시 사용 -->
	<%
		ArrayList<Person> pList = new ArrayList();
		pList.add(new Person("james",55));
		pList.add(new Person("william",60));
	%>
	<c:set var="personList" value="<%=pList%>" scope="request"/>
		<ul>
		<li>이름: ${requestScope.personList[0].name}</li>
		<li>나이: ${personList[0].age}</li>
	</ul>
	//Person 타입을 넣을 수 있는 list 타입의 pList를 변수로 세팅

//Map 예시
	<h4>Map</h4>
	<%
		Map<String, Person> pMap = new HashMap();
		pMap.put("personArgs1",new Person("superman",65));
		pMap.put("personArgs2",new Person("superwoman",60));
	%>
	<c:set var="personMap" value="<%=pMap%>" scope="request"/>
		<ul>
		<li>이름: ${requestScope.personMap.get("personArgs1").name}</li>
		<li>나이: ${personMap.get("personArgs1").age}</li>
		<li>이름: ${requestScope.personMap.personArgs2.name}</li>
		<li>나이: ${personMap.personArgs2.age}</li>
	</ul>
```

<br>

**조건문 IF,Choose**<br>
- if 문법
```jsp
<c:if test="조건식" var="변수명"/>
```
> 간단한 조건식이나 조건 량이 많지 않을 때 사용하는게 좋을듯 함.

- Choose 문법
```jsp
<c:choose>
	<c:when test="${avg ge 90}">수</c:when>
	<c:when test="${avg ge 80}">우</c:when>
	<c:when test="${avg ge 70}">미</c:when>
	<c:when test="${avg ge 60}">양</c:when>
	<c:when test="${avg lt 60}">가</c:when>
</c:choose>
```
> 위의 choose 문을 if 문으로 바꾸면 90 점일때 수우미양 까지 나오게 된다.

<br>

**반복문 forEach, enhanced for, forTokens**<br>
- forEach 문법
```jsp
	<h4>일반 for 문</h4>
	<c:forEach var="i" begin="1" end="3" step="1">
		<p>반복 ${i}</p>
	</c:forEach>
	
	<h4>반복문 속성</h4>
	<table border="1">
	<c:forEach begin="3" end="7" var="i" varStatus="loop">
		<tr>
			<td>count:${loop.count}</td>
			<td>index:${loop.index}</td>
			<td>current:${loop.current}</td>
			<td>first:${loop.first}</td>
			<td>last:${loop.last}</td>
			<td>i:${i}</td>
		</tr>
	</c:forEach>
	</table>
```
- enhanced for 문법
```jsp
	<h4>enhanced for문</h4>
	<%
		String[] rainbow={"빨","주","노","초","파","남","보"};
	%>
	<c:forEach items="<%=rainbow%>" var="color">
	<span>${color}</span><br>
	</c:forEach>
```
**JSTL에서 for문과 enhanced for문의 차이점**
```
간단히 생각하면 for문은 기존 초기화,조건문,증감식을 넣고 조건에 만족한 만큼 반복하고 <br>
enhanced for 문(향상된 for문)은 자바에서 쓰던 향상된 for문처럼 반복 가능한 변수를 items로 지정하고 var변수로 하나씩 할당하면서 반복하는 방식임.
```
- forTokens 문법
```jsp
<%
	String rainbow = "빨,주,노,초,파,남,보";
%>
<c:forTokens items="<%=rainbow%>" delims="," var="color">
	<span style="color:${color}">${color}</span>
</c:forTokens>
```
> forTokens는 문자열을 입력하고 delims(분리자)를 사용하여 분리를 하여 분리된 값대로 하나씩 반복하여 반환하는 형식으로 쉽게 생각하면 split("문자열",",")로 배열을 만들고 그 배열을 향상된 for문으로 반환하는 식.

<br>

**URL**<br>
url 문법
```jsp
	<h4>url로 링크</h4>
	<c:url var="url" value="/11JSTL/include/OtherPage.jsp">
		<c:param name="param1" value="수박"/>
		<c:param name="param2" value="사과"/>
	</c:url>
	<a href="${url}">other page</a>
// url을 지정하고 내부에서 지정된 param 값과 함께 지정한 url로 전송한다.
// 만약 url 내부가 아닌 밖에서 보낼 경우에는 scope설정을 해주어야 한다.
```

<!--<c:otherwise>${num}은 홀수입니다.</c:otherwise>-->

core에서 import는 변수 선언 후에는 변수를 EL로 다시 선언 해주어야 사용할 수 있고
변수 선언을 하지 않았으면 즉시 사용됨.

## Formatting
---
데이터 타입을 자기 입맛대로 변경할 수 있는 태그 라이브러리
```jsp
	<h4>국제화 태그</h4>
	<c:set var="number1" value="12345"/>
	콤마 포함 : <fmt:formatNumber value="${number1}"/><br>
	콤마 미포함 : <fmt:formatNumber value="${number1}" groupingUsed="false"/><br>
	<fmt:formatNumber value="${number1}" type="currency" currencySymbol="$" var="print1"/><br>
	통화기호 $ : ${print1}
	<fmt:formatNumber value="0.03" type="percent" var="print2"/><br>
	퍼센트 : ${print2}
	<fmt:formatNumber value="1234655446.456" pattern="#,#00.00" var="print3"/><br>
	<fmt:formatNumber value="1234655446.456" pattern="0,000.00" var="print4"/><br>
	 : ${print3}<br>
	 : ${print4}
	<c:set var="number2" value="6,7879.01"/>
	<fmt:parseNumber value="${number2}" pattern="00,000.00" var="print5"/><br>
	소수점 : ${print5}
	<fmt:parseNumber value="${number2}" integerOnly="true" var="print6"/><br>
	소수점 : ${print6}<br>

	<h4>날짜 포맷</h4>
	
	<c:set var="today" value="<%=new java.util.Date() %>" />
	${today}<br>
	full:<fmt:formatDate value="${today}" type="date" dateStyle="full"/><br>
	short:<fmt:formatDate value="${today}" type="date" dateStyle="short"/><br>
	long:<fmt:formatDate value="${today}" type="date" dateStyle="Long"/><br>
	default:<fmt:formatDate value="${today}" type="date" dateStyle="default"/><br>
	
	<h4>시간 포맷</h4>
	full:<fmt:formatDate value="${today}" type="time" timeStyle="full"/><br>
	short:<fmt:formatDate value="${today}" type="time" timeStyle="short"/><br>
	long:<fmt:formatDate value="${today}" type="time" timeStyle="Long"/><br>
	default:<fmt:formatDate value="${today}" type="time" timeStyle="default"/><br>
	
	<h4>날짜/시간 표시</h4>
	<fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/><br>
	
	<fmt:formatDate value="${today}" type="both" pattern="yyyy-MM-dd hh:mm:ss"/><br>
	
	<h4>타임존 설정</h4>
	<fmt:timeZone value="GMT">
		<fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/><br>
	</fmt:timeZone>
	<fmt:timeZone value="America/Chicago">
		<fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/><br>
	</fmt:timeZone>
	
	<h4>로컬 설정</h4>
	한글: <fmt:setLocale value="ko_kr"/>
   <fmt:formatNumber value="10000" type="currency"/>
   <fmt:formatDate value="${today}"/><br>
   일어: <fmt:setLocale value="ja_JP"/>
   <fmt:formatNumber value="10000" type="currency"/>
   <fmt:formatDate value="${today}"/><br>
   영어: <fmt:setLocale value="en_US"/>
   <fmt:formatNumber value="10000" type="currency"/>
   <fmt:formatDate value="${today}"/><br>
	<!-- parseDate : formatDate 반대 개념 -->
	<!-- requestEncoding : 인코딩 타입을 정의 -->
```

## xml
---
xml에 저장된 데이터를 불러와 사용
```jsp
	<c:import url="./include/FruitList.xml" var="fruitlist" charEncoding="UTF-8"></c:import>
	<x:parse xml="${fruitlist}" var="flist"/><br>
	<x:out select="$flist/fruitlist/fruit[1]/name"/><br>
	<x:out select="$flist/fruitlist/fruit[1]/from"/><br>
	<x:out select="$flist/fruitlist/fruit[1]/price"/><br>
	
	<table border="1">
		<tr>
			<th>이름</th>
			<th>원산지</th>
			<th>가격</th>
		</tr>
		<x:forEach select="$flist/fruitlist/fruit" var="fruit">
			<tr>
				<td><x:out select="name"/><td>
				<td><x:out select="from"/><td>
				<td><x:out select="price"/><td>
			</tr>
		</x:forEach>
	</table>
```
## function
---
jstl에서 함수처리를 하기 위해 만든 태그 라이브러리로 여러 종류의 함수들이 복합되있음.
```jsp
	length:	${fn:length('123123')}<br/>
	toUpperCase: ${fn:toUpperCase('sss')}<br/>
	toLowerCase: ${fn:toLowerCase('SSS') }<br/>
	substring: ${fn:substring("check",1,3) }<br/>
	substringAfter: ${fn:substringAfter('applepie','pp') }<br/>
	substringBefore: ${fn:substringBefore('applepie','pp') }<br/>
	trim: ${fn:trim(' apple pie ')}<br/>
	replace: ${fn:replace('apple phone','apple','samsung')}<br/>
	indexOf: ${fn:indexOf('applepie','e') }<br/>
	startsWith: ${fn:startsWith('applepie','e') }<br/>
	endsWith: ${fn:endsWith('applpie','e') }<br/>
	contains: ${fn:contains('applEpiE','e') }<br/>
	containsIgnoreCase: ${fn:containsIgnoreCase('applEpiE','e') }<br/>
	<c:set var='list' value="${fn:split('a,p,p,l,e,p,i,e',',') }" />
	split:
	<c:forEach var="l" items="${list}" varStatus="stat" >
	${l}
	</c:forEach>
	<br/>
	join: ${fn:join(list,',')}<br/>
	escapeXml: ${fn:escapeXml('<strong>is delicious.</strong>') }<br/>
```