/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.0.11
 * Generated at: 2022-02-15 16:37:55 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import java.io.PrintWriter;
import board.Board;
import board.BoardDAO;
import comment.Comment;
import comment.CommentDAO;
import java.util.ArrayList;

public final class cmtUpdate_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("jakarta.servlet");
    _jspx_imports_packages.add("jakarta.servlet.http");
    _jspx_imports_packages.add("jakarta.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.io.PrintWriter");
    _jspx_imports_classes.add("comment.Comment");
    _jspx_imports_classes.add("board.Board");
    _jspx_imports_classes.add("board.BoardDAO");
    _jspx_imports_classes.add("comment.CommentDAO");
    _jspx_imports_classes.add("java.util.ArrayList");
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<meta name = \"viewport\" content = \"width=divice-width\", initial-scale = \"1\">\r\n");
      out.write("<link rel = \"stylesheet\" href = \"css/bootstrap.css\">\r\n");
      out.write("<link rel = \"stylesheet\" href = \"css/custom.css\">\r\n");
      out.write("<title>대장금</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	");

		//로그인 된 사람 정보 담을 수 있도록
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		} //로그인되면 userID에 해당 이이디가 담기고 로그인 안되면 null
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
		
		int commentID = 0;
		if(request.getParameter("commentID") != null) {
			commentID = Integer.parseInt(request.getParameter("commentID"));
		}
		
		Comment comment = new CommentDAO().getComment(commentID);
	
      out.write("\r\n");
      out.write("	<nav class =\"navbar navbar-default\">\r\n");
      out.write("		<div class = \"navbar-header\">\r\n");
      out.write("			<button type = \"button\" class = \"navbar-toggle collapsed\"\r\n");
      out.write("				data-toggle = \"collapse\" data-target = \"#bs-example-navbar-collapse-1\"\r\n");
      out.write("				aria-expanded=\"false\">\r\n");
      out.write("				<span class = \"icon-bar\"></span>\r\n");
      out.write("				<span class = \"icon-bar\"></span>\r\n");
      out.write("				<span class = \"icon-bar\"></span>\r\n");
      out.write("			</button>\r\n");
      out.write("			<a class=\"navbar-brand\" href = \"main.jsp\">대학생 장학금 찾아주기 : 대장금</a>\r\n");
      out.write("		</div>\r\n");
      out.write("		<div class=\"collapse navbar-collapse\" id=\"bs-example-navbar-collapse-1\">\r\n");
      out.write("			<ul class = \"nav navbar-nav\">\r\n");
      out.write("				<li><a href=\"main.jsp\">대장금</a></li>\r\n");
      out.write("				<li><a href=\"djg.jsp\">장학금 찾기</a></li>\r\n");
      out.write("				<li class=\"active\"><a href=\"board.jsp\">게시판</a></li>\r\n");
      out.write("				<li><a href=\"https://portal.sungshin.ac.kr/sso/login.jsp\">성신여대</a></li>\r\n");
      out.write("				<li><a href=\"http://www.kosaf.go.kr/\">한국장학재단</a></li>\r\n");
      out.write("				<li><a href=\"https://rule.sungshin.ac.kr/service/law/lawView.do?seq=95&historySeq=0&gubun=cur&tree=part\">성신장학규정</a></li>\r\n");
      out.write("			</ul>\r\n");
      out.write("			");

				//로그인이 되어있지 않은 사람들의 화면
				if(userID == null) {
			
      out.write("	\r\n");
      out.write("				<ul class=\"nav navbar-nav navbar-right\">\r\n");
      out.write("				<li class=\"dropdown\">\r\n");
      out.write("					<a href=\"#\" class=\"dropdown-toggle\"\r\n");
      out.write("						data-toggle=\"dropdown\" role=\"button\" aria-haspopup=\"true\"\r\n");
      out.write("						aria-expanded=\"false\">접속하기<span class=\"caret\"></span></a>\r\n");
      out.write("					<ul class=\"dropdown-menu\">\r\n");
      out.write("						<li><a href = \"login.jsp\">로그인 </a></li>\r\n");
      out.write("						<li><a href=\"join.jsp\">회원가입</a></li>\r\n");
      out.write("					</ul>\r\n");
      out.write("				</li>\r\n");
      out.write("			</ul>\r\n");
      out.write("			");
	
				} else { //로그인 되어있는 사람들의 화면
			
      out.write("\r\n");
      out.write("				<ul class=\"nav navbar-nav navbar-right\">\r\n");
      out.write("				<li class=\"dropdown\">\r\n");
      out.write("					<a href=\"#\" class=\"dropdown-toggle\"\r\n");
      out.write("						data-toggle=\"dropdown\" role=\"button\" aria-haspopup=\"true\"\r\n");
      out.write("						aria-expanded=\"false\">회원관리<span class=\"caret\"></span></a>\r\n");
      out.write("					<ul class=\"dropdown-menu\">\r\n");
      out.write("						<li><a href = \"modification.jsp\">정보수정</a></li>\r\n");
      out.write("						<li><a href = \"info.jsp\">정보 확인</a></li>\r\n");
      out.write("						<li><a href = \"logoutAction.jsp\">로그아웃</a></li>\r\n");
      out.write("						<li><a href = \"withdraw.jsp\">탈퇴하기</a></li>\r\n");
      out.write("					</ul>\r\n");
      out.write("				</li>\r\n");
      out.write("			</ul>\r\n");
      out.write("			");

				}
			
      out.write("\r\n");
      out.write("			\r\n");
      out.write("		</div>\r\n");
      out.write("	</nav>\r\n");
      out.write("	<div class=\"container\">\r\n");
      out.write("		<div class=\"row\">\r\n");
      out.write("			<table class=\"table table-striped\" style=\"text-align: center; border: 1px solid #dddddd\">\r\n");
      out.write("			<thead>\r\n");
      out.write("				<tr>\r\n");
      out.write("					<th colspan=\"3\" style=\"background-color: #eeeeee; text-align: center;\">게시판 글 보기</th>\r\n");
      out.write("				</tr>\r\n");
      out.write("			</thead>\r\n");
      out.write("			<tbody>\r\n");
      out.write("				<tr>\r\n");
      out.write("					<td style=\"width: 20%;\">제목</td>\r\n");
      out.write("					<td colspan=\"2\">");
      out.print(board.getBoardTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") );
      out.write("</td>\r\n");
      out.write("				</tr>\r\n");
      out.write("				<tr>\r\n");
      out.write("					<td>작성자</td>\r\n");
      out.write("					<td colspan=\"2\">");
      out.print(board.getUserID() );
      out.write("</td>\r\n");
      out.write("				</tr>\r\n");
      out.write("				<tr>\r\n");
      out.write("					<td>작성날짜</td>\r\n");
      out.write("					<td colspan=\"2\">");
      out.print(board.getBoardDate().substring(0, 11) + board.getBoardDate().substring(11, 13) + "시 " + board.getBoardDate().substring(14, 16) + "분" );
      out.write("</td>\r\n");
      out.write("				</tr>\r\n");
      out.write("				<tr>\r\n");
      out.write("					<td>내용</td>\r\n");
      out.write("					<td colspan=\"2\" style=\"height: 200px; text-align: left;\">");
      out.print(board.getBoardContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")  );
      out.write("</td>\r\n");
      out.write("				</tr>\r\n");
      out.write("			</tbody>\r\n");
      out.write("			</table>\r\n");
      out.write("			<div class=\"container\">\r\n");
      out.write("				<div class=\"row\">\r\n");
      out.write("					<table class=\"table table-striped\" style=\"text-align: center; border: 1px solid #dddddd\">\r\n");
      out.write("					<tbody>\r\n");
      out.write("						<tr>\r\n");
      out.write("							<td align=\"left\">댓글</td>\r\n");
      out.write("						</tr>\r\n");
      out.write("						<tr>\r\n");
      out.write("						");

							CommentDAO commentDAO = new CommentDAO();
							ArrayList<Comment> list = commentDAO.getList(boardID);
							for (int i = 0; i < list.size(); i++) {
								if(list.get(i).getCommentID() == commentID) {
						
      out.write("\r\n");
      out.write("									<div class=\"container\">\r\n");
      out.write("										<div class=\"form-group\">\r\n");
      out.write("										<form method=\"post\" action=\"cmtUpdateAction.jsp?boardID=");
      out.print(boardID );
      out.write("&commentID=");
      out.print(commentID );
      out.write("\">\r\n");
      out.write("											<table class=\"table table-striped\" style=\"text-align:center; border: 1px solid #dddddd; border-radius: 20%;\">\r\n");
      out.write("												<tr>\r\n");
      out.write("													<td style=\"border-bottom:none;\" valign=\"middle\"><br><br>");
      out.print(userID );
      out.write("</td>\r\n");
      out.write("													<td><textarea class=\"form-control\" maxlength=\"256\" style=\"height: 100px; resize:none;\" name=\"commentContent\">");
      out.print(comment.getCommentContent() );
      out.write("</textarea></td>\r\n");
      out.write("													<td><br><br><input type=\"submit\" class=\"btn btn-primary pull-center\" value=\"수정 완료\"></td>\r\n");
      out.write("												</tr>\r\n");
      out.write("											</table>\r\n");
      out.write("										</form>\r\n");
      out.write("										</div>\r\n");
      out.write("									</div>\r\n");
      out.write("						");
		
								} else {
						
      out.write("\r\n");
      out.write("						<div class=\"container\">\r\n");
      out.write("							<div class=\"row\">\r\n");
      out.write("								<table class=\"table table-striped\" style=\"text-align:center; border: 1px solid #dddddd\">\r\n");
      out.write("									<tbody>\r\n");
      out.write("										<tr>\r\n");
      out.write("											<td align=\"left\">");
      out.print(list.get(i).getUserID() );
      out.write("&nbsp; &nbsp; &nbsp; &nbsp;");
      out.print( list.get(i).getCommentDate().substring(0, 11) + list.get(i).getCommentDate().substring(11, 13) + "시" + list.get(i).getCommentDate().substring(14, 16) + "분" );
      out.write(" </td>\r\n");
      out.write("											<td colspan=\"2\"></td>\r\n");
      out.write("											<td align=\"right\">\r\n");
      out.write("											");

												if(list.get(i).getUserID() != null && list.get(i).getUserID().equals(userID)) {
											
      out.write("\r\n");
      out.write("													<a href=\"cmtUpdate.jsp?boardID=");
      out.print(boardID );
      out.write("&commentID=");
      out.print(list.get(i).getCommentID() );
      out.write("\" class=\"btn btn-primary\">수정</a>\r\n");
      out.write("													<a href=\"cmtDeleteAction.jsp?boardID=");
      out.print(boardID );
      out.write("&commentID=");
      out.print(list.get(i).getCommentID() );
      out.write("\" class=\"btn btn-primary\">삭제</a>\r\n");
      out.write("											");

												}
											
      out.write("\r\n");
      out.write("										</tr>\r\n");
      out.write("										<tr>\r\n");
      out.write("											<td colspan=\"5\" align=\"left\">");
      out.print(list.get(i).getCommentContent() );
      out.write("</td>\r\n");
      out.write("										</tr>\r\n");
      out.write("									</tbody>\r\n");
      out.write("								</table>\r\n");
      out.write("							</div>	\r\n");
      out.write("						</div>\r\n");
      out.write("						");

							}
						}
						
      out.write("\r\n");
      out.write("					</tbody>\r\n");
      out.write("					</table> \r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("			<div class=\"container\">\r\n");
      out.write("			<a href=\"board.jsp\" class=\"btn btn-primary\">목록</a>\r\n");
      out.write("			");

				if(userID != null && userID.equals(board.getUserID())) {
			
      out.write("\r\n");
      out.write("					<a href=\"update.jsp?boardID=");
      out.print( boardID );
      out.write("\" class=\"btn btn-primary\">수정하기</a>\r\n");
      out.write("					<a onclick=\"return confirm('정말로 삭제하시겠습니까?')\" href=\"deleteAction.jsp?boardID=");
      out.print( boardID );
      out.write("\" class=\"btn btn-primary\">삭제하기</a>\r\n");
      out.write("			");

				}
			
      out.write("\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("	<script src = \"https://code.jquery.com/jquery-3.1.1.min.js\"></script>\r\n");
      out.write("	<script src = \"js/bootstrap.js\"></script>\r\n");
      out.write("</body>\r\n");
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
