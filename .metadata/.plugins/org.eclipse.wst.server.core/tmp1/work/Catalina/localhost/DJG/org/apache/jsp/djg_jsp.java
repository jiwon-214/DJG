/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.0.11
 * Generated at: 2022-01-07 21:49:15 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import user.UserDAO;
import user.User;
import java.io.PrintWriter;
import java.sql.*;

public final class djg_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("jakarta.servlet");
    _jspx_imports_packages.add("jakarta.servlet.http");
    _jspx_imports_packages.add("jakarta.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.io.PrintWriter");
    _jspx_imports_classes.add("user.User");
    _jspx_imports_classes.add("user.UserDAO");
  }

  private volatile jakarta.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public jakarta.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final jakarta.servlet.http.HttpServletRequest request, final jakarta.servlet.http.HttpServletResponse response)
      throws java.io.IOException, jakarta.servlet.ServletException {

    if (!jakarta.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final jakarta.servlet.jsp.PageContext pageContext;
    jakarta.servlet.http.HttpSession session = null;
    final jakarta.servlet.ServletContext application;
    final jakarta.servlet.ServletConfig config;
    jakarta.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    jakarta.servlet.jsp.JspWriter _jspx_out = null;
    jakarta.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<meta name = \"viewport\" content = \"width=divice-width\", initial-scale = \"1\">\n");
      out.write("<link rel = \"stylesheet\" href = \"css/bootstrap.css\">\n");
      out.write("<link rel = \"stylesheet\" href = \"css/custom.css\">\n");
      out.write("<title>대장금</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("	");

		//로그인 된 사람 정보 담을 수 있도록
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		} //로그인되면 userID에 해당 이이디가 담기고 로그인 안되면 null
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다!')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
	
      out.write("\n");
      out.write("	<nav class =\"navbar navbar-default\">\n");
      out.write("		<div class = \"navbar-header\">\n");
      out.write("			<button type = \"button\" class = \"navbar-toggle collapsed\"\n");
      out.write("				data-toggle = \"collapse\" data-target = \"#bs-example-navbar-collapse-1\"\n");
      out.write("				aria-expanded=\"false\">\n");
      out.write("				<span class = \"icon-bar\"></span>\n");
      out.write("				<span class = \"icon-bar\"></span>\n");
      out.write("				<span class = \"icon-bar\"></span>\n");
      out.write("			</button>\n");
      out.write("			<a class=\"navbar-brand\" href = \"main.jsp\">대학생 장학금 찾아주기 : 대장금</a>\n");
      out.write("		</div>\n");
      out.write("		<div class=\"collapse navbar-collapse\" id=\"bs-example-navbar-collapse-1\">\n");
      out.write("			<ul class = \"nav navbar-nav\">\n");
      out.write("				<li><a href=\"main.jsp\">대장금</a></li>\n");
      out.write("				<li class=\"active\"><a href=\"djg.jsp\">장학금 찾기</a></li>\n");
      out.write("				<li><a href=\"https://portal.sungshin.ac.kr/sso/login.jsp\">성신여대</a></li>\n");
      out.write("				<li><a href=\"http://www.kosaf.go.kr/\">한국장학재단</a></li>\n");
      out.write("				<li><a href=\"https://rule.sungshin.ac.kr/service/law/lawView.do?seq=95&historySeq=0&gubun=cur&tree=part\">성신장학규정</a></li>\n");
      out.write("			</ul>\n");
      out.write("			");

				//로그인이 되어있지 않은 사람들의 화면
				if(userID == null) {
			
      out.write("	\n");
      out.write("				<ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("				<li class=\"dropdown\">\n");
      out.write("					<a href=\"#\" class=\"dropdown-toggle\"\n");
      out.write("						data-toggle=\"dropdown\" role=\"button\" aria-haspopup=\"true\"\n");
      out.write("						aria-expanded=\"false\">접속하기<span class=\"caret\"></span></a>\n");
      out.write("					<ul class=\"dropdown-menu\">\n");
      out.write("						<li><a href = \"login.jsp\">로그인 </a></li>\n");
      out.write("						<li><a href=\"join.jsp\">회원가입</a></li>\n");
      out.write("					</ul>\n");
      out.write("				</li>\n");
      out.write("			</ul>\n");
      out.write("			");
	
				} else { //로그인 되어있는 사람들의 화면
			
      out.write("\n");
      out.write("				<ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("				<li class=\"dropdown\">\n");
      out.write("					<a href=\"#\" class=\"dropdown-toggle\"\n");
      out.write("						data-toggle=\"dropdown\" role=\"button\" aria-haspopup=\"true\"\n");
      out.write("						aria-expanded=\"false\">회원관리<span class=\"caret\"></span></a>\n");
      out.write("					<ul class=\"dropdown-menu\">\n");
      out.write("						<li><a href = \"modification.jsp\">정보수정</a></li>\n");
      out.write("						<li><a href = \"info.jsp\">정보 확인</a></li>\n");
      out.write("						<li><a href = \"logoutAction.jsp\">로그아웃 </a></li>\n");
      out.write("					</ul>\n");
      out.write("				</li>\n");
      out.write("			</ul>\n");
      out.write("			");

				}
			
      out.write("\n");
      out.write("		</div>\n");
      out.write("	</nav>\n");
      out.write("		\n");
      out.write("		<div class=\"container\">\n");
      out.write("		<div class=\"row\">\n");
      out.write("			<table class=\"table table-striped\"	style=\"text-align: center; border : 1px solid #dddddd\">\n");
      out.write("				");
		
					UserDAO userDAO = new UserDAO();
					User user = new User();
					user = userDAO.djg(userID);
				
      out.write("\n");
      out.write("				<thead>\n");
      out.write("					<tr>\n");
      out.write("						<th style=\"background-color: #eeeeee; text-align:center;\">학번 </th>\n");
      out.write("						<th style=\"background-color: #eeeeee; text-align:center;\">이름 </th>\n");
      out.write("						<th style=\"background-color: #eeeeee; text-align:center;\">학년 </th>\n");
      out.write("						<th style=\"background-color: #eeeeee; text-align:center;\">학점 </th>\n");
      out.write("						<th style=\"background-color: #eeeeee; text-align:center;\">어학점수 </th>\n");
      out.write("						<th style=\"background-color: #eeeeee; text-align:center;\">다자녀</th>\n");
      out.write("						<th style=\"background-color: #eeeeee; text-align:center;\">소득분위 </th>\n");
      out.write("						<th style=\"background-color: #eeeeee; text-align:center;\">봉사 </th>\n");
      out.write("						<th style=\"background-color: #eeeeee; text-align:center;\">멘토링 </th>\n");
      out.write("						<th style=\"background-color: #eeeeee; text-align:center;\">국가고시 </th>\n");
      out.write("					</tr>\n");
      out.write("				</thead>\n");
      out.write("				<tbody>\n");
      out.write("					<tr>\n");
      out.write("						<td>");
out.println(user.getUserID()); 
      out.write("</td>\n");
      out.write("						<td>");
out.println(user.getUserName()); 
      out.write("</td>\n");
      out.write("						<td>");
out.println(user.getUserYear()); 
      out.write("</td>\n");
      out.write("						<td>");
out.println(user.getUserGrade()); 
      out.write("</td>\n");
      out.write("						<td>");
out.println(user.getUserLgrade()); 
      out.write("</td>\n");
      out.write("						<td>");
out.println(user.getUserMchild()); 
      out.write("</td>\n");
      out.write("						<td>");
out.println(user.getUserIncome()); 
      out.write("</td>\n");
      out.write("						<td>");
out.println(user.getUserVol()); 
      out.write("</td>\n");
      out.write("						<td>");
out.println(user.getUserMentor()); 
      out.write("</td>\n");
      out.write("						<td>");
out.println(user.getUserExam()); 
      out.write("</td>\n");
      out.write("				</tbody>\n");
      out.write("			</table>\n");
      out.write("		</div>\n");
      out.write("	</div>\n");
      out.write("	\n");
      out.write("	<div class=\"container\">\n");
      out.write("		<div class =\"jumbotron\">  \n");
      out.write("	\n");
      out.write("		<h3>\n");
      out.write("			");
out.print(user.getUserName()); 
      out.write(" 학생이 받을 수 있는 장학금\n");
      out.write("		</h3>\n");
      out.write("	<p>\n");
      out.write("	");
	
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
          	else if(userIncome == 8) out.println("-형설장학금:8분위- 337,500원(국가지급 1유형) + 100,500원(국가지급2유형) <br> (단, 국가장학금 신청한것에 한해 지급)<br>");
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
		
      out.write("\n");
      out.write("		</p>\n");
      out.write("	</div>\n");
      out.write("</div>\n");
      out.write("	\n");
      out.write("	<script src = \"https://code.jquery.com/jquery-3.1.1.min.js\"></script>\n");
      out.write("	<script src = \"js/bootstrap.js\"></script>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof jakarta.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}