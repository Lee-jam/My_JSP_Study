개별개별 서블릿이 생성된다는건 여러개의 서블릿이 만들어진다는 뜻.
클라이언트가 
page안에 있는 속성 : import 
include : file 속성을 통해 JSP 파일이나 외부 파일을 호출하여 삽입
session나 request에 데이터를 넣어도 될껄 굳이 page에 넣어야 하는 이유에 대해서 생각
pagecontext는 페이지 이동이 일어날 경우에는 별도의 pagecontext가 존재하여 지정된 값은 같이 옮겨지지 않음.


response.sendRedirect 새연결
클라이언트가 서버에다가 리퀘스트를 보냈을 때 response가 돌아오고 새 페이지가 연결됨
request.getRequestDispatcher 
클라이언트가 서버에다가 리퀘스트를 보냈을 때 그 리퀘스트와 리스폰트가 지정한 페이지로 같이 넘어감.  
차이점 : 연결, 종료 시점이 다름

session은 연관이 없더라도 브라우저 상에 데이터를 남김 예전에 로그인 상태 유지할때 사용?

application은 브라우저를 꺼도 set한 데이터가 남아있음.



Cookie

팝업 구현하기 (오늘그만보기, 닫기)
ajax

아이디 저장 구현하기

jsp는 자바 클래스에서 처리된 내용을 화면에 뿌려주는 역할일 뿐 JSP에 모든 동작을 작성하면 안되는 건 아니지만 선호하지 않음.

JDBC

어플리케이션 간 상호간 연결하는 API가 있음.
자바 어플리케이션과 DBMS 간 연결하는 것이 JDBC
DBMS마다 적용되는 JDBC 가 다름

직접 자바에 작성하는 경우
JSP 내부에 스크립틀릿으로 파라미터 값으로 이어받는 경우
web.xml에 init param 값으로 받는 경우
ojdbc = 오라클 db와 연결해주는 jdbc