package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {
	private Connection conn;
	private ResultSet rs;
	
	public BoardDAO() { //실제로 MySQL에 접속해주는 부분
		try {
			String dbURL = "jdbc:mysql://localhost:3306/DJG?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "twins5302";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() { //현재 시간을 가져오는 함수, 게시판 게시글 작성할 때 작성시간을 넣어줌
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; //데이터베이스 오류
	}
	
	public int getNext() {
		String SQL = "SELECT boardID FROM Board ORDER BY boardID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //첫 번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public int write(String boardTitle, String userID, String boardContent) {
		String SQL = "INSERT INTO Board VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()); //값을 하나씩 넣어줄 수 있도록, 다음에 쓰여야 할 게시글 번호
			pstmt.setString(2, boardTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, boardContent);
			pstmt.setInt(6, 1); //available이니까 글 작성했을때 글 보여지는 형태
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public ArrayList<Board> getList(int pageNumber) {
		String SQL = "SELECT * FROM Board WHERE boardID < ? AND boardAvailable = 1 ORDER BY boardID DESC LIMIT 10";
		ArrayList<Board> list = new ArrayList<Board>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();
				board.setBoardID(rs.getInt(1));
				board.setBoardTitle(rs.getString(2));
				board.setUserID(rs.getString(3));
				board.setBoardDate(rs.getString(4));
				board.setBoardContent(rs.getString(5));
				board.setBoardAvailable(rs.getInt(6));
				
				list.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	
	public boolean nextPage(int pageNumber) { //게시글이 10 단위로 끊기는 경우에는 다음 페이지가 없음. 페이징 처리를 위한 함수
		String SQL = "SELECT * FROM Board WHERE boardID < ? AND boardAvailable = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true; //다음 페이지로 넘어갈 수 있음
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; 
	}
	
	public Board getBoard(int boardID) { //게시판의 글 내용을 불러오는 함수
		String SQL = "SELECT * FROM Board WHERE boardID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Board board = new Board();
				board.setBoardID(rs.getInt(1));
				board.setBoardTitle(rs.getString(2));
				board.setUserID(rs.getString(3));
				board.setBoardDate(rs.getString(4));
				board.setBoardContent(rs.getString(5));
				board.setBoardAvailable(rs.getInt(6));
				return board;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int boardID, String boardTitle, String boardContent) {
		String SQL = "UPDATE Board SET boardTitle = ?, boardContent = ? WHERE boardID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, boardTitle); //값을 하나씩 넣어줄 수 있도록, 다음에 쓰여야 할 게시글 번호
			pstmt.setString(2, boardContent);
			pstmt.setInt(3, boardID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public int delete(int boardID) {
		String SQL = "UPDATE Board SET boardAvailable = 0 WHERE boardID = ?"; //글을 삭제하더라도 글에 대한 정보가 남아있도록
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID); 
			return pstmt.executeUpdate(); //반환값으로 성공여부 알 수 있음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
}
