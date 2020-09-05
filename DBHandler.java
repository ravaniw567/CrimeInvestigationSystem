package DataHandler;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import javax.mail.Session;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import GetterSetter.Case;
import GetterSetter.Evidence;
import GetterSetter.Jails;
import GetterSetter.MissingPersons;
import GetterSetter.Officer;
import GetterSetter.Status;
import GetterSetter.PoliceStation;
import GetterSetter.ReportCase;
import GetterSetter.StolenVehicles;
import GetterSetter.Suspect;
import oracle.jdbc.pool.OracleDataSource;
import oracle.sql.BINARY_FLOAT;

@MultipartConfig

public class DBHandler {

	Connection con=null;
	PreparedStatement stmt=null;
	ResultSet rset=null;
	
	public Connection getDBCon()
    {
    	Connection con= null;
    	try
    	{
    		OracleDataSource ods= new OracleDataSource();
    		ods.setURL("jdbc:oracle:thin:@localhost:1521:xe");
    		con= ods.getConnection("system","oracle");
    		System.out.println("Connection Established");
    	}
    	catch(SQLException e)
    	{
    		e.printStackTrace();
    		System.out.println("Connection Error");
    	}
    	return con;
    }
	
	

	
	
	public void Reportcase(int intReportId, String strName ,String strEmail, int intContact , String strAddress ,String strState, String strCity ,String strReptType , String strDesc) {
		
		con=getDBCon();
		ReportCase reptcase=null;
		try {
			stmt=con.prepareStatement("insert into ReportCase values(?,?,?,?,?,?,?,?,?)");
			
			stmt.setInt(1, intReportId);
			stmt.setString(2, strName);
			stmt.setString(3, strEmail);
			stmt.setInt(4, intContact);
			stmt.setString(5, strAddress);
			stmt.setString(6, strState);
			stmt.setString(7, strCity);
			stmt.setString(8, strReptType);
			stmt.setString(9, strDesc);
			
			
			// reptcase=new ReportCase(intReportId, strName, strEmail, intContact, strAddress, strState, strCity, strReptType, strDesc);
			System.out.println(reptcase);
			 stmt.executeQuery();
			
			System.out.println("Case reported");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	public ReportCase RetriveReportId(String reportid) {
		
		con=getDBCon();
		ReportCase reprtCase=null;
		LinkedList<ReportCase> lst=new LinkedList<>();
		try {
			stmt=con.prepareStatement("select * from ReportCase where reportid=?");
			stmt.setString(1, reportid);
			
			System.out.println(reportid);
			rset=stmt.executeQuery();
	
		while(rset.next()) {
			String strName=rset.getString("namee");
			String strEmail=rset.getString("email");
			String strContact=rset.getString("contact");
			String strAddress=rset.getString("address");
			String strState=rset.getString("state");
			String strCity=rset.getString("city");
			String strType=rset.getString("reporttype");
			String strDesc=rset.getString("description");
			String strDate=rset.getString("datee");
			String strStatus=rset.getString("status");
			
			reprtCase=new ReportCase(reportid, strName, strEmail, strContact, strAddress, strState, strCity, strType, strDesc,strDate,strStatus);
			System.out.println(reprtCase);
			lst.add(reprtCase);
			}
			
		
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return reprtCase;
	}
	
	
	
	public LinkedList<PoliceStation> getPS(){
		con=getDBCon();
		LinkedList<PoliceStation> lst=new LinkedList();
		
		try {
			PreparedStatement stmt=con.prepareStatement("select * from PoliceStation");
			System.out.println("PS");
			rset=stmt.executeQuery();
			
			while(rset.next()) {
				System.out.println("PS1");
				String strPSname=rset.getString("PSname");
				String strPin=rset.getString("PSpin");
				String strInc=rset.getString("incharge");
				String strAdd=rset.getString("address");
				String strCity=rset.getString("city");
				String strState=rset.getString("state");
				String strphno=rset.getString("phnno");
				String strHC=rset.getString("highcourt");
				
				PoliceStation ps=new PoliceStation(strPSname, strPin, strInc, strAdd, strCity, strState, strphno, strHC);
				System.out.println(ps);
				lst.add(ps);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		System.out.println(lst);
		return lst;
	}
	
	
	public Officer RetriveOfficerBio(String oid) {
		con=getDBCon();
		LinkedList<Officer> lst=new LinkedList<>();
		Officer officer=null;
		try {
			stmt=con.prepareStatement("select * from officer where oidd=?");
			stmt.setString(1, oid);
			rset=stmt.executeQuery();
			
			while(rset.next()) {
				String strName=rset.getString("nam");
				String strPwd=rset.getString("pwd");
				String strEmail=rset.getString("email");
				String strPno=rset.getString("contact");
				String strAdd=rset.getString("address");
				String strPost=rset.getString("post");
				Blob img=rset.getBlob("pic");
				byte by[]=img.getBytes(1, (int) img.length());
				
				officer=new Officer(oid, strName, strPwd, strEmail, strPno, strAdd, strPost, img);
				System.out.println(oid+" "+strName+" "+strEmail);
				lst.add(officer);
			}
			System.out.println(lst);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return officer;
	}
	
	
	
	public void UpdatePwd(String id,String OldPwd,String newPwd) {
	con=getDBCon();
	//Officer officer=null;
	try {
		stmt=con.prepareStatement("update officer set pwd=? where id=? and pwd=?");
		stmt.setString(1, id);
		stmt.setString(2, OldPwd);
		stmt.setString(3, newPwd);
		
		stmt.executeUpdate();
		
	}catch(SQLException e) {
		e.printStackTrace();
	}
	}
	
	
	public LinkedList<ReportCase> ViewCases() {
		con=getDBCon();
		LinkedList<ReportCase> lst=new LinkedList();
		
		try {
			stmt=con.prepareStatement("select * from ReportCase");
			rset=stmt.executeQuery();
			
			while(rset.next()) {
				String strReportId=rset.getString("reportid");
				String strName=rset.getString("namee");
				String strEmail=rset.getString("email");
				String strPhnno=rset.getString("contact");
				String strAdd=rset.getString("address");
				String strState=rset.getString("state");
				String strCity=rset.getString("city");
				String strReportType=rset.getString("reporttype");
				String strDesc=rset.getString("description");
				String strDate=rset.getString("datee");
				String strStatus=rset.getString("status");
		
				System.out.println("view Cases");
				ReportCase reportcase=new ReportCase(strReportId, strName, strEmail, strPhnno, strAdd, strState, strCity, strReportType, strDesc, strDate,strStatus);
				lst.add(reportcase);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return lst;
	}
	
	
	public LinkedList<Jails> viewJails(){
		con=getDBCon();
		LinkedList<Jails> lst=new LinkedList<>();
		try {
			stmt=con.prepareStatement("select * from jails");
			rset=stmt.executeQuery();
			
			while(rset.next()) {
				
				String strJname=rset.getString("namee");
				String strArea=rset.getString("area");
				String strState=rset.getString("state");
				String strCity=rset.getString("city");
				String strContact=rset.getString("contact");
				String strPin=rset.getString("pin");
				String strNop=rset.getString("nop");
				String strCapacity=rset.getString("capacity");
				String strOwebsite=rset.getString("owebsite");
				
				Jails jails=new Jails(strJname, strArea, strState, strCity, strContact, strPin, strNop, strCapacity, strOwebsite);
				lst.add(jails);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return lst;
	}
	
	
	public LinkedList<MissingPersons> ViewMissingPersons() {
		con=getDBCon();
		LinkedList<MissingPersons> lst=new LinkedList();
		
		try {
			stmt=con.prepareStatement("select * from missingPersons");
			rset=stmt.executeQuery();
			
			while(rset.next()) {
				String strrefid=rset.getString("refid");
				String strfname=rset.getString("fname");
				String strlname=rset.getString("lname");
				String strage=rset.getString("age");
				String strgender=rset.getString("gender");
				String strrname=rset.getString("rname");
				String strrelation=rset.getString("relationship");
				String stremail=rset.getString("email");
				String strcontact=rset.getString("contactno");
				String strAdd=rset.getString("address");
				String strState=rset.getString("state");
				String strCity=rset.getString("city");
				String strmdate=rset.getString("missingdate");
				String strdate=rset.getString("datee");
				//Part img=rset.getByte("img");
				Blob img=rset.getBlob("img");
				byte by[]=img.getBytes(1, (int) img.length());
				/*response.setContentType("image/jpg");
				OutputStream o = response.getOutputStream();
				o.write(by);
				o.flush();
				o.close();*/
				
				System.out.println("view missing persons");
				MissingPersons mp=new MissingPersons(strrefid, strfname, strlname, strage, strgender, strrname, strrelation, stremail, strcontact, strAdd, strState, strCity, strmdate, strdate, img);
				lst.add(mp);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return lst;
	}
	
	
	
	public void AddMissingPersons(String strrefid, String strfname, String strlname, String strage, String strgender,
			String strrname, String strrelation, String stremail, String strcontact, String stradd, String strstate, String strCity, String mdate, Part img) throws IOException {
		con=getDBCon();
		
		try {
			stmt=con.prepareStatement("insert into missingPersons values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate)");
			
			System.out.println("missing person is adding....");
			
			stmt.setString(1, strrefid);
			stmt.setString(2, strfname);
			stmt.setString(3, strlname);
			stmt.setString(4, strage);
			stmt.setString(5, strgender);
			stmt.setString(6, strrname);
			stmt.setString(7, strrelation);
			stmt.setString(8, stremail);
			stmt.setString(9, strcontact);
			stmt.setString(10, stradd);
			stmt.setString(11, strstate);
			stmt.setString(12, strCity);
			stmt.setString(13, mdate);
			stmt.setBinaryStream(14, img.getInputStream(), img.getSize());
		/*	stmt.setString(15, date);*/
			
			stmt.executeQuery();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
	public LinkedList<StolenVehicles> getSVeh() throws IOException{
		con=getDBCon();
		LinkedList<StolenVehicles> lst=new LinkedList<>();
		
		try {
			stmt=con.prepareStatement("select * from stolenVeh");
			stmt.executeQuery();
			
			while(rset.next()) {
				String strRefno=rset.getString("refno");
				String strName=rset.getString("vname");
				String strCntct=rset.getString("contact");
				String strEmail=rset.getString("email");
				String strAdd=rset.getString("address");
				String strState=rset.getString("state");
				String strCity=rset.getString("city");
				String strVType=rset.getString("vtype");
				String strMan=rset.getString("manufacture");
				String strRno=rset.getString("rno");
				String strChasis=rset.getString("chasis");
				String strEngine=rset.getString("engine");
				String strYom=rset.getString("myear");
				String strColor=rset.getString("color");
				String strsdate=rset.getString("sdate");
			
				Blob Vpic=rset.getBlob("vimg");
				byte by[]=Vpic.getBytes(1, (int) Vpic.length());
				

				String strdate=rset.getString("datee");
				
				System.out.println("Stolen Vehicles");
				StolenVehicles sv=new StolenVehicles(strRefno, strName, strCntct, strEmail, strAdd, strState, strCity, strVType, strMan, strRno, strChasis, strEngine, strYom, strColor, strsdate, strdate, Vpic);
				lst.add(sv);
			}
			
			
			con.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return lst;
	}
	
	
	public void AddStolenVeh(String strRefno, String stName, String strCntct, String strEmail, String strAdd, String strState
			,String strCity, String strVtype, String strMan, String strRno, String strChasis, String strEngine, String strYom,
			String strColor, String strsdate,Part vpic) throws IOException {
	
		con=getDBCon();
		
		try {
			stmt=con.prepareStatement("insert into stolenVeh values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate)");
		
			stmt.setString(1, strRefno);
			stmt.setString(2, stName);
			stmt.setString(3, strCntct);
			stmt.setString(4, strEmail);
			stmt.setString(5, strAdd);
			stmt.setString(6, strState);
			stmt.setString(7, strCity);
			stmt.setString(8, strVtype);
			stmt.setString(9, strMan);
			stmt.setString(10, strRno);
			stmt.setString(11, strChasis);
			stmt.setString(12, strEngine);
			stmt.setString(13, strYom);
			stmt.setString(14, strColor);
			stmt.setString(15, strsdate);
			stmt.setBinaryStream(16, vpic.getInputStream(), vpic.getSize());
			stmt.executeQuery();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public void AddPS(String strPSname, String strPIN, String strInc, String strAdd, String strState, String strCity,
			String strPhn, String strHC) {
		con=getDBCon();
		try {
			stmt=con.prepareStatement("insert into PoliceStation values(?,?,?,?,?,?,?,?)");
			
			stmt.setString(1, strPSname);
			stmt.setString(2, strPIN);
			stmt.setString(3, strInc);
			stmt.setString(4, strAdd);
			stmt.setString(5, strState);
			stmt.setString(6, strCity);
			stmt.setString(7, strPhn);
			stmt.setString(8, strHC);
			
			stmt.executeQuery();
		}catch(SQLException e) {
		e.printStackTrace();
		}
		}

	
	public void AddOfficer(String strOid, String strName, String strPwd, String strEmail, String strContact, String strAddress,
			String strPost, Part pic) throws IOException {
		con=getDBCon();
		try {
			stmt=con.prepareStatement("insert into officer values(?,?,?,?,?,?,?,?)");
			
			stmt.setString(1, strOid);
			stmt.setString(2, strName);
			stmt.setString(3, strPwd);
			stmt.setString(4, strEmail);
			stmt.setString(5, strContact);
			stmt.setString(6, strAddress);
			stmt.setString(7, strPost);
			stmt.setBinaryStream(8, pic.getInputStream(), pic.getSize());
			
			System.out.println("DBhandler");
			
			stmt.executeQuery();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public void AddSuspects(String caseid, String sname, String address, String evitype, String evidence, String points, Part ievidence, Part isuspect) throws IOException {
		con=getDBCon();
		try {
			stmt=con.prepareStatement("insert into suspects values(?,?,?,?,?,?,?,?)");
			
			stmt.setString(1, caseid);
			stmt.setString(2, sname);
			stmt.setString(3, address);
			stmt.setString(4, evitype);
			stmt.setString(5, evidence);
			stmt.setString(6, points);
			stmt.setBinaryStream(7, ievidence.getInputStream(), ievidence.getSize());
			stmt.setBinaryStream(8, isuspect.getInputStream(), isuspect.getSize());
			
			stmt.executeQuery();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public void AddPrisoners(String strCaseId, String strName, String strJid , String strAdd,String strCrime,String strYop, String strPdate, String strRdate, String strPrison, Part img) throws IOException {
		con=getDBCon();
		try {
			stmt=con.prepareStatement("insert into prisoners values(?,?,?,?,?,?,?,?,?,?,sysdate)");
			
			stmt.setString(1, strCaseId);
			stmt.setString(2, strName);
			stmt.setString(3, strJid);
			stmt.setString(4, strAdd);
			stmt.setString(5, strCrime);
			stmt.setString(6, strYop);
			stmt.setString(7, strPdate);
			stmt.setString(8, strRdate);
			stmt.setString(9, strPrison);
			stmt.setBinaryStream(10, img.getInputStream(), img.getSize());
			
			stmt.executeQuery();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void UpdateCase(String status,String reportid) {
		con=getDBCon();
		try {
			stmt=con.prepareStatement("update ReportCase set status=? where reportid=?");
			
			stmt.setString(1, status);
			stmt.setString(2, reportid);
			
			System.out.println("DBhandler "+status+ " "+reportid);
			stmt.executeQuery();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public void Status(String strReportId, String strOidd) {
		con=getDBCon();
		try {
			stmt=con.prepareStatement("insert into status values(?,?,sysdate)");
			
			stmt.setString(1, strReportId);
			stmt.setString(2, strOidd);
			
			System.out.println("table status updated "+ strReportId+" "+strOidd);
			
			stmt.executeQuery();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public Status RetriveMyCases(String stroid) {
		con=getDBCon();
		LinkedList<Status> lst=new LinkedList<>();
		Status s=null;
		try {
			stmt=con.prepareStatement("select * from status where officerid=?");
			
			
			System.out.println("officer id in status tableee "+stroid);
			stmt.setString(1, stroid);
			rset=stmt.executeQuery();
			
			while(rset.next()) {
				String strReportId=rset.getString("refid");
				String date=rset.getString("datee");
			
			 s=new Status(strReportId, stroid, date);
			lst.add(s);
			
			}

			System.out.println("Status table retrived "+lst);
			
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return s;
	}

	
	
	public Status RetriveOidUsingRid(String strRefid) {
		con=getDBCon();
		LinkedList<Status> lst=new LinkedList<>();
		Status s=null;
		try {
			stmt=con.prepareStatement("select * from status where refid=?");
			
			
			System.out.println("officer id in status tableee "+strRefid);
			stmt.setString(1, strRefid);
			rset=stmt.executeQuery();
			
			while(rset.next()) {
				String strOid=rset.getString("officerid");
				String date=rset.getString("datee");
			
			 s=new Status(strRefid, strOid, date);
			lst.add(s);
			
			}

			System.out.println("Status table retrived "+lst);
			
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return s;
	}

	
	public Suspect RetriveSuspectsFromRefid(String strRefid) {
		con=getDBCon();
		LinkedList<Suspect> slst=new LinkedList<>();
		
		System.out.println(strRefid+" db handler suspects");
		
		Suspect s=null;
		try {
			stmt=con.prepareStatement("select * from suspects where reportid=?");
			
			stmt.setString(1, strRefid);
			
			rset=stmt.executeQuery();
			
			while(rset.next()) {
				String strSname=rset.getString("sname");
				String strSadd=rset.getString("sadd");
				String strEType=rset.getString("evitype");
				String strEvidence=rset.getString("evidence");
				String strPoints=rset.getString("points");
				Blob evidence=rset.getBlob("ievidence");
				byte eby[]=evidence.getBytes(1, (int) evidence.length());
				Blob suspect=rset.getBlob("isuspect");
				byte sby[]=suspect.getBytes(1, (int) suspect.length());
			
				System.out.println("Suspects retrived using case id");
				
				
				s=new Suspect(strRefid, strSname, strSadd, strEType, strEvidence, strPoints, evidence, suspect);
				slst.add(s);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
				return s;
	}
	
	}
