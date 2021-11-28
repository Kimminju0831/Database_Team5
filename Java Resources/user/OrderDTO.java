package user;

public class OrderDTO{
	private int n;
	private String DELIVERY_CHARGE;
	private String DESIGN;
	private String PRODUCTION_TYPE;
	private String PRODUCTION_PRICE;
	private String ESTIMATED_DATE;
	private String PRODUCT_NUM;
	private String COMPANY_PWD;
	private String COMPANY_ID;
	private String UR_ID;
	private String ORGAN_ID;
	private String DO_NAME;
	
	public int getn() {
		return n;
	}
	
	public void setn(int n) {
		this.n = n;
	}
	
	public String getDELIVERY_CHARGE() {
		return DELIVERY_CHARGE;
	}
	
	public void setDELIVERY_CHARGE(String DELIVERY_CHARGE) {
		this.DELIVERY_CHARGE = DELIVERY_CHARGE;
	}
	
	public String getDESIGN() {
		return DESIGN;
	}
	
	public void setDESIGN(String DESIGN) {
		this.DESIGN = DESIGN;
	}
	
	public String getPRODUCTION_TYPE() {
		return PRODUCTION_TYPE;
	}
	
	public void setPRODUCTION_TYPE(String PRODUCTION_TYPE) {
		this.PRODUCTION_TYPE = PRODUCTION_TYPE;
	}
	
	public String getPRODUCTION_PRICE() {
		return PRODUCTION_PRICE;
	}
	
	public void setPRODUCTION_PRICE(String PRODUCTION_PRICE) {
		this.PRODUCTION_PRICE = PRODUCTION_PRICE;
	}
	
	public String getESTIMATED_DATE() {
		return ESTIMATED_DATE;
	}
	
	public void setESTIMATED_DATE(String ESTIMATED_DATE) {
		this.ESTIMATED_DATE = ESTIMATED_DATE;
	}
	
	public String getPRODUCT_NUM() {
		return PRODUCT_NUM;
	}
	
	public void setPRODUCT_NUM(String PRODUCT_NUM) {
		this.PRODUCT_NUM = PRODUCT_NUM;
	}
	
	public String getCOMPANY_PWD() {
		return COMPANY_PWD;
	}
	
	public void setCOMPANY_PWD(String COMPANY_PWD) {
		this.COMPANY_PWD = COMPANY_PWD;
	}
	
	public String getCOMPANY_ID() {
		return COMPANY_ID;
	}
	
	public void setCOMPANY_ID(String COMPANY_ID) {
		this.COMPANY_ID = COMPANY_ID;
	}
	
	public String getORGAN_ID() {
		return ORGAN_ID;
	}
	
	public void setORGAN_ID(String ORGAN_ID) {
		this.ORGAN_ID = ORGAN_ID;
	}
	
	public String getDO_NAME() {
		return DO_NAME;
	}
	
	public void setDO_NAME(String DO_NAME) {
		this.DO_NAME = DO_NAME;
	}
	
}