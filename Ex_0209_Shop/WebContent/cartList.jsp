<%@page import="mybatis.vo.ProductVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니</title>
<link rel="stylesheet" 	type="text/css"	href="css/style.css" />

</head>

<body>

<jsp:include page="menu.jsp"/>

<%-- Cart 클래스를 Bean 객체로 설정
	 사용자 개별 카트가 필요하기 때문에 사용범위는 session으로 지정 --%>
<jsp:useBean id="cart"  class="shop.bean.Cart"  scope="session" />
<jsp:setProperty property="*" name="cart" />

<%
	// 카트에 저장된 모든 제품을 배열로 가져온다. 
	ProductVO[] p_ar = cart.getProductList();

%>

	<table width="600" border="1" align="center"
		style="border-collapse: collapse; font-size: 8pt" cellspacing="0" cellpadding="4">
		
		<thead>
			<tr><td colspan="6">:: 장바구니  ::</td></tr>
			<tr bgcolor="#dedede">
				<th width="10%">제품번호</th>
				<th width="25%">제품명</th>
				<th width="25%">단가</th>
				<th width="15%">수량</th>
				<th width="15%">금액</th>
				<th width="10%">삭제</th>
			</tr>
		</thead>


		<tbody>
			<%
			int total = 0; // 총금액
			for(int i=0; i<p_ar.length; i++){
				
				ProductVO p = p_ar[i];
				total += p.getTotalprice();
				
			%>
		
			<tr align="center">
				<td><%= p.getNum() %></td>
				<td><%= p.getName() %></td>
				<td>정가:<%= p.getPrice() %><br>
					<span style="color:red">세일가격:<%= p.getSaleprice() %></span></td>
				<td>
					<!-- 수량 조정 폼 --> 
					<form action="editQuant.jsp" method="post">
						<input type="hidden" name="p_num" value="<%= p.getNum() %>" />
						<input type="text" name="q" value="<%= p.getQuant() %>" size="2" />
						<input type="submit" value="수정" />
					</form>
					<!------------------>
				</td>
				<td><%= p.getTotalprice() %></td>
				<td>
					<input type="button" value="삭제" style="border: 1 solid black; cursor: pointer"
					onclick="javascript:location.href='delProduct.jsp?p_num=<%= p.getNum() %>'">
				</td>
			</tr>
			
			<%
			} // for문의 끝
			
			if(p_ar.length < 1) {
			%>
			
			<tr align="center" class="empty" >
				<td colspan="6"><strong>장바구니가 비었습니다.</strong></td>
			</tr>
			
			<%
			} // if문의 끝
			%>
		</tbody>
		
		<tfoot>
			<tr>
				<td colspan="6" align="right">총 결제액 : <%= total %>원</td>
			</tr>
		</tfoot>
		
		
	</table>


</body>
</html>