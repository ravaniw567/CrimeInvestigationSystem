package Controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//import javax.security.auth.message.config.ServerAuthContext;
import javax.servlet.ServletConfig;
//import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Connection ;

import oracle.jdbc.pool.OracleDataSource;

@WebServlet("/AuthOfficer")
public class AuthOfficer extends HttpServlet 
	{
	    Connection con=null;
	  PreparedStatement stmt= null;
	  ResultSet rset= null;
    public AuthOfficer() 
    {
    	
    }		
	
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
    
    public void init(ServletConfig config) throws ServletException
    {
    		con=getDBCon();
    		try
    		{
    		  stmt= con.prepareStatement("select * from officer where oidd=? and pwd=?");
    		  System.out.println("Statement");
    		}
    		catch(SQLException e)
    		{
    			e.printStackTrace();
    		}
    		System.out.println("Init Fired");
    }
    
    public void destroy()
    {
    	try
    	{
    		if(stmt!=null)
    		{
    			stmt.close();
    		}
    		if(rset!=null)
    		{
    			rset.close();
    		}
    		if(con!=null)
    		{
    			con.close();
    		}
    	}
    		catch (Exception e) 
    		{
    			e.printStackTrace();
			}
    	System.out.println("Destroy Fired");
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	String strOid=request.getParameter("id");
    	String strPwd= request.getParameter("pwd");
    	//String strPost=request.getParameter("post");
    	System.out.println(strOid+" "+strPwd);
    	
    	try
    	{
    		stmt.setString(1, strOid);
    		stmt.setString(2, strPwd);
    		//stmt.setString(3, strPost);
    		
    		rset=stmt.executeQuery();
    		System.out.println("2"+" "+strOid+" "+strPwd);
    		
    	if(rset.next()) {
    		System.out.println("try");
    
    		HttpSession session=request.getSession();
        	session.setAttribute("oid", strOid);
        	response.sendRedirect(request.getContextPath()+"/OfficerAfterLogin.jsp?oidd="+strOid+"");
    	}
    	
    	else
    	{
    		response.sendRedirect(request.getContextPath()+"/ErrorPage.html");
    	}
    	
    	}
    	catch (SQLException e) 
    	{
			e.printStackTrace();
		}
    	
    }
    	
	}	
    	