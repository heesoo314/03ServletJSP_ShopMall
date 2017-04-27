package shop.bean;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import mybatis.vo.ProductVO;

public class Cart {

/*
 * Cart 클래스
 * : 장바구니의 필요한 속성과 기능을 추상화한 클래스
 * 
 * - 제품을 저장하고 삭제 -> ArrayList<ProductVO>
 * - 제품별 선택수량과 총액을 계산되어야 함 -> int
 * 
 * 
 * <기능 분석>
 * - 카트에 제품 등록
 * - 카트에 제품 삭제
 * - 카트에 있는 제품(ProductVO)들을 배열로 반환
 * - 카트에 있는 제품 중 특정 제품을 검색
 * - 카트에 있는 제품 중 특정 제품의 수량만 수정
 * - 카트에 있는 제품의 총 금액 계산
 * */
	
	private List<ProductVO> list;
	private int t_price, t_salePrice;
	
	
	// 현재 객체가 생성될 때 (jsp:useBean ~~~) 사용자별 카트(저장소)를 미리 생성
	public Cart(){
		list = new ArrayList<>();
	}

	
	 // ------------------------------------ 1) 카트에 제품 등록 ------------------------------------
	public void addProduct(ShopBean sb, String pnum){
		
		// 카트(list)에 이미 제품이 있다면 수량을 +1 증가하고, 
		ProductVO pvo = searchProduct(pnum);
		
		if(pvo != null){
		
			int q = pvo.getQuant();
			pvo.setQuant(++q);
			return;	// 제어권 반환
		
		} 
		
		// 아니면 진열대(sb)에서 제품번호(pnum)로 해당 제품을 검색한 후 새롭게 추가		
		sb.setNum(pnum);
		ProductVO p = sb.getProduct();
		p.setQuant(1);
		list.add(p);
		
	}

	
	 // ------------------------------------ 2) 카트에 제품 삭제 ------------------------------------
	public void removeProduct(String pnum){
		
		ProductVO pvo = searchProduct(pnum);
		
		if(pvo != null)
			list.remove(pvo);
		
	}
	
	
	 // ----------------------- 3) 카트에 있는 제품(ProductVO)들을 배열로 반환 -----------------------
	public ProductVO[] getProductList(){
		
		ProductVO[] p_ar = new ProductVO[list.size()];
		return list.toArray(p_ar);
	
	}
	
	
	 // --------------------------- 4) 카트에 있는 제품 중 특정 제품을 검색 ---------------------------
	public ProductVO searchProduct(String pnum){
		
		// 검색속도를 높이기 위해 List의 반복자(iterator)를 사용한다.
		Iterator<ProductVO> it = list.iterator();
		
		// it.hasNext() : 반복자의 커서가 있는 위치에 값이 존재하는지 안하는지 판단 -> t/f
		// it.next() 	: 값을 반환
		while(it.hasNext()){
			
			ProductVO pvo = it.next();
			if(pvo.getNum().equals(pnum))
				return pvo;
			
		}
		
		return null;
		
	}
	
	
	 // ------------------------- 5) 카트에 있는 제품 중 특정 제품의 수량만 수정 -------------------------
	public void setQuant(String pnum, String q){
		
		ProductVO pvo = searchProduct(pnum);
		int su = Integer.parseInt(q);
		if(pvo != null)
			pvo.setQuant(su);		
		
	}
	
	
	 // ------------------------------- 6) 카트에 있는 제품의 총 금액 계산 -------------------------------
	
	
}
