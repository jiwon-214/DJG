<%@page import="user.UserDAO"%>
<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>
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
	<%
		//로그인 된 사람 정보 담을 수 있도록
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		} //로그인되면 userID에 해당 이이디가 담기고 로그인 안되면 null
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
				<li class="active"><a href="main.jsp">대장금</a></li>
				<li><a href="djg.jsp">장학금 찾기</a></li>
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
						<li><a href = "modification.jsp">정보 수정</a></li>
						<li><a href = "logoutAction.jsp">로그아웃 </a></li>
					</ul>
				</li>
			</ul>
			<%
				}
			%>
			
		</div>
	</nav>
	<div class="container">
      <div class="col-lg-4"></div>
      <div class="col-lg-4">
         <div class="jumbotron" style="padding-top:20px;">
            <form method="post" action="modificationAction.jsp">
				<h3 style = "text-align:center;">회원 정보 수정</h3>
				<%
				UserDAO userDAO = new UserDAO();
				User user = new User();
				user = userDAO.djg(userID);
				%>
				
				<div class="form-group">
				 학번
                  <input type="text" class="form-control" name = "userID" maxlength="10" readonly = "readonly" value =<%=user.getUserID() %>>
               </div>
               <div class="form-group">
               	  비밀번호
                  <input type="text" class="form-control" name="userPassword" maxlength="20" readonly="readonly" value =<%=user.getUserPassword() %>>
               </div>
               <div class="form-group">
               	이름
                  <input type="text" class="form-control" name="userName" maxlength="20" readonly="readonly" value =<%=user.getUserName() %>>
               </div>
               이메일
               <div class="form-group">
                  <input type="email" class="form-control" name="userEmail" maxlength="50" readonly="readonly" value =<%=user.getUserEmail() %>>
               </div>
               <div class="form-group">
               	전공
                  <input type="text" class="form-control" name="userMajor" maxlength="50" readonly="readonly" value =<%=user.getUserMajor() %>>
               </div>
               <div class="form-group">
              	 학년
                  <input type="text" class="form-control" name="userYear" maxlength="10" readonly="readonly" value=<%=user.getUserYear()%>>
               </div>
               <div class="form-group">
               	학점
                  <input type="text" class="form-control" name="userGrade" maxlength="10" readonly="readonly" value=<%=user.getUserGrade() %>>
               </div>
               <div class="form-group">
               	어학성적
                  <input type="text" class="form-control" name="userLgrade" maxlength="10" readonly="readonly" value =<%=user.getUserLgrade() %>>
               </div>
               <div class="form-group">
               	다자녀 여부
                  <input type="text" class="form-control" name="userMchild" maxlength="10" readonly="readonly" value =<%=user.getUserMchild() %>>
               </div>
               <div class="form-group">
               	소득분위
                  <input type="text" class="form-control" name="userIncome" maxlength="10" readonly="readonly" value =<%=user.getUserIncome() %>>
               </div>         
               <div class="form-group">
               	멘토링 수행 여부
                  <input type="text" class="form-control" name="userMentor" maxlength="10" readonly="readonly" value=<%=user.getUserMentor() %>>
               </div>
               <div class="form-group">
               	봉사 수행 여부
                  <input type="text" class="form-control" name="userVol" maxlength="10" readonly="readonly" value=<%=user.getUserVol() %>>
               </div>
               <div class="form-group">
               	국가고시 수행 여부
                  <input type="text" class="form-control" name="userExam" maxlength="10" readonly="readonly" value=<%=user.getUserExam() %>>
               </div>
            </form>
            <div class="link" style="text-align:center;">
					<a href="modification.jsp">정보 수정 하기</a>
			</div>
         </div>
      </div>
      <div class="col-lg-4"></div>
   </div>
		<div class="col-lg-4"></div>
	</div>
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>