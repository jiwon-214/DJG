<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "board.Board" %>
<%@ page import = "board.BoardDAO" %> 
<%@ page import = "java.io.PrintWriter" %> <%--자바 스크립트 문장 작성 위해 사용 --%>
<% request.setCharacterEncoding("UTF-8"); %> <%--건너오는 모든 데이터를 UTF-8으로 받을수있도록 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대장금</title>
</head>
<body>
	<%
	//로그인 한 아이디는 로그인, 회원가입 페이지 접근하지 못하도록
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID"); //세션아이디 담을 수 있도록
		}
		if (userID == null) { //이미 로그인이 된 경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다!')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		
		int boardID = 0;
		if (request.getParameter("boardID") != null) {
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		if (boardID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 게시글입니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("<script>");
		}
		
		Board board = new BoardDAO().getBoard(boardID);
		if (!userID.equals(board.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("<script>");
		} else {
			if (request.getParameter("boardTitle") == null || request.getParameter("boardContent") == null
					|| request.getParameter("boardTitle").equals("") || request.getParameter("boardContent").equals("")) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안 된 사항이 있습니다.')");
					script.println("history.back()"); //이전의 페이지로 돌려보내는 것
					script.println("</script>");
				}
					
			else {
					BoardDAO boardDAO = new BoardDAO(); 
					int result = boardDAO.update(boardID, request.getParameter("boardTitle"), request.getParameter("boardContent")); //넘어온 아이디, 패스워드를 가지고 실행
					if (result == -1) { 
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('게시글 수정에 실패했습니다.')");
						script.println("history.back()"); //이전의 페이지로 돌려보내는 것
						script.println("</script>");
					}
				
					else { //글 작성 완료되면 바로 메인페이지로
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('게시글 수정이 완료되었습니다.')");
						script.println("location.href = 'board.jsp'");
						script.println("</script>");
					}
				}	
		}
		
	%>
</body>
</html>