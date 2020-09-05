package GetterSetter;

import java.sql.Blob;

import javax.servlet.http.Part;

public class Suspect {
	String strCaseId, strSname, strSadd, strEviType, strEvidence, strPoints;
	Blob evidence, suspect;
	public String getStrCaseId() {
		return strCaseId;
	}
	public void setStrCaseId(String strCaseId) {
		this.strCaseId = strCaseId;
	}
	public String getStrSname() {
		return strSname;
	}
	public void setStrSname(String strSname) {
		this.strSname = strSname;
	}
	public String getStrSadd() {
		return strSadd;
	}
	public void setStrSadd(String strSadd) {
		this.strSadd = strSadd;
	}
	public String getStrEviType() {
		return strEviType;
	}
	public void setStrEviType(String strEviType) {
		this.strEviType = strEviType;
	}
	public String getStrEvidence() {
		return strEvidence;
	}
	public void setStrEvidence(String strEvidence) {
		this.strEvidence = strEvidence;
	}
	public String getStrPoints() {
		return strPoints;
	}
	public void setStrPoints(String strPoints) {
		this.strPoints = strPoints;
	}
	public Blob getEvidence() {
		return evidence;
	}
	public void setEvidence(Blob evidence) {
		this.evidence = evidence;
	}
	public Blob getSuspect() {
		return suspect;
	}
	public void setSuspect(Blob suspect) {
		this.suspect = suspect;
	}
	public Suspect(String strCaseId, String strSname, String strSadd, String strEviType, String strEvidence,
			String strPoints, Blob evidence, Blob suspect) {
		super();
		this.strCaseId = strCaseId;
		this.strSname = strSname;
		this.strSadd = strSadd;
		this.strEviType = strEviType;
		this.strEvidence = strEvidence;
		this.strPoints = strPoints;
		this.evidence = evidence;
		this.suspect = suspect;
	}
	public Suspect() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Suspect [strCaseId=" + strCaseId + ", strSname=" + strSname + ", strSadd=" + strSadd + ", strEviType="
				+ strEviType + ", strEvidence=" + strEvidence + ", strPoints=" + strPoints + ", evidence=" + evidence
				+ ", suspect=" + suspect + "]";
	}



	
}
