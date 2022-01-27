<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.Board" %> 
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content = "width=divice-width", initial-scale = "1">
<link rel = "stylesheet" href = "css/bootstrap.css">
<link rel = "stylesheet" href = "css/custom.css">
<title>대장금</title>
<style type="text/css">
	a, a:hover {
		color: #000000;
		text-decoraion: none;
	}
</style>
</head>
<body>
	<%
		//로그인 된 사람 정보 담을 수 있도록
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		} //로그인되면 userID에 해당 이이디가 담기고 로그인 안되면 null
		int pageNumber = 1; //기본 페이지
		if(request.getParameter("pageNumber") != null) { //페이지 번호 넘어오면 값을 넣어줌
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
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
				<li><a href="djg.jsp">장학금 찾기</a></li>
				<li class="active"><a href="board.jsp">게시판</a></li>
				<li><a href="https://portal.sungshin.ac.kr/sso/login.jsp">성신여대</a></li>
				<li><a href="http://www.kosaf.go.kr/">한국장학재단</a></li>
				<li><a href="https://rule.sungshin.ac.kr/service/law/lawView.do?seq=95&historySeq=0&gubun=cur&tree=part">성신장학규정</a></li>
			</ul>
			<%
				//로그인이 되어있지 않은 사람들의 화면
				if(userID == null) {
			%>	
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
			<%	
				} else { //로그인 되어있는 사람들의 화면
			%>
				<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href = "modification.jsp">정보수정</a></li>
						<li><a href = "info.jsp">정보 확인</a></li>
						<li><a href = "logoutAction.jsp">로그아웃</a></li>
						<li><a href = "withdraw.jsp">탈퇴하기</a></li>
					</ul>
				</li>
			</ul>
			<%
				}
			%>
			
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">번호</th>
					<th style="background-color: #eeeeee; text-align: center;">제목</th>
					<th style="background-color: #eeeeee; text-align: center;">작성자</th>
					<th style="background-color: #eeeeee; text-align: center;">작성날짜</th>
				</tr>
			</thead>
			<tbody>
				<%
					BoardDAO boardDAO = new BoardDAO();
					ArrayList<Board> list = boardDAO.getList(pageNumber);
					for(int i = 0; i < list.size(); i++) {
					System.out.print(list);
				%>
				<tr>
					<td><%= list.get(i).getBoardID() %></td>
					<td><a href="view.jsp?boardID=<%= list.get(i).getBoardID() %>"><%= list.get(i).getBoardTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
					<td><%= list.get(i).getUserID() %></td>
					<td><%= list.get(i).getBoardDate().substring(0, 11) + list.get(i).getBoardDate().substring(11, 13) + "시 " + list.get(i).getBoardDate().substring(14, 16) + "분" %></td>
				</tr>
				<%
					}
				%>
			</tbody>
			</table>
			<%
				if(pageNumber != 1) {
			%>
				<a href="board.jsp?pageNumber=<%=pageNumber - 1%>" class = "btn btn-success btn-arraw-left">이전</a>
			<%
				} if (boardDAO.nextPage(pageNumber + 1)) {
			%>
				<a href="board.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arraw-left">다음</a>
			<%	
				}
			%>
			<a href="write.jsp" class="btn btn-primary pull-right">작성하기</a>
		</div>
	</div>
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>