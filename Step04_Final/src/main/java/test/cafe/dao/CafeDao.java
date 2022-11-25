package test.cafe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import test.cafe.dto.CafeDto;
import test.util.DbcpBean;

public class CafeDao {
	private static CafeDao dao;
	/*
	 * static 메소드는 생성자를 호출하지 ㅇ낳고 클래스명으로 바로 호출하기 때문에
	 * 메소드 호출전에 무언가 준비 작업을 하고 싶다면 static 블럭 안에서 하면 된다.
	 * static 블ㄹ럭은 해당 클래스를 최초로 사용할때 한번만 실행되기 떄문에
	 * 초기화 작업을 하기 적당한 블럭이다.
	 */
	
	static {
		if(dao==null) {
			dao=new CafeDao();
		}
	}
	
	private CafeDao() {}
	
	public static CafeDao getInstance() {
		return dao;
	}
	public boolean insert(CafeDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "insert into board_cafe"
					+ " (num,writer,title,content,viewCount,regdate)"
					+ " values(board_cafe_seq.nextval,?,?,?,0,sysdate)";
			// ? 에 바인딩할게 있으면 해주고
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			
			// INSERT OR UPDATE OR DELETE 문을 수행하고 수정되거나, 삭제되거나, 추가된 ROW 의 갯수 리턴 받기
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}	
	}
	public List<CafeDto> getList(CafeDto dto){
		
		List<CafeDto> list=new ArrayList<CafeDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//select 문의 뼈대 구성하기
			String sql = "SELECT *"
					+ " FROM"
					+ "	(SELECT result1.*, ROWNUM AS rnum"
					+ "	FROM"
					+ "		(SELECT num,writer,title,viewCount, TO_CHAR(regdate, 'YYYY.MM.DD HH24:MI') AS regdate"
					+ "		FROM board_cafe"
					+ "		ORDER BY num DESC) result1)"
					+ " WHERE rnum BETWEEN ?  AND ?";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩 할게 있으면 하기
			pstmt.setInt(1, dto.getStartRowNum());
			pstmt.setInt(2, dto.getEndRowNum());
			//sql 문 수행하고 ResultSet 객체 얻어내기
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				//select 된 row 하나의 정보를 CafeDto 객체를 생성해서 담고 
				CafeDto tmp=new CafeDto();
				tmp.setNum(rs.getInt("num"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setTitle(rs.getString("title"));
				tmp.setViewCount(rs.getInt("viewCount"));
				tmp.setRegdate(rs.getString("regdate"));
				//CafeDto 객체의 참조값을 List 에 누적 시키기
				list.add(tmp);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return list;
	}
   
	//글 하나의 정보를 리턴해주는 메소드
	public CafeDto getData(int num) {
		CafeDto dto=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//select 문의 뼈대 구성하기
			String sql = "SELECT writer, title, content, viewCount, regdate"
					+ " FROM board_cafe"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩 할게 있으면 하기
			pstmt.setInt(1, num);
			//sql 문 수행하고 ResultSet 객체 얻어내기
			rs = pstmt.executeQuery();
			if (rs.next()) {
	            dto=new CafeDto();
	            dto.setNum(num);
	            dto.setWriter(rs.getString("writer"));
	            dto.setTitle(rs.getString("title"));
	            dto.setContent(rs.getString("content"));
	            dto.setViewCount(rs.getInt("viewCount"));
	            dto.setRegdate(rs.getString("regdate"));
         }

		} catch (Exception e) {
    	    e.printStackTrace();
		} finally {
			
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {}
		}
      return dto;      
   }
	
	
	public boolean update(CafeDto dto) {
	Connection conn = null;
	PreparedStatement pstmt = null;
	int rowCount = 0;
	
	try {
		conn = new DbcpBean().getConn();
		String sql = "update board_cafe"
				+ " Set title=?,content=? "
				+ " where num=?";
		// ? 에 바인딩할게 있으면 해주고

		pstmt = conn.prepareStatement(sql);
		// INSERT OR UPDATE OR DELETE 문을 수행하고 수정되거나, 삭제되거나, 추가된 ROW 의 갯수 리턴 받기
		pstmt.setString(1, dto.getTitle());
		pstmt.setString(2, dto.getContent());
		pstmt.setInt(3,dto.getNum());
		rowCount = pstmt.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
		}
	}
	if (rowCount > 0) {
		return true;
	} else {
		return false;
		}
	}
	//글의 갯수를 러턴하는 메소드
	public int getCount() {
		int count=0;
		//필요한 객체를 담을 지역변수 생성
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//Connection pool 에서 Connection 객체를 하나 얻어온다.
			conn=new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성하기
			String sql=" SELECT MAX(ROWNUM) AS num FROM board_cafe";
			//sql 문의 ? 바인딩할게 있으면 한다.
			
			pstmt=conn.prepareStatement(sql);
			//select  문을 수행하고 결과값을 받아온다.
			rs=pstmt.executeQuery();
			//반복문을 돌면서 ResultSet에서 필요한 값을 얻어낸다.
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch (Exception e) {}
		}
		return count;
	}
	
	
	//글의 조회수를 올리는 메소드
	public boolean addViewCount(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		ResultSet rs=null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "update board_cafe"
					+ " SET viewCount=viewCount+1"
					+ " where num=?";
			
			// ? 에 바인딩할게 있으면 해주고

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			// INSERT OR UPDATE OR DELETE 문을 수행하고 수정되거나, 삭제되거나, 추가된 ROW 의 갯수 리턴 받기
			
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	
	//글의 정보 삭제 메소드
	public boolean delete(CafeDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "delete from board_cafe"
					+ " where num=?";
			// ? 에 바인딩할게 있으면 해주고

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,dto.getNum());
			
			// INSERT OR UPDATE OR DELETE 문을 수행하고 수정되거나, 삭제되거나, 추가된 ROW 의 갯수 리턴 받기
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
}
