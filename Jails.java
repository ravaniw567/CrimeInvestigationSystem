package GetterSetter;

public class Jails {
//
//	namee varchar(100),
//	area varchar(100),
//	state varchar(100),
//	city varchar(100),
//	contact varchar(20),
//	pin varchar(100),
//	nop varchar(100),
//	capacity varchar(100),
//	owebsite varchar(300)

	String strJname, strArea, strState, strCity, strContact, strPin, strNop, strCapacity, strOwebsite;

	public String getStrJname() {
		return strJname;
	}

	public void setStrJname(String strJname) {
		this.strJname = strJname;
	}

	public String getStrArea() {
		return strArea;
	}

	public void setStrArea(String strArea) {
		this.strArea = strArea;
	}

	public String getStrState() {
		return strState;
	}

	public void setStrState(String strState) {
		this.strState = strState;
	}

	public String getStrCity() {
		return strCity;
	}

	public void setStrCity(String strCity) {
		this.strCity = strCity;
	}

	public String getStrContact() {
		return strContact;
	}

	public void setStrContact(String strContact) {
		this.strContact = strContact;
	}

	public String getStrPin() {
		return strPin;
	}

	public void setStrPin(String strPin) {
		this.strPin = strPin;
	}

	public String getStrNop() {
		return strNop;
	}

	public void setStrNop(String strNop) {
		this.strNop = strNop;
	}

	public String getStrCapacity() {
		return strCapacity;
	}

	public void setStrCapacity(String strCapacity) {
		this.strCapacity = strCapacity;
	}

	public String getStrOwebsite() {
		return strOwebsite;
	}

	public void setStrOwebsite(String strOwebsite) {
		this.strOwebsite = strOwebsite;
	}

	public Jails() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Jails [strJname=" + strJname + ", strArea=" + strArea + ", strState=" + strState + ", strCity="
				+ strCity + ", strContact=" + strContact + ", strPin=" + strPin + ", strNop=" + strNop
				+ ", strCapacity=" + strCapacity + ", strOwebsite=" + strOwebsite + "]";
	}

	public Jails(String strJname, String strArea, String strState, String strCity, String strContact, String strPin,
			String strNop, String strCapacity, String strOwebsite) {
		super();
		this.strJname = strJname;
		this.strArea = strArea;
		this.strState = strState;
		this.strCity = strCity;
		this.strContact = strContact;
		this.strPin = strPin;
		this.strNop = strNop;
		this.strCapacity = strCapacity;
		this.strOwebsite = strOwebsite;
	}
	
	
	
}
