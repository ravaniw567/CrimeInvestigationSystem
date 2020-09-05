package GetterSetter;

public class ReportCase {
//	reportid number(20),
//	namee varchar(20),
//	email varchar(30),
//	contact number(10),
//	address varchar(100),
//	state varchar(40),
//	city varchar(40),
//	reporttype varchar(50),
//	description varchar(500)
//	datee date

	String strReportId, strName, strEmail, strContact, strAdd, strState, strCity, strReportType, strDesc, strDate, strStatus;

	public String getStrStatus() {
		return strStatus;
	}

	public void setStrStatus(String strStatus) {
		this.strStatus = strStatus;
	}

	@Override
	public String toString() {
		return "ReportCase [strReportId=" + strReportId + ", strName=" + strName + ", strEmail=" + strEmail
				+ ", strContact=" + strContact + ", strAdd=" + strAdd + ", strState=" + strState + ", strCity="
				+ strCity + ", strReportType=" + strReportType + ", strDesc=" + strDesc + ", strDate=" + strDate + "]";
	}

	public ReportCase() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReportCase(String strReportId, String strName, String strEmail, String strContact, String strAdd,
			String strState, String strCity, String strReportType, String strDesc, String strDate, String strStatus) {
		super();
		this.strReportId = strReportId;
		this.strName = strName;
		this.strEmail = strEmail;
		this.strContact = strContact;
		this.strAdd = strAdd;
		this.strState = strState;
		this.strCity = strCity;
		this.strReportType = strReportType;
		this.strDesc = strDesc;
		this.strDate = strDate;
		this.strStatus = strStatus;
	}

	public String getStrReportId() {
		return strReportId;
	}

	public void setStrReportId(String strReportId) {
		this.strReportId = strReportId;
	}

	public String getStrName() {
		return strName;
	}

	public void setStrName(String strName) {
		this.strName = strName;
	}

	public String getStrEmail() {
		return strEmail;
	}

	public void setStrEmail(String strEmail) {
		this.strEmail = strEmail;
	}

	public String getStrContact() {
		return strContact;
	}

	public void setStrContact(String strContact) {
		this.strContact = strContact;
	}

	public String getStrAdd() {
		return strAdd;
	}

	public void setStrAdd(String strAdd) {
		this.strAdd = strAdd;
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

	public String getStrReportType() {
		return strReportType;
	}

	public void setStrReportType(String strReportType) {
		this.strReportType = strReportType;
	}

	public String getStrDesc() {
		return strDesc;
	}

	public void setStrDesc(String strDesc) {
		this.strDesc = strDesc;
	}

	public String getStrDate() {
		return strDate;
	}

	public void setStrDate(String strDate) {
		this.strDate = strDate;
	}
	
	
}
