package GetterSetter;

import java.sql.Blob;

import javax.servlet.http.Part;

public class MissingPersons {
/*	refid varchar(100),
	fname varchar(100),
	lname varchar(100),
	age varchar(100),
	gender varchar(20),
	rname varchar(100),
	relationship varchar(100),
	email varchar(100),
	contactno varchar(20),
	address varchar(100),
	state varchar(100),
	city varchar(100),
	missingdate date,
	img blob
*/
String strrefid, strfnmae, strlame, strage, strgender, strrname, strrelation, stremail, strcontact,straddress, strstate, strcity, strmdate,strdate;
Blob img;
public String getStrrefid() {
	return strrefid;
}
public void setStrrefid(String strrefid) {
	this.strrefid = strrefid;
}
public String getStrfnmae() {
	return strfnmae;
}
public void setStrfnmae(String strfnmae) {
	this.strfnmae = strfnmae;
}
public String getStrlame() {
	return strlame;
}
public void setStrlame(String strlame) {
	this.strlame = strlame;
}
public String getStrage() {
	return strage;
}
public void setStrage(String strage) {
	this.strage = strage;
}
public String getStrgender() {
	return strgender;
}
public void setStrgender(String strgender) {
	this.strgender = strgender;
}
public String getStrrname() {
	return strrname;
}
public void setStrrname(String strrname) {
	this.strrname = strrname;
}
public String getStrrelation() {
	return strrelation;
}
public void setStrrelation(String strrelation) {
	this.strrelation = strrelation;
}
public String getStremail() {
	return stremail;
}
public void setStremail(String stremail) {
	this.stremail = stremail;
}
public String getStrcontact() {
	return strcontact;
}
public void setStrcontact(String strcontact) {
	this.strcontact = strcontact;
}
public String getStraddress() {
	return straddress;
}
public void setStraddress(String straddress) {
	this.straddress = straddress;
}
public String getStrstate() {
	return strstate;
}
public void setStrstate(String strstate) {
	this.strstate = strstate;
}
public String getStrcity() {
	return strcity;
}
public void setStrcity(String strcity) {
	this.strcity = strcity;
}
public String getStrmdate() {
	return strmdate;
}
public void setStrmdate(String strmdate) {
	this.strmdate = strmdate;
}
public String getStrdate() {
	return strdate;
}
public void setStrdate(String strdate) {
	this.strdate = strdate;
}
public Blob getImg() {
	return img;
}
public void setImg(Blob img) {
	this.img = img;
}
public MissingPersons() {
	super();
	// TODO Auto-generated constructor stub
}
public MissingPersons(String strrefid, String strfnmae, String strlame, String strage, String strgender,
		String strrname, String strrelation, String stremail, String strcontact, String straddress, String strstate,
		String strcity, String strmdate, String strdate, Blob img) {
	super();
	this.strrefid = strrefid;
	this.strfnmae = strfnmae;
	this.strlame = strlame;
	this.strage = strage;
	this.strgender = strgender;
	this.strrname = strrname;
	this.strrelation = strrelation;
	this.stremail = stremail;
	this.strcontact = strcontact;
	this.straddress = straddress;
	this.strstate = strstate;
	this.strcity = strcity;
	this.strmdate = strmdate;
	this.strdate = strdate;
	this.img = img;
}
@Override
public String toString() {
	return "MissingPersons [strrefid=" + strrefid + ", strfnmae=" + strfnmae + ", strlame=" + strlame + ", strage="
			+ strage + ", strgender=" + strgender + ", strrname=" + strrname + ", strrelation=" + strrelation
			+ ", stremail=" + stremail + ", strcontact=" + strcontact + ", straddress=" + straddress + ", strstate="
			+ strstate + ", strcity=" + strcity + ", strmdate=" + strmdate + ", strdate=" + strdate + ", img=" + img
			+ "]";
}
	

}
