<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %> <%--UserDAO를 가져와줌 --%>
<%@ page import = "java.io.PrintWriter" %> <%--자바 스크립트 문장 작성 위해 사용 --%>
<% request.setCharacterEncoding("UTF-8"); %> <%--건너오는 모든 데이터를 UTF-8으로 받을수있도록 --%>
<jsp:useBean id="user" class="user.User" scope="page" /> <%--현재의 페이지에서만 빈즈 사용 --%>
<jsp:setProperty name="user" property="userID" /> <%--로그인 페이지에서 넘겨준 userID를 받아서 넣어줌--%>
<jsp:setProperty name="user" property="userPassword" /><%-- 넘어온 userID와 userName이 담기게된다 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content = "width=divice-width", initial-scale = "1">
<link rel = "stylesheet" href = "css/bootstrap.css">
<link rel = "stylesheet" href = "css/custom.css">
<title>대장금</title>
</head>
<body>
	<nav class ="navbar navbar-default">
		<div class = "navbar-header">
			<button type = "button" class = "navbar-toggle collapsed"
				data-toggle = "collapse" data-target = "#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class = "icon-bar"></span>
				<span class = "icon-bar"></span>
				<span class = "icon-bar"></span>
			</button>
			<a class="navbar-brand" href = "main.jsp">대학생 장학금 찾아주기 : 대장금</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class = "nav navbar-nav">
				<li><a href="main.jsp">대장금</a></li>
				<li class="active"><a href="djg.jsp">장학금 찾기</a></li>
				<li><a href="https://portal.sungshin.ac.kr/sso/login.jsp">성신여대</a></li>
				<li><a href="http://www.kosaf.go.kr/">한국장학재단</a></li>
				<li><a href="https://rule.sungshin.ac.kr/service/law/lawView.do?seq=95&historySeq=0&gubun=cur&tree=part">성신장학규정</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href = "login.jsp">로그인 </a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	UserDAO userDAO = new UserDAO();
	boolean result = userDAO.delete(userID, user.getUserPassword());
	%>
	<% if (result) { %>
		<div class="container" style="text-align:center;">
				<div class ="jumbotron">  
				<h3>	
					탈퇴가 완료되었습니다. 대장금 서비스를 이용해주셔서 감사합니다.
				</h3>
				</div>
				<div class="link" style="text-align:center;">
					<a href= "login.jsp">로그인</a> | <a href= "join.jsp">회원가입</a>
				</div>
			</div>
	<% session.invalidate(); %>
	<%	}
	
		else { //비밀번호가 틀릴때 %>
			<div class="container" style="text-align:center;">
				<div class ="jumbotron">  
				<h3>	
					탈퇴가 진행되지 않았습니다. 다시 시도해주세요.
				</h3>
				</div>
				<div class="link" style="text-align:center;">
					<a href= "withdraw.jsp">탈퇴하기</a>
				</div>
			</div>
	<%	}
		%>
<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>