<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="cart"  class="shop.bean.Cart"  scope="session" />
<jsp:useBean id="sb" class="shop.bean.ShopBean" scope="session" />

<%
	String pnum = request.getParameter("p_num");
	cart.addProduct(sb, pnum);
	
	// p_num 파라미터를 가지고 [제품상세보기] 페이지로 넘어간다
	response.sendRedirect("product_content.jsp?p_num=" + pnum + "&ok=1");
%>