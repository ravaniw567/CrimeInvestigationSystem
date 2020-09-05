package GetterSetter;

public class Status {
String reportid, officerid, date;

public String getReportid() {
	return reportid;
}

public void setReportid(String reportid) {
	this.reportid = reportid;
}

public String getOfficerid() {
	return officerid;
}

public void setOfficerid(String officerid) {
	this.officerid = officerid;
}

public String getDate() {
	return date;
}

public void setDate(String date) {
	this.date = date;
}

public Status() {
	super();
	// TODO Auto-generated constructor stub
}

public Status(String reportid, String officerid, String date) {
	super();
	this.reportid = reportid;
	this.officerid = officerid;
	this.date = date;
}

@Override
public String toString() {
	return "Status [reportid=" + reportid + ", officerid=" + officerid + ", date=" + date + "]";
}

}
