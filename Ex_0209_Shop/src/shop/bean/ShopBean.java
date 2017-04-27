package shop.bean;

import mybatis.dao.ShopDAO;
import mybatis.vo.ProductVO;

public class ShopBean {
	
	// 메뉴를 선택했을 때 파라미터 값을 저장할 변수
	private String num, category;
	
	// 검색된 제품목록을 저장할 변수
	private ProductVO[] p_list;
	
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public ProductVO[] getP_list() {
		return p_list;
	}
	public void setP_list(ProductVO[] p_list) {
		this.p_list = p_list;
	}
	
	
	// [카테고리별로 제품 검색]
	// 제품을 p_list에 저장되도록 하는 기능
	// category변수는 setProperty라는 액션요소로 자동 채워진다.
	public void searchProduct(){
		p_list = ShopDAO.getList(category);
		setP_list(p_list);	
	}
	
	
	// [제품 상세보기]
	// 제품번호(num)을 파라미터값으로 받아 p_list에서 검색
	public ProductVO getProduct(){
		
		ProductVO vo = null;
		
		for(ProductVO pvo : p_list){
			if(pvo.getNum().equals(num)){
				vo = pvo;
				break; // 반복문 탈출
			}
		}
		
		return vo;
	}
	
}
