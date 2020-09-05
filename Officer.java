package GetterSetter;

import java.sql.Blob;

import javax.servlet.http.Part;

import oracle.sql.BINARY_FLOAT;

public class Officer {
/*	oidd number(5),
	nam varchar(10),
	pwd varchar(20),
	email varchar(30),
	contact number(10),
	address varchar(100),
	post varchar(100),
	pic blob*/

	
	String strId, strName, strPwd, strEmail, strPno, strAdd,strPost;
	Blob img;
	public Blob getImg() {
		return img;
	}
	public void setImg(Blob img) {
		this.img = img;
	}
	public String getStrPost() {
		return strPost;
	}
	public void setStrPost(String strPost) {
		this.strPost = strPost;
	}
	Part pic;
	public String getStrId() {
		return strId;
	}
	public void setStrId(String strId) {
		this.strId = strId;
	}
	public String getStrName() {
		return strName;
	}
	public void setStrName(String strName) {
		this.strName = strName;
	}
	public String getStrPwd() {
		return strPwd;
	}
	public void setStrPwd(String strPwd) {
		this.strPwd = strPwd;
	}
	public String getStrEmail() {
		return strEmail;
	}
	public void setStrEmail(String strEmail) {
		this.strEmail = strEmail;
	}
	public String getStrPno() {
		return strPno;
	}
	public void setStrPno(String strPno) {
		this.strPno = strPno;
	}
	public String getStrAdd() {
		return strAdd;
	}
	public void setStrAdd(String strAdd) {
		this.strAdd = strAdd;
	}
	public Part getPic() {
		return pic;
	}
	public void setPic(Part pic) {
		this.pic = pic;
	}
	public Officer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Officer(String strId, String strName, String strPwd, String strEmail, String strPno, String strAdd,
			String strPost, Blob img) {
		super();
		this.strId = strId;
		this.strName = strName;
		this.strPwd = strPwd;
		this.strEmail = strEmail;
		this.strPno = strPno;
		this.strAdd = strAdd;
		this.strPost = strPost;
		this.img = img;
		
	}
	@Override
	public String toString() {
		return "Officer [strId=" + strId + ", strName=" + strName + ", strPwd=" + strPwd + ", strEmail=" + strEmail
				+ ", strPno=" + strPno + ", strAdd=" + strAdd + ", strPost=" + strPost + ", img=" + img + ", pic=" + pic
				+ "]";
	}

	
	
}
