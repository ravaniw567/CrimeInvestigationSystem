package GetterSetter;

public class PoliceStation {

/*	PSname varchar(100),
	PSpin varchar(10),
	incharge varchar(100),
	address varchar(100),
	city varchar(100),
	state varchar(100),
	phnno varchar(12),
	highcourt varchar(100)*/
	
	String strPSname, strPin, strIncharge , strAdd, strCity, strState, strPno, strHC;

	public String getStrPSname() {
		return strPSname;
	}

	public void setStrPSname(String strPSname) {
		this.strPSname = strPSname;
	}

	public String getStrPin() {
		return strPin;
	}

	public void setStrPin(String strPin) {
		this.strPin = strPin;
	}

	public String getStrIncharge() {
		return strIncharge;
	}

	public void setStrIncharge(String strIncharge) {
		this.strIncharge = strIncharge;
	}

	public String getStrAdd() {
		return strAdd;
	}

	public void setStrAdd(String strAdd) {
		this.strAdd = strAdd;
	}

	public String getStrCity() {
		return strCity;
	}

	public void setStrCity(String strCity) {
		this.strCity = strCity;
	}

	public String getStrState() {
		return strState;
	}

	public void setStrState(String strState) {
		this.strState = strState;
	}

	public String getStrPno() {
		return strPno;
	}

	public void setStrPno(String strPno) {
		this.strPno = strPno;
	}

	public String getStrHC() {
		return strHC;
	}

	public void setStrHC(String strHC) {
		this.strHC = strHC;
	}

	public PoliceStation() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PoliceStation(String strPSname, String strPin, String strIncharge, String strAdd, String strCity,
			String strState, String strPno, String strHC) {
		super();
		this.strPSname = strPSname;
		this.strPin = strPin;
		this.strIncharge = strIncharge;
		this.strAdd = strAdd;
		this.strCity = strCity;
		this.strState = strState;
		this.strPno = strPno;
		this.strHC = strHC;
	}

	@Override
	public String toString() {
		return "PoliceStation [strPSname=" + strPSname + ", strPin=" + strPin + ", strIncharge=" + strIncharge
				+ ", strAdd=" + strAdd + ", strCity=" + strCity + ", strState=" + strState + ", strPno=" + strPno
				+ ", strHC=" + strHC + "]";
	}
	
	
	
}
