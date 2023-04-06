package board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class BoardDAO extends JDBConnect{
	public BoardDAO() {
		super();
	}
	
	public int getTotalCount(Map<String,Object> param) {
		int totalCount=0;
		String sql="select count(*) from board";
		
		if(param.get("findWord")!=null) {
			sql += " where "+param.get("findCol")+" like '%"+param.get("findWord")+"%'";
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();
			totalCount = rs.getInt(1);
			
		}catch(Exception e) {System.out.println("게시물 카운트 중 에러");}
		
		return totalCount;
	}
	public List<BoardDTO> getList(Map<String, Object> param){
		List<BoardDTO> bl = new Vector<>();
		String sql="select * from board";
		
		if(param.get("findWord")!=null) {
			sql += " where "+param.get("findCol")+" like '%"+param.get("findWord")+"%'";
		}
		sql+=" order by num desc";
		try {
			psmt = con.prepareStatement(sql);
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("Content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				bl.add(dto);
			}
			
			
		}catch(Exception e) {System.out.println("게시물을 읽는 중 에러");}
		
		return bl;
	}
	
	public int insertWrite(BoardDTO dto) {
		int res=0;
		try {
			String sql = "insert into board(num,title,content,id,visitcount) values(seq_board_num.nextval,?,?,?,0)";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			res=psmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("게시물 입력 중 에러");
			e.printStackTrace();
		}
		
		return res;
		
	}
	//게시물 중 하나 읽어보기
	 public BoardDTO getView(String num) {
         BoardDTO dto = new BoardDTO();

         String sql = "SELECT b.*,m.NAME  FROM BOARD b, MEMBER m WHERE num=? AND b.id=m.id";
         try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1,num);
            rs = psmt.executeQuery();
            if (rs.next()) {
               dto.setNum(rs.getString("num"));
               dto.setTitle(rs.getString("title"));
               dto.setContent(rs.getString("content"));
               dto.setId(rs.getString("id"));
               dto.setPostdate(rs.getDate("postdate"));
               dto.setVisitcount(rs.getString("visitcount"));
               dto.setName(rs.getString("name"));
            }
         } catch (Exception e) {
            e.printStackTrace();
         }

         return dto;
   }
   
	//조회수 증가
	public void updateVisitCount(String num) {
		String sql="update board set visitcount=visitcount+1 where num=?";
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, num);
			psmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 에러");
			e.printStackTrace();
		}
	}
	public int deletePost(String num) {
		int res=0;
		try {
			String sql = "delete from board where num=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, num);
			res=psmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("게시물 삭제 중 에러");
			e.printStackTrace();
		}
		
		return res;
		
	}
	public int updateEdit(BoardDTO dto) {
		int res = 0;
		try {
			String sql = "update board set title=?, content=? where num=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			res=psmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("게시물 수정 중 에러");
			e.printStackTrace();
		}
		return res;
	}
}
