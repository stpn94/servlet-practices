<%@page import="com.douzone.guestbook.dao.GuestBookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
String password = request.getParameter("password");
Integer no = Integer.parseInt(request.getParameter("no"));
new GuestBookDao().Delete(no, password);
response.sendRedirect(request.getContextPath());
%>