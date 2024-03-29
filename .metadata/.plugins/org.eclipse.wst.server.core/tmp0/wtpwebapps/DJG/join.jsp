<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content = "width=divice-width", initial-scale="1">
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
						<li class="active"><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container">
      <div class="col-lg-4"></div>
      <div class="col-lg-4">
         <div class="jumbotron" style="padding-top:20px;">
            <form method="post" action="joinAction.jsp">
               <h3 style="text-align:center;">대장금 회원가입</h3>
               <div class="form-group">
                  <input type="text" class="form-control" placeholder="학번" name="userID" maxlength="10">
               </div>
               <div class="form-group">
                  <input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
               </div>
               <div class="form-group">
                  <input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
               </div>
               <div class="form-group">
                  <input type="text" class="form-control" placeholder="전공" name="userMajor" maxlength="20">
               </div>
               
               <div class="form-group" style="text-align:center;">
                  <div class="btn-group" data-toggle="buttons">
                     <label class="btn btn-primary active">
                        <input type = "radio" name="userYear" autocomplete="off" value="1" checked>1학년
                     </label>
                     <label class="btn btn-primary active">
                        <input type = "radio" name="userYear" autocomplete="off" value="2">2학년
                     </label>
                     <label class="btn btn-primary active">
                        <input type = "radio" name="userYear" autocomplete="off" value="3">3학년
                     </label>
                     <label class="btn btn-primary active">
                        <input type = "radio" name="userYear" autocomplete="off" value="4">4학년
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <input type="text" class="form-control" placeholder="학점" name="userGrade" maxlength="10">
               </div>
               <div class="form-group">
                  <input type="text" class="form-control" placeholder="어학성적" name="userLgrade" maxlength="10">
               </div>
               <div class="form-group" style="text-align:center;">
                  <div class="btn-group" data-toggle="buttons">
                     <label class="btn btn-primary active">
                        <input type = "radio" name ="userMchild" autocomplete="off" value="cO" checked>다자녀O
                     </label>
                     <label class="btn btn-primary active">
                        <input type = "radio" name ="userMchild" autocomplete="off" value="cX">다자녀X
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <input type="text" class="form-control" placeholder="소득분위" name="userIncome" maxlength="10">
               </div>
         
               <div class="form-group" style="text-align:center;">
                  <div class="btn-group" data-toggle="buttons">
                     <label class="btn btn-primary active">
                        <input type="radio" name="userMentor" autocomplete="off" value="mO" checked>멘토링O
                     </label>
                     <label class="btn btn-primary active">
                        <input type = "radio" name="userMentor" autocomplete="off" value="mX">멘토링X
                     </label>
                  </div>
               </div>
               <div class="form-group" style="text-align:center;">
                  <div class="btn-group" data-toggle="buttons">
                     <label class="btn btn-primary active">
                        <input type="radio" name="userVol" autocomplete="off" value="Vx" checked>해당없음
                     </label>
                     <label class="btn btn-primary active">
                        <input type="radio" name="userVol" autocomplete="off" value="Va">A
                     </label>
                     <label class="btn btn-primary active">
                        <input type="radio" name="userVol" autocomplete="off" value="Vb">B
                     </label>
                     <label class="btn btn-primary active">
                        <input type="radio" name="userVol" autocomplete="off" value="Vc">C
                     </label>
                  </div>
               </div>
               <div class="form-group" style="text-align:center;">
                  <div class="btn-group" data-toggle="buttons">
                     <label class="btn btn-primary active">
                        <input type="radio" name="userExam" autocomplete="off" value="Ex" checked>국가고시 해당없음
                     </label>
                     <label class="btn btn-primary active">
                        <input type="radio" name="userExam" autocomplete="off" value="E9">9급 이상
                     </label>
                     <label class="btn btn-primary active">
                        <input type="radio" name="userExam" autocomplete="off" value="E7">7급 이상
                     </label>
                     <label class="btn btn-primary active">
                        <input type="radio" name="userExam" autocomplete="off" value="E5">5급 이상
                     </label>
                  </div>
               </div>
               <input type="submit" class="btn btn-primary form-control" value="회원가입">
            </form>
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