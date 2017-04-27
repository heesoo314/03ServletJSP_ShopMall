package mybatis.vo;

public class ProductVO {

	private String num, category, name, company, image_s, image_l, content, p_date;
	private int quant;
	private int price, saleprice, totalprice;
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getImage_s() {
		return image_s;
	}
	public void setImage_s(String image_s) {
		this.image_s = image_s;
	}
	public String getImage_l() {
		return image_l;
	}
	public void setImage_l(String image_l) {
		this.image_l = image_l;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		return p_date;
	}
	public void setDate(String date) {
		this.p_date = date;
	}
	public int getQuant() {
		return quant;
	}
	public void setQuant(int quant) {
		this.quant = quant;
		
		// 수량이 변경될 때 총 금액도 변경
		setTotalprice(quant * saleprice);
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSaleprice() {
		return saleprice;
	}
	public void setSaleprice(int saleprice) {
		this.saleprice = saleprice;
		
		// 판매가 변경될 때 총 금액도 변경
		setTotalprice(quant * saleprice);
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	
	
	// 할인율 구하기
	public String getPercent(){
		
		float per = (price - saleprice) *100 / price;
		int value = (int)per;
		
		return String.valueOf(value) + "%";
	}
}
