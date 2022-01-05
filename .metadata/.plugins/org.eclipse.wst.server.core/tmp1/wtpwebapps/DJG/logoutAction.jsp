<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대장금</title>
</head>
<body>
	<%
		session.invalidate(); //세션을 뺴앗겨서 로그아웃 시키도록
	%>
	<script>
		location.href = 'main.jsp';
	</script>
</body>
</html>