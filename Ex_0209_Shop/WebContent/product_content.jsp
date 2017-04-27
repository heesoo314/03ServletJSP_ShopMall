<%@page import="mybatis.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제품 상세보기</title>

<link rel="stylesheet" type="text/css"	href="css/style.css"/>
<script>
	function check_ok(){
		
		var ok = document.getElementById("ok");
		
		if(ok.value == "1"){
			
			var cc = confirm("성공적으로 장바구니에 담겨졌습니다.\n<장바구니>로 이동하시겠습니까?");
			if(cc)
				location.href="cartList.jsp";
			
		}
	}
</script>
</head>
<body onload="check_ok()">
	
	<jsp:include page="menu.jsp" />
	<jsp:useBean id="sb" class="shop.bean.ShopBean" scope="session" />
	<jsp:setProperty property="num" name="sb" param="p_num" />
	<!-- 파라미터로 받은 p_num을 ShopBean의 객체인 sb의 멤버변수 num에 저장 -->
	
	<%
		// num에 해당하는 제품정보 하나를 반환
		ProductVO vo = sb.getProduct();
	%>
	
	
	<table align="center" width="600" border="1" 
    style="border-collapse:collapse;font-size:8pt" bordercolor="navy"
    cellpadding="4" cellspacing="0">
   
   <tbody>

    <tr>
        <td width="40%">제품 카테고리</td>
        <td width="60%"><%= vo.getCategory() %></td>
    </tr>
    <tr>
        <td width="40%">제품번호</td>
        <td width="60%"><%= vo.getNum() %></td>
    </tr>
    <tr>
        <td width="40%">제품이름</td>
        <td width="60%"><%= vo.getName() %></td>
    </tr>
    <tr>
        <td width="40%">제품 판매사</td>
        <td width="60%"><%= vo.getCompany() %></td>
    </tr>
    <tr>
        <td width="40%">제품가격</td>
        <td width="60%">정가 : <%= vo.getPrice() %>
        	<strong style="color:red" >(할인가 : <%= vo.getSaleprice() %> )</strong></td>
    </tr>
    <tr>
        <td colspan="2">제품설명</td>
    </tr>
    <tr>
        <td colspan="2" align="center"><img src ="images/<%= vo.getImage_l() %>" ></td>
    </tr>
    <tr>
        <td colspan="2"><%= vo.getContent() %></td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <input type="button" value="장바구니에 담기" 
            	onclick="javascript:location.href='addProduct.jsp?p_num=<%= vo.getNum() %>'"/>
            <input type="button" value="장바구니 보기" 
           	 	onclick="javascript:location.href='cartList.jsp'"/>           
        </td>
    </tr>
    </tbody>
        
	</table>

	<form>
		<input type="hidden" id="ok" value="<%= request.getParameter("ok") %>" />
	</form>
	
</body>
</html>