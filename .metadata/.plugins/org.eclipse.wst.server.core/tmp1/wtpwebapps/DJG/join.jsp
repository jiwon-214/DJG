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
               	  <input type="Email" class="form-control" placeholder="이메일" name="userEmail" maxlength="30">
               </div>
               <div class="form-group">
               <select name="dept" onchange="changeDpt(this)">
                        <option value="none" selected disabled>학부</option>
                        <option value="인문과학대학">인문과학대학</option>
                        <option value="사회과학대학">사회과학대학</option>
                        <option value="법과대학">법과대학</option>
                        <option value="자연과학대학">자연과학대학</option>
                        <option value="지식서비스공과대학">지식서비스공과대학</option>
                        <option value="간호대학">간호대학</option>
                        <option value="Health&WellnessCollege">Health&Wellness College</option>
                        <option value="뷰티생활산업국제대학">뷰티 생활산업 국제대학</option>
                        <option value="사범대학">사범대학</option>
                        <option value="미술대학">미술대학</option>
                        <option value="음악대학">음악대학</option>
                        <option value="융합문화예술대학">융합 문화 예술 대학</option>  
               </select>
				</div>
				<div class="form-group">
                    <select name="userMajor" id="userMajor">
                        <option selected disabled>학과</option>
                    </select>
                </div> 
                <%-- 
               <div class="form-group">
                  <input type="text" class="form-control" placeholder="전공" name="userMajor" maxlength="20">
               </div>
               --%>
               <h5>학년</h5>
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
               
               <h5>다자녀 유무</h5>
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
               
               <h5>멘토링 유무</h5>
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
               
               <h5>봉사 등급</h5>
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
               
               <h5>국가고시 여부</h5>
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
	
	<script>
    function changeDpt(e) {
        var humanities = ["국어국문학과", "영어영문학과", "독일어문/문화학과", "프랑스어문/문화학과", "일본어문/문화학과", "중국어문/문화학과", "사학과"];
        var historic = ["정치외교학과", "심리학과", "지리학과", "경제학과", "미디어커뮤니케이션학과", "경영학부", "사회복지학과"];
        var law = ["법학부"];
        var nature = ["수리통계 데이터사이언스 학부", "화학/에너지융합학부"];
        var engineering = ["서비스디자인공학과", "융합보안공학과", "컴퓨터공학과", "청정융합에너지공학과", "바이오식품공학과", "바이오생명공학과", "AI융합학부"];
        var nursing = ["간호학과"];
        var health = ["바이오신약의과학부", "바이오헬스융합학부", "스포츠과학부"];
        var beauty = ["의류산업학과", "뷰티산업학과", "소비자생활문화산업학과"];
        var teach = ["교육학과", "사회교육과", "윤리교육과", "한문교육과", "유아교육과"];
        var art = ["동양학과", "서양학과", "조소과", "공예과", "산업디자인과"];
        var music = ["성악과", "기악과", "작곡과"];
        var culture = ["문화예술경영학과", "미디어영상연기학과", "현대실용음악학과", "무용예술학과"];
        var target = document.getElementById("userMajor");

        if (e.value == "인문과학대학") {
            var dept = humanities;
        } else if (e.value == "사회과학대학") {
            var dept = historic;
        } else if (e.value == "법과대학") {
            var dept = law;
        } else if (e.value == "자연과학대학") {
        	var dept = nature;
        } else if (e.value == "지식서비스공과대학") {
        	var dept = engineering;
        } else if (e.value == "간호대학") {
        	var dept = nursing;
        } else if (e.value == "Health&WellnessCollege") {
        	var dept = health;
        } else if (e.value == "뷰티생활산업국제대학") {
        	var dept = beauty;
        } else if (e.value == "사범대학") {
        	var dept = teach;
        } else if (e.value == "미술대학") {
        	var dept = art;
        } else if (e.value == "음악대학") {
        	var dept = music;
        } else if (e.value == "뷰티생활산업국제대학") {
        	var dept = beauty;
        } else {
        	var dept = culture;
        }
        target.options.length = 0;
        for (i in dept) {
            var opt = document.createElement("option");
            opt.value = dept[i];
            opt.innerHTML = dept[i];
            target.appendChild(opt);
        }
    }
</script>
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>