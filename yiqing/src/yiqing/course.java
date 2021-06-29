package yiqing;

public class course {
	private String ip;
	private String number;
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public course(String d,String p) {
		ip=d;
		number=p;

	}
}
