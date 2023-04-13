package m2board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.AlertFunc;
import utils.FileUtil;

@WebServlet("/m2board/pass.do")
public class PassController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//req.setAttribute("mode", req.getParameter("mode")); 호출방식의 차이가 생김
		req.getRequestDispatcher("/14M2Board/Pass.jsp").forward(req, resp); // 호출방식의 차이가 생김
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idx = req.getParameter("idx");
		System.out.println(idx);
		String mode = req.getParameter("mode");
		String pass = req.getParameter("pass");
		
		//비밀번호 확인
		MBoardDAO dao = new MBoardDAO();
		System.out.println(pass+" "+idx);
		boolean confirmed = dao.confirmPassword(pass,idx);
		dao.close();
		
		//무엇을 진행할 지 삭제인지 수정인지
		if(confirmed) {//비번일치
			if(mode.equals("edit")) {//수정
				HttpSession session = req.getSession(); //request안에 있는 세션을 받음, new 를 써서 만들면 내가 만든 새로운 세션이 됨.
				session.setAttribute("pass", pass);
				resp.sendRedirect("../m2board/Edit.do?idx="+idx);
			}else if(mode.equals("delete")) {//삭제
				dao = new MBoardDAO();
				MBoardDTO dto = dao.getView(idx);
				int result = dao.deletePost(idx);//게시물 삭제
				dao.close();
				if(result==1) {
					String saveFileName=dto.getNfile();
					FileUtil.deleteFile(req,"/Storage",saveFileName);
				}
				AlertFunc.alertLocation(resp, "삭제되었습니다.", "../m2board/list.do");
			}
		}else {
			AlertFunc.alertBack(resp, "비밀번호 검증이 실패했습니다.");
		}
		
	}
}
