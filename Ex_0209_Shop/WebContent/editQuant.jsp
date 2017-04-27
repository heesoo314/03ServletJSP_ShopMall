<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="cart"  class="shop.bean.Cart"  scope="session" />

<%
	String pnum = request.getParameter("p_num");
	String q = request.getParameter("q");	
	cart.setQuant(pnum, q);
	
	response.sendRedirect("cartList.jsp");
%>
