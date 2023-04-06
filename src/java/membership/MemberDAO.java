package membership;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {
	public MemberDAO(String driver, String url, String id, String pw) {
		super(driver,url,id,pw);
	}
	public MemberDTO getMember(String uid,String upw){
		String query = "Select * from member where ID=? AND PW=?"; //물음표가 있으면 PrepareSatement 사용
		MemberDTO dto = new MemberDTO();
		
		try {
		psmt = con.prepareStatement(query);
		psmt.setString(1, uid);
		psmt.setString(2, upw);
		rs=psmt.executeQuery();
		
		if(rs.next()) {
			dto.setId(rs.getString("id"));
			dto.setPw(rs.getString("pw"));
			dto.setName(rs.getString("name"));
			dto.setRegdate(rs.getString("regdate"));
		}
		}
		catch(Exception e) {}
		return dto;
	}
}
