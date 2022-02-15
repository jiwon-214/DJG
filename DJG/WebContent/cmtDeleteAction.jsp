<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "comment.Comment" %>
<%@ page import = "comment.CommentDAO" %>
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
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		if(userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다!')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		
		int boardID = 0;
		if(request.getParameter("boardID") != null) {
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		
		int commentID = 0;
		if(request.getParameter("commentID") != null) {
			commentID = Integer.parseInt(request.getParameter("commentID"));
		}
		
		if(commentID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 댓글입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		
		Comment comment = new CommentDAO().getComment(commentID);
		
		if(!userID.equals(comment.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('댓글 삭제 권한이 존재하지 않습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		
		else {
			CommentDAO commentDAO = new CommentDAO();
			int result = commentDAO.delete(commentID);
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('댓글 삭제에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('댓글이 삭제되었습니다.')");
				script.println("location.href = document.referrer");
				script.println("</script>");
			}
		}
	%>
</body>
</html>