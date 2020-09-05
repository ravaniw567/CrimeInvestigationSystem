package DataHandler;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
//import java.net.PasswordAuthentication;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GetterSetter.ReportCase;
//import classes.SMS;
//import oracle.jdbc.driver.Message;
import oracle.jdbc.pool.OracleDataSource;
import javax.servlet.http.Part;


@MultipartConfig
@WebServlet("/DBH")
public class DBH extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	DBHandler objDB=new DBHandler();	
	Connection con= null;
	PreparedStatement stmt=null;
	ResultSet rset=null;
	
	
	public Connection getDBCon()
    {
    	
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

	
    public DBH() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String strBtn=request.getParameter("btn");

		System.out.println("btn name is: "+strBtn);

		DBHandler objDB=new DBHandler();
		
		if(strBtn.equals("prisoners")) {
			String strCaseid=request.getParameter("caseid");
			String strName=request.getParameter("name");
			String strId=request.getParameter("id");
			String strAdd=request.getParameter("add");
			String strCrime=request.getParameter("crime");
			String strYOP=request.getParameter("yop");
			String strPdate=request.getParameter("pdate");
			String strRdate=request.getParameter("rdate");
			String strPrison=request.getParameter("prison");
			Part img=request.getPart("img");
			objDB.AddPrisoners(strCaseid, strName, strId, strAdd, strCrime, strYOP, strPdate, strRdate, strPrison, img);
			
			response.sendRedirect(request.getContextPath()+"/AddPrisoners.jsp");
			
			}else if(strBtn.equals("updateStatus")){
				String strStatus=request.getParameter("status");
				String strCaseId=request.getParameter("ReportId");
				
				System.out.println(strCaseId);
				System.out.println("DBH update case"+ strCaseId);
				
				String stroid=request.getParameter("oid");
				
				System.out.println("officer id: "+stroid);
				
				objDB.UpdateCase(strStatus, strCaseId);
				//objDB.RetriveOfficerBio(stroid);
				objDB.Status(strCaseId, stroid);
				response.sendRedirect(request.getContextPath()+"/UpdateCase.jsp");

			}

		else if(strBtn.equals("vehicles")) {
			String strrefid=request.getParameter("refno");
			String strname=request.getParameter("vname");
			String strCntct=request.getParameter("vphn");
			String strEmail=request.getParameter("vemail");
			String strAdd=request.getParameter("vadd");
			String strState=request.getParameter("vstate");
			String strCity=request.getParameter("vcity");
			String strVType=request.getParameter("vtype");
			String strMan=request.getParameter("vman");
			String strReg=request.getParameter("vreg");
			String strChasis=request.getParameter("chasis");
			String strEngine=request.getParameter("engine");
			String strYom=request.getParameter("yom");
			String strColor=request.getParameter("colour");
			String strsdate=request.getParameter("sdate");
			Part vimg=request.getPart("vimg");
			SendSms("Your reference no. of this Case is:- "+strrefid+" .Please Save it for future Reference.Regards ", strCntct);
			
			response.sendRedirect(request.getContextPath()+"/ReportCrime.jsp");
			System.out.println("veh are adding.."+strrefid);
			objDB.AddStolenVeh(strrefid, strname, strCntct, strEmail, strAdd, strState, strCity, strVType, strMan, strReg, strChasis, strEngine, strYom, strColor, strsdate,vimg );
		}else if(strBtn.equals("suspects")){
			String strCaseId=request.getParameter("caseid");
			String strSName=request.getParameter("sname");
			String strAdd=request.getParameter("address");
			String strEType=request.getParameter("etype");
			String strEvi=request.getParameter("evi");
			String strPoints=request.getParameter("points");
			Part strIEvi=request.getPart("evidence");
			Part strSPic=request.getPart("suspect");
			
			objDB.AddSuspects(strCaseId, strSName, strAdd, strEType, strEvi, strPoints, strIEvi, strSPic);
			response.sendRedirect(request.getContextPath()+"/AddSuspects.jsp");
		}
		
		else if(strBtn.equals("missingPersons")){
				
				String strrefid=request.getParameter("refno");
				String strfname=request.getParameter("fname");
				String strlname=request.getParameter("lname");
				String strage=request.getParameter("mage");
				String strgender=request.getParameter("gender");
				String strrname=request.getParameter("mreporter");
				String strrelation=request.getParameter("mrelation");
				String stremail=request.getParameter("memail");
				String strcontact=request.getParameter("mcntct");
				String stradd=request.getParameter("madd");
				String strstate=request.getParameter("mstate");
				String strcity=request.getParameter("mcity");
				String strdate=request.getParameter("mdate");
				Part img=request.getPart("mimg");
				System.out.println("going to db handler");
				objDB.AddMissingPersons(strrefid, strfname, strlname, strage, strgender, strrname, strrelation, stremail, strcontact, stradd, strstate, strcity, strdate, img);
				//objDB.AddMissingPersons(strrefid, strfname, strlname, strage, strgender, strrname, strrelation, stremail, strcontact, stradd, strstate, strcity, strdate, img);
				SendSms("Your reference no. of this Case is:- "+strrefid+" .Please Save it for future Reference.Regards ", strcontact);
				
				response.sendRedirect(request.getContextPath()+"/ReportCrime.jsp");

			}else if(strBtn.equals("addOfficer")){
				String strOid=request.getParameter("oidd");
				String strName=request.getParameter("name");
				String strPwd=request.getParameter("pwd");
				String strEmail=request.getParameter("email");
				String strAdd=request.getParameter("address");
				String strContact=request.getParameter("contact");
				String strPost=request.getParameter("post");
				Part img=request.getPart("img");
				
				objDB.AddOfficer(strOid, strName, strPwd, strEmail, strContact, strAdd, strPost, img);
				response.sendRedirect(request.getContextPath()+"/AddOfficer.jsp");
			}

		else if(strBtn.equals("ReportCase")) {
		
		String intReportId=request.getParameter("refno");
		HttpSession session=request.getSession();
		session.setAttribute("refid", intReportId);
		
		String strName=request.getParameter("name");
		String strEmail=request.getParameter("email");
		String intContact=request.getParameter("contact");
		String strAddress=request.getParameter("address");
		String strState=request.getParameter("rstate");
		String strCity=request.getParameter("rcity");
		String strType=request.getParameter("type");
		String strDesc=request.getParameter("description");
		
		//String strSubject="Regarding Reported Case";

        

        System.out.println(strAddress+ strState+strCity);
        
        try {
        	con=getDBCon();
        	
        	stmt=con.prepareStatement("insert into ReportCase values(?,?,?,?,?,?,?,?,?,'pending',sysdate)");
        	stmt.setString(1, intReportId);
        	stmt.setString(2, strName);
        	stmt.setString(3, strEmail);
        	stmt.setString(4, intContact);
        	stmt.setString(5, strAddress);
        	stmt.setString(6, strState);
        	stmt.setString(7, strCity);
        	stmt.setString(8, strType);
        	stmt.setString(9, strDesc);
       
        	//ReportCase reptcase=new ReportCase(intReportId, strName, strEmail, intContact, strAddress, strState, strCity, strType, strDesc,strDate);
        	//System.out.println(reptcase);
        	rset=stmt.executeQuery();
            System.out.println("Insert into Report Case");

            
        	System.out.println(intReportId );
			System.out.println("started");
			SendSms("Your reference no. of this Case is:- "+intReportId+" .Please Save it for future Reference.Regards ", intContact);
		
		
		          response.sendRedirect(request.getContextPath()+"/ReportCrime.jsp");
            }

            catch(SQLException e )
            {
                            e.printStackTrace();
                            System.out.println("Error in report Case");
            }

		

/*            final String username = "ravaniw567@gmail.com";
            final String password = "wadhwa r!";

            Properties props = new Properties();

            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");

            Session session = Session.getInstance(props,

                    new javax.mail.Authenticator() {

                                  protected PasswordAuthentication getPasswordAuthentication() {
                                	  System.out.println(username+" "+password);
                                  return new PasswordAuthentication(username, password);

                                  }

                    });

            try {
                            Message message1 =  new MimeMessage(session);

                             message1.setFrom(new InternetAddress("EmailTo"));

                            message1.setRecipients(Message.RecipientType.TO,

                            InternetAddress.parse(strEmail));

                             message1.setSubject(strSubject);

                            message1.setText("Your refernce number is "+intReportId+

                                            "\n\n \n Thank You !!!");
                           Transport.send(message1);;
                            System.out.println("Done");

            } catch (MessagingException e) {

                            throw new RuntimeException(e);
     
            	}
           */
		}
	        }	

    
	public  void SendSms(String message,String number) {
    	
    	try {
    	//number=request.getParameter("contact");
    		System.out.println(number);
    		//System.out.println(refid);
    	String apiKey="zkhBmibrDcFtA2qX5WC7OUw8evsNIYGMfyl1QJj4Po6duLagZTE6tPFa1SLz9CkibOJx5TQ2nAcDMRwY";
    	String strSendId="FSTSMS";
    	message=URLEncoder.encode(message,"UTF-8");
    	String language="english";
    	String route="p";
    	String myUrl="https://www.fast2sms.com/dev/bulk?authorization="+apiKey+"&sender_id="+strSendId+"&message="+message+"&language="+language+"&route="+route+"&numbers="+number;
    	System.out.println(myUrl);
    	
    	URL url=new URL(myUrl);
    	HttpsURLConnection ucon=(HttpsURLConnection) url.openConnection();
    	
    	ucon.setRequestMethod("GET");
    	
    	ucon.setRequestProperty("User-agent", "Mozilla/5.0");
    	ucon.setRequestProperty("cache-control", "no-cache");
    	
    	int code=ucon.getResponseCode();
    	System.out.println("Responde Code"+code);
    	
    	StringBuffer bfr=new StringBuffer();
    	BufferedReader br=new BufferedReader(new InputStreamReader(ucon.getInputStream()));
    	
    	while(true) {
    		String line=br.readLine();
    		if(line==null) {
    			break;
    		}
    		bfr.append(line);
    	}
    	}
    	catch (Exception e) {
			// TODO: handle exception
    		e.printStackTrace();
    	}
	}
	
	
	
          }
		



