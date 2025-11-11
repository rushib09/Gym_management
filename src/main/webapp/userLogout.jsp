<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
    // ✅ Invalidate the session and redirect to home page
    session.invalidate();
    response.sendRedirect("index.jsp");
%>
