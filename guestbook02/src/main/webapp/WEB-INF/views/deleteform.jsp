<%@page
	import="org.mariadb.jdbc.internal.com.send.parameters.LongParameter"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.douzone.guestbook.dao.GuestBookDao"%>
<%@page import="com.douzone.guestbook.vo.GuestBookVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
</head>
<body>
	<form method="post" action="<%=request.getContextPath()%>/gb?a=delete">
		<input type='hidden' name="no"
			value="<%=request.getParameter("no")%>">
		<table>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password"></td>
				<td><input type="submit" value="확인"></td>
			</tr>
		</table>
		<br> <a href="<%=request.getContextPath()%>">메인으로 돌아가기</a>
	</form>
</body>
<%=request.getParameter("no")%>
<%=request.getParameter("password")%>
</html>
