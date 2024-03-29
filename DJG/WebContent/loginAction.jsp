<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %> <%--UserDAO를 가져와줌 --%>
<%@ page import = "java.io.PrintWriter" %> <%--자바 스크립트 문장 작성 위해 사용 --%>
<% request.setCharacterEncoding("UTF-8"); %> <%--건너오는 모든 데이터를 UTF-8으로 받을수있도록 --%>
<jsp:useBean id="user" class="user.User" scope="page" /> <%--현재의 페이지에서만 빈즈 사용 --%>
<jsp:setProperty name="user" property="userID" /> <%--로그인 페이지에서 넘겨준 userID를 받아서 넣어줌--%>
<jsp:setProperty name="user" property="userPassword" />
<%-- 넘어온 userID와 Password가 담기게된다 --%>
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
		if (userID != null) { //이미 로그인이 된 경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		UserDAO userDAO = new UserDAO(); 
		int result = userDAO.login(user.getUserID(), user.getUserPassword()); //넘어온 아이디, 패스워드를 가지고 실행
		if (result == 1) {
			session.setAttribute("userID", user.getUserID()); //세션 아이디 이용해서 로그인 여부 확인 가능
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		
		else if (result == 0) { //비밀번호가 틀릴때
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()"); //이전의 페이지(로그인)로 돌려보내는 것
			script.println("</script>");
		}
		
		else if (result == -1) { //아이디가 존재하지 않을때
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 학번입니다.')");
			script.println("history.back()"); //이전의 페이지(로그인)로 돌려보내는 것
			script.println("</script>");
		}
		
		else if (result == -2) { //데이터베이스 오류가 발생했을때
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()"); //이전의 페이지(로그인)로 돌려보내는 것
			script.println("</script>");
		}
	%>
</body>
</html>