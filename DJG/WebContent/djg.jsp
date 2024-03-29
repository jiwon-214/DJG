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
				<li><a href="main.jsp">대장금</a></li>
				<li class="active"><a href="djg.jsp">장학금 찾기</a></li>
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
		<div class="row">
			<table class="table table-striped"	style="text-align: center; border : 1px solid #dddddd">
				<%		
					UserDAO userDAO = new UserDAO();
					User user = new User();
					user = userDAO.djg(userID);
				%>
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align:center;">학번 </th>
						<th style="background-color: #eeeeee; text-align:center;">이름 </th>
						<th style="background-color: #eeeeee; text-align:center;">학년 </th>
						<th style="background-color: #eeeeee; text-align:center;">학점 </th>
						<th style="background-color: #eeeeee; text-align:center;">어학점수 </th>
						<th style="background-color: #eeeeee; text-align:center;">다자녀</th>
						<th style="background-color: #eeeeee; text-align:center;">소득분위 </th>
						<th style="background-color: #eeeeee; text-align:center;">봉사 </th>
						<th style="background-color: #eeeeee; text-align:center;">멘토링 </th>
						<th style="background-color: #eeeeee; text-align:center;">국가고시 </th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><%out.println(user.getUserID()); %></td>
						<td><%out.println(user.getUserName()); %></td>
						<td><%out.println(user.getUserYear()); %></td>
						<td><%out.println(user.getUserGrade()); %></td>
						<td><%out.println(user.getUserLgrade()); %></td>
						<td><%out.println(user.getUserMchild()); %></td>
						<td><%out.println(user.getUserIncome()); %></td>
						<td><%out.println(user.getUserVol()); %></td>
						<td><%out.println(user.getUserMentor()); %></td>
						<td><%out.println(user.getUserExam()); %></td>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="container">
		<div class ="jumbotron">  
	
		<h3>
			<%out.print(user.getUserName()); %> 학생이 받을 수 있는 장학금
		</h3>
	<p>
	<%	
	//회원정보 수정 기능 넣기, main 화면 고치기
		String userName = user.getUserName();
		String grade = user.getUserGrade();
		double userGrade = Double.parseDouble(grade);
		
		String income = user.getUserIncome();
		int userIncome = Integer.parseInt(income);
		
		String year = user.getUserYear();
		int userYear = Integer.parseInt(year);
		
		String toeic = user.getUserLgrade();
		int userLgrade = Integer.parseInt(toeic);
		String userVol = user.getUserVol();
		String userMentor = user.getUserMentor();
		String userMchild = user.getUserMchild();
		String userExam = user.getUserExam();
		
		   
		//성신장학금
		if(userGrade >= 2.5) {
       		if(userYear == 1 && userLgrade >= 0)   {
          		 out.println("-1학년 성신장학금 - 170만원");
           		 out.println("(단, F를 허용함, 별도의 서류 필요)<br>");
           		 out.println("(학과 학년별 1등 중 평량평점이 가장높고, 공인 인증영어성적을 만족한 경우 성신 21세기 장학금 지급)<br>");
       		}
    
       		else if(userYear == 2 && userLgrade >= 600)   {  
       			out.println("-2학년 성신장학금 - 170만원");
          		out.println("(단, F를 허용함, 별도의 서류 필요)<br>");
        		out.println("(학과 학년별 1등 중 평량평점이 가장높고, 공인 인증영어성적을 만족한 경우 성신 21세기 장학금 지급)<br>");
    		}
    
     	    else if(userYear == 3 && userLgrade >= 700)   {
       			out.println("-3학년 성신장학금 - 170만원");
        		out.println("(단, F를 허용함, 별도의 서류 필요)<br>");
          		out.println("(학과 학년별 1등 중 평량평점이 가장높고, 공인 인증영어성적을 만족한 경우 성신 21세기 장학금 지급)<br>");
    		}
    
     	    else if(userYear==4 && userLgrade >= 800)   {
      		 out.println("-4학년 성신장학금 - 170만원");
        	 out.println("(단, F를 허용함, 별도의 서류 필요)<br>");
        	 out.println("(학과 학년별 1등 중 평량평점이 가장높고, 공인 인증영어성적을 만족한 경우 성신 21세기 장학금 지급)<br>");
       		}
  		}
		
		//장학금 수혜불가
		if((userGrade < 2.5 && userIncome > 8 && userLgrade < 400) || userIncome > 8) {
		   out.println("장학금 수혜가 불가능합니다");
		}

		else	{
    	//소득분위에 따른 100% 지급(국가장학금 신청해야함, F허용)
     	if(userGrade >= 2.75) {
         	if(userIncome == 0) out.println("-향학장학금: 0분위 - 260만원(국가지급1유형) + 40만원(국가지급2유형) + 수업료100%(학교지급) <br> (단, 국가장학금 신청한것에 한해 지급)<br>");
          	else if(userIncome == 1) out.println("-성신사랑장학금:1분위 - 260만원(국가지급1유형) + 40만원(국가지급2유형) + 수업료100% (학교지급) <br> (단, 국가장학금 신청한것에 한해 지급)<br>");
          	else if(userIncome == 2) out.println("-성신사랑장학금:2분위 - 260만원(국가지급1유형) + 40만원(국가지급2유형) + 수업료100% (학교지급) <br> (단, 국가장학금 신청한것에 한해 지급)<br>");
          	else if(userIncome == 3) out.println("-성신사랑장학금:3분위 - 260만원(국가지급1유형) + 40만원(국가지급2유형) + 수업료100% (학교지급) <br> (단, 국가장학금 신청한것에 한해 지급)<br>");
          	else if(userIncome == 4) out.println("-성신희망장학금:4분위 - 195만원(국가지급1유형) + 18만원(국가지급2유형) + 수업료70%(학교지급)<br> (단, 국가장학금 신청한것에 한해 지급)<br>");
          	else if(userIncome == 5) out.println("-성신희망장학금:5분위 - 184만원(국가지급1유형) + 18만원(국가지급2유형) + 수업료70%(학교지급) <br> (단, 국가장학금 신청한것에 한해 지급)<br>");
          	else if(userIncome == 6) out.println("-형설장학금:6분위 - 184만원(국가지급1유형) + 12만원(국가지급2유형) + 수업료 65%(학교지급)<br> (단, 국가장학금 신청한것에 한해 지급)<br>"); 
          	else if(userIncome == 7) out.println("-형설장학금:7분위 - 60만원(국가지급 1유형) + 12만원(국가지급 2유형)<br> (단, 국가장학금 신청한것에 한해 지급)<br>");
          	else if(userIncome == 8) out.println("-형설장학금:8분위- 337500원(국가지급 1유형) + 100500원(국가지급2유형) <br> (단, 국가장학금 신청한것에 한해 지급)<br>");
     	 }
    
 	 //어학향상능력장학금
	 if(userLgrade >= 950) {
        out.println("-어학능력향상장학금(영어) S등급 - 30만원<br>");
 	 }
 	 else if (userLgrade >= 900) {
 	    out.println("-어학능력향상장학금(영어) A등급 - 30만원<br>");
 	 } 
 	 else if(userLgrade >= 800) {
    	out.println("-어학능력향상장학금(영어) B등급 - 30만원<br>");
 	 }
  	 
	//봉사
	 
	 if(userVol != null) {
	    if(userVol.equals("Vx")) {
	       out.println("");
	    }
	    else if(userVol.equals("Va")) 
	       out.println("-봉사 A 장학금 - 등록금 전액 지급<br>");   
	    else if(userVol.equals("Vb")) 
	       out.println("-봉사 B 장학금 - 등록금 70%<br>");
	    else if(userVol.equals("Vc"))
	       out.println("-봉사 C 장학금 - 80만원<br>");
	 }

	   //멘토링
	   
	   if(userMentor != null){
	       if(userMentor.equals("mO") && userLgrade == 0 && userYear == 1)
	          out.println("-1학년 멘토링장학금 - 150만원 지급<br>");
	       else if(userMentor.equals("mO") && userLgrade >= 600 && userYear == 2)
	          out.println("-2학년 멘토링장학금 - 150만원 지급<br>");
	       else if(userMentor.equals("mO") && userLgrade >= 700 && userYear == 3)
	          out.println("-3학년 멘토링장학금 - 150만원 지급<br>");
	       else if(userMentor.equals("mO") && userLgrade >= 800 && userYear == 2)
	          out.println("-4학년 멘토링장학금 - 150만원 지급<br>");
	       
	       else if(userMentor.equals("mX"))
	          out.println("");
	    }
	  
	   
	 //다자녀
	   
	   if(userMchild != null) {
	         if(userMchild.equals("cO") && (userIncome>=0 && userIncome <= 3))
	            out.println("-다자녀 장학금(학기별 최대 지원금액:260만원/연간 최대지원금액:520만원)<br>");
	         else if(userMchild.equals("cO") && (userIncome >=4 && userIncome <=8 ))
	            out.println("-다자녀 장학금(학기별 최대 지원금액:225만원/연간 최대지원금액:450만원)<br>");
	         else if(userMchild.equals("mX"))
	            out.println("");
	    }
	   
	   //국가고시
	   
	   if(userExam != null){
	       if(userExam.equals("Ex") && (userGrade >= 2.75))
	          out.println("");
	       else if(userExam.equals("E5") && (userGrade >= 2.75))
	          out.println("-고시장학금 A급 - 등록금 전액 지급");
	       else if(userExam.equals("E7") && (userGrade >=2.75))
	          out.println("-고시장학금 B급 - 200만원");
	       else if(userExam.equals("E9") && (userGrade >= 2.75))
	          out.println("-고시장학금 C급 - 100만원");
	    }
	   
		   }
		%>
		</p>
	</div>
</div>
	
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>