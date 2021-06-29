package yiqing;

public class user {

	private String date;
	private String province;
	private String city;
	private String quezhen;
	private String zhiyu;
	private String dead;
	
	public user(String d,String p,String c,String qz,String zy,String de) {
		date=d;
		province=p;
		city=c;
		quezhen=qz;
		zhiyu=zy;
		dead=de;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getQuezhen() {
		return quezhen;
	}

	public void setQuezhen(String quezhen) {
		this.quezhen = quezhen;
	}

	public String getZhiyu() {
		return zhiyu;
	}

	public void setZhiyu(String zhiyu) {
		this.zhiyu = zhiyu;
	}

	public String getDead() {
		return dead;
	}

	public void setDead(String dead) {
		this.dead = dead;
	}

	

	
	
	
}
