package GetterSetter;

import java.sql.Blob;

import javax.servlet.http.Part;

public class StolenVehicles {
/*	refno varchar(30),
	datee sysdate,
	vname varchar(100),
	contact varchar(100),
	email varchar(100),
	address varchar(100),
	state varchar(100),
	city varchar(100),
	vtype varchar(100),
	manufacture varchar(100),
	rno varchar(100),
	chasis varchar(100),
	engine varchar(100),
	myear varchar(100),
	color varchar(100),
	sdate date,
	vpic blob
*/	

String strRefno, strName, strCntct, strEmail, strAdd, strState, strCity, strVType, strMan, strRno, strChasis, strEngine, strYom,
	strColor,strsdate,strdate;
Blob vimg;
public StolenVehicles(String strRefno, String strName, String strCntct, String strEmail, String strAdd, String strState,
		String strCity, String strVType, String strMan, String strRno, String strChasis, String strEngine,
		String strYom, String strColor, String strsdate, String strdate, Blob vimg) {
	super();
	this.strRefno = strRefno;
	this.strName = strName;
	this.strCntct = strCntct;
	this.strEmail = strEmail;
	this.strAdd = strAdd;
	this.strState = strState;
	this.strCity = strCity;
	this.strVType = strVType;
	this.strMan = strMan;
	this.strRno = strRno;
	this.strChasis = strChasis;
	this.strEngine = strEngine;
	this.strYom = strYom;
	this.strColor = strColor;
	this.strsdate = strsdate;
	this.strdate = strdate;
	this.vimg = vimg;
}
@Override
public String toString() {
	return "StolenVehicles [strRefno=" + strRefno + ", strName=" + strName + ", strCntct=" + strCntct + ", strEmail="
			+ strEmail + ", strAdd=" + strAdd + ", strState=" + strState + ", strCity=" + strCity + ", strVType="
			+ strVType + ", strMan=" + strMan + ", strRno=" + strRno + ", strChasis=" + strChasis + ", strEngine="
			+ strEngine + ", strYom=" + strYom + ", strColor=" + strColor + ", strsdate=" + strsdate + ", strdate="
			+ strdate + ", vimg=" + vimg + "]";
}
public StolenVehicles() {
	super();
	// TODO Auto-generated constructor stub
}
public StolenVehicles(String strdate) {
	super();
	this.strdate = strdate;
}
public String getStrRefno() {
	return strRefno;
}
public void setStrRefno(String strRefno) {
	this.strRefno = strRefno;
}
public String getStrName() {
	return strName;
}
public void setStrName(String strName) {
	this.strName = strName;
}
public String getStrCntct() {
	return strCntct;
}
public void setStrCntct(String strCntct) {
	this.strCntct = strCntct;
}
public String getStrEmail() {
	return strEmail;
}
public void setStrEmail(String strEmail) {
	this.strEmail = strEmail;
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
public String getStrVType() {
	return strVType;
}
public void setStrVType(String strVType) {
	this.strVType = strVType;
}
public String getStrMan() {
	return strMan;
}
public void setStrMan(String strMan) {
	this.strMan = strMan;
}
public String getStrRno() {
	return strRno;
}
public void setStrRno(String strRno) {
	this.strRno = strRno;
}
public String getStrChasis() {
	return strChasis;
}
public void setStrChasis(String strChasis) {
	this.strChasis = strChasis;
}
public String getStrEngine() {
	return strEngine;
}
public void setStrEngine(String strEngine) {
	this.strEngine = strEngine;
}
public String getStrYom() {
	return strYom;
}
public void setStrYom(String strYom) {
	this.strYom = strYom;
}
public String getStrColor() {
	return strColor;
}
public void setStrColor(String strColor) {
	this.strColor = strColor;
}
public String getStrsdate() {
	return strsdate;
}
public void setStrsdate(String strsdate) {
	this.strsdate = strsdate;
}
public String getStrdate() {
	return strdate;
}
public void setStrdate(String strdate) {
	this.strdate = strdate;
}
public Blob getVimg() {
	return vimg;
}
public void setVimg(Blob vimg) {
	this.vimg = vimg;
}


}
