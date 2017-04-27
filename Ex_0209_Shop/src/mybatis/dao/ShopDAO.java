package mybatis.dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mybatis.vo.ProductVO;

public class ShopDAO {
	
	// 오로지 하나만 생성해서 쓰는 factory
	private static SqlSessionFactory factory;
	
	
	// static 초기화 : 현재 클래스가 인식될 때 생성자보다 더 빠르게 읽혀짐
	static {
		
		try {
			
			Reader r = Resources.getResourceAsReader("mybatis/config/config.xml");			
			factory = new SqlSessionFactoryBuilder().build(r);
			r.close();		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	} //static
	
	////////////////////////////////////// 비즈니스 로직 //////////////////////////////////////
	
	
	// [전체보기]
	// category별 제품리스트 출력
	public static ProductVO[] getList(String category){
		
		// MemoVO형의 자원을 리스트로 받는다.
		SqlSession ss = factory.openSession(true);		
		List<ProductVO> list = ss.selectList("shop.list", category);
		
		// 리스트의 내용을 배열로 변환
		ProductVO[] vo_ar = null;
		
		if(list != null && list.size() > 0){
			vo_ar = new ProductVO[list.size()];
			list.toArray(vo_ar);
		}
		
		ss.close();
		
		return vo_ar;
		
	}
	
	
	// [메모저장]
	public static boolean add(ProductVO vo){
		
		boolean result = false;
		
		SqlSession ss = factory.openSession(false);
		int cnt = ss.insert("shop.add", vo);
		
		if(cnt == 1){
			result = true;
			ss.commit();
		} else {
			ss.rollback();
		}
		
		ss.close();
		
		return result;
		
		
	}
}
