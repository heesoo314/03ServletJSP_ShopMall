<%@page import="mybatis.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제품목록</title>
<link rel="stylesheet" type="text/css"	href="css/style.css"/>
</head>

<body>

	<jsp:include page="menu.jsp" />
	<jsp:useBean id="sb" class="shop.bean.ShopBean" scope="session" />
	<jsp:setProperty property="*" name="sb"/>
	
	
	<%
		sb.searchProduct();
		// 선택한 카테고리별 제품목록이 DB로부터 검색되어
		// ShopBean의 멤버변수인 p_list 배열에 저장된다.
		// category와 num은 멤버변수와 파라미터가 동일하므로 정의 안해줘도 자동으로 채워진다.
		
		ProductVO[] p_ar = sb.getP_list();
	%>

	<table align="center" width="600" border="1" 
    style="border-collapse:collapse;font-size:8pt" bordercolor="navy"
    cellpadding="4" cellspacing="0">
    
		<thead>
			<tr>
				<th width="15%">제품번호</th>
				<th width="20%">이미지</th>
				<th width="30%">제품명</th>
				<th width="20%">제품가격</th>
				<th width="15%">비고</th>
			</tr>
		</thead>

		<tbody>
		
			<% 
			if(p_ar != null){
				for(ProductVO p : p_ar) {%>
			
				<tr>
					<td><%= p.getNum() %></td>
					<td><img class="s_img" src = "images/<%= p.getImage_s() %>" /></td>
					<td>
						<a href="product_content.jsp?p_num=<%= p.getNum()%>" ><%= p.getName() %></a>
					</td>
					<td>
						정  가 : <%= p.getPrice() %>원<br/>
						<span class="red">할인가 : <%= p.getSaleprice() %>원</span><br/>
					</td>
					<td>할인율 : <%= p.getPercent() %></td>
				</tr>
				
			<% 
				}
			} 
			%>
		</tbody>
	</table>

</body>
</html>