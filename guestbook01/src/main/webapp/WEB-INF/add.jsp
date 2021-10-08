<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.douzone.guestbook.dao.GuestBookDao"%>
<%@page import="com.douzone.guestbook.vo.GuestBookVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

Date time = new Date();

request.setCharacterEncoding("utf-8");

String name = request.getParameter("name");
String password = request.getParameter("password");
String message = request.getParameter("message");
String regdate = format1.format(time);

GuestBookVo vo = new GuestBookVo();
vo.setName(name);
vo.setPassword(password);
vo.setMessage(message);
vo.setRegDate(regdate);

new GuestBookDao().insert(vo);

response.sendRedirect(request.getContextPath());
%>