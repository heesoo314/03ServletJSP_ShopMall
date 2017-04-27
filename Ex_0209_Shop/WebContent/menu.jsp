<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">

	function exe(v1){
		document.frm.category.value = v1;
		document.frm.submit();
	}

 
</script>



<div id="box">
  	<hr width="800" border="1" noshade color="navy">
  
      <h2 id="hh">
         <strong>INCREPAS SHOPPING CENTER</strong>
      </h2>
  
  	<hr width="800" border="1" noshade color="navy">
  
      <a href="product_list.jsp?category=com001">컴퓨터</a> | 
      <a href="product_list.jsp?category=ele002">가전 제품</a> | 
      <a href="javascript:exe('sp003')">스포츠</a>
  
  	<hr width="800" border="1" noshade color="navy">
  	
</div>
  
<form action="product_list.jsp" method="post" name="frm">
	<input type="hidden" name="category" />
</form>


