/*
 * GeneralBean.java
 *
 * Created on February 13, 2011, 2:41 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package commonFunction;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import javax.servlet.http.HttpServlet;
import java.io.*;
import java.security.*;
import sun.misc.*;
import javax.naming.*;


	public  class GeneralBean extends HttpServlet 
	{
		
		protected Connection con = null;
		protected Statement stmt = null;
		protected Statement stmt1 = null;
		protected ResultSet rs = null;
		private String FieldId = null;
		
		
		/**
		 * Method finallys.
		 */
		private void  finallys()
		{
			try
			{
			 if(rs!=null)
			 {
		  			try
		  			{
		  				rs.close();
		  				rs=null;
		  			}
		  			catch(Exception e1)
		  			{}
		  		}	
		  		
		  		if(stmt!=null)
		  		{
		  			try
		  			{
		  				stmt.close();
		  				stmt=null;
		  			}
		  			catch(Exception e2)
		  			{}
				}
				if(stmt1!=null)
				{
		  			try
		  			{
		  				stmt.close();
		  				stmt=null;
		  			}
		  			catch(Exception e21)
		  			{}
				}  		 		
		  		if(con!=null)
		  		{
		  			try
		  			{
		  				con.close();
		  				con=null;
		  			}
		  			catch(Exception e3)
		  			{}
		  		}
			}
			catch(Exception e)
			{
				System.err.println("finallys Exception : "+e);
			}	
			
		}
		
	public String getGenerateId(String fName) throws SQLException
		{	
			String identityname = fName;
			Labcon lc = new Labcon();
			try {
				con = lc.getLocalConnection();
				stmt = con.createStatement();
				String strPrefix="";
				int Id=0;
			    System.out.println("Select IdentityName,IdentityValue from  ParameterTable where Upper(IdentityName)='" + fName.toUpperCase().trim() +"'");
				rs = stmt.executeQuery("Select IdentityName,IdentityValue from  ParameterTable where Upper(IdentityName)='" + fName.toUpperCase().trim() +"'");

				if (rs.next())
					fName = rs.getString("IdentityValue");
				strPrefix = fName.substring(0,2);			
				Id = Integer.parseInt(fName.substring(2,10));
				Id++;
				String temp = Integer.toString(Id);
				for(int i=8;i>temp.length();i--)
				{
					strPrefix+="0";
				}
				fName = strPrefix+Id;
				stmt1 = con.createStatement();
			        System.out.println("Update ParameterTable set IdentityValue = '"+ fName +"'where Upper(IdentityName)='" + identityname.toUpperCase().trim() +"'");
				stmt1.executeUpdate("Update ParameterTable set IdentityValue = '"+ fName +"'where Upper(IdentityName)='" + identityname.toUpperCase().trim() +"'");
			          } catch(Exception exc) {
				// TODO Auto-generated catch block
				   System.err.print(exc.getMessage());    
			}
			
			finally{
				if(rs!=null){
		  			try{
		  				rs.close();
		  				rs=null;
		  			}
		  			catch(Exception e1)
		  			{}
		  		}	
		  		
		  		if(stmt!=null){
		  			try{
		  				stmt.close();
		  				stmt=null;
		  			}
		  			catch(Exception e2)
		  			{}
				}
				if(stmt1!=null){
		  			try{
		  				stmt.close();
		  				stmt=null;
		  			}
		  			catch(Exception e21)
		  			{}
				}  		 		
		  		if(con!=null){
		  			try{
		  				con.close();
		  				con=null;
		  			}
		  			catch(Exception e3)
		  			{}
		  		}
			 }				
				return fName;	
		}
		
			
	public String getNewGenerateId(String name) throws SQLException
		{	
			String identityname = name;
			Labcon lc = new Labcon();
			try {
				con = lc.getLocalConnection();
				stmt = con.createStatement();
				String strPrefix="";
				int Id=0;
			    System.out.println("Select IdentityName,IdentityValue from  ParameterTable where Upper(IdentityName)='" + name.toUpperCase().trim() +"'");
				rs = stmt.executeQuery("Select IdentityName,IdentityValue from  ParameterTable where Upper(IdentityName)='" + name.toUpperCase().trim() +"'");

				if (rs.next())
				name = rs.getString("IdentityValue");
				strPrefix = name.substring(0,2);			
				Id = Integer.parseInt(name.substring(2,10));
				Id++;
				String temp = Integer.toString(Id);
				for(int i=8;i>temp.length();i--)
				{
					strPrefix+="0";
				}
				name = strPrefix+Id;
                System.out.println("id=="+name);
                System.out.println("identityname=="+identityname);
				//stmt1 = con.createStatement();
			        //System.out.println("Update ParameterTable set IdentityValue = '"+ fName +"'where Upper(IdentityName)='" + identityname.toUpperCase().trim() +"'");
				//stmt1.executeUpdate("Update ParameterTable set IdentityValue = '"+ fName +"'where Upper(IdentityName)='" + identityname.toUpperCase().trim() +"'");
			          } catch(Exception exc) {
				// TODO Auto-generated catch block
				   System.err.print(exc.getMessage());    
			}
			
			finally{
				if(rs!=null){
		  			try{
		  				rs.close();
		  				rs=null;
		  			}
		  			catch(Exception e1)
		  			{}
		  		}	
		  		
		  		if(stmt!=null){
		  			try{
		  				stmt.close();
		  				stmt=null;
		  			}
		  			catch(Exception e2)
		  			{}
				}
				if(stmt1!=null){
		  			try{
		  				stmt.close();
		  				stmt=null;
		  			}
		  			catch(Exception e21)
		  			{}
				}  		 		
		  		if(con!=null){
		  			try{
		  				con.close();
		  				con=null;
		  			}
		  			catch(Exception e3)
		  			{}
		  		}
			 }				
				return name;	
		}
		
			
public void updateNewId(String idName, String idValue) throws SQLException
	{
		       Labcon lc = new Labcon();
		       con = lc.getLocalConnection();
                    try{
			
			stmt = con.createStatement();
			String strSql="Update ParameterTable set IdentityValue = '"+ idValue +"'where Upper(IdentityName)='" + idName.toUpperCase().trim() +"'";
			int updated=stmt.executeUpdate(strSql);
			//System.out.println("strSql:" + strSql);
		}catch(Exception e){
			System.err.println("updateNewId Exception :"+e.getMessage());
		}finally{
			if(stmt!=null) stmt.close();
			if(con!=null) con.close();
			
		}
		
	}	
			
 public Vector getDelimitedList(String temp,String deLimitType){
    int i =0;
    boolean flag=true;
    Vector tempList = new Vector();
    if(temp.length()>0){
            while(flag){   
            i= temp.indexOf(deLimitType);
            String str = temp.substring(0,i);
            tempList.addElement(str);
            temp = temp.substring(i+1,temp.length());
            i=0;
            if(temp.length()>0)
                    flag=true;
            i= temp.indexOf(deLimitType);
            if (i<=0){
                    i=temp.length();
                    flag=false;
            }
            }
		}
		return tempList;
	}	
 public String Val(String str)
	{
		return (str.equals("0"))?"":str;
	}
 public String checkNull(String value) {
       	if(value=="null" || value==null)
       	{return "";}
       	return value;
       }
 public String CheckVal(String val)
              {
              String c="on";
              if(val!=null)
              {
               return val;
              }
             else
             {
             return "off";
             }
                           
              }
 public String Encrypt(String mystr) throws Exception{
     MessageDigest md=null;
     String L_encrypt=new String();
     
     try
		{
			md=MessageDigest.getInstance("SHA");
		}
		catch(NoSuchAlgorithmException e)
		{
			System.err.println("Exception in  :"+e.getClass());
			System.err.println("Exception is  :"+e);
			System.err.println("Exception is  :"+e.getMessage());
			throw new ServiceUnavailableException(e.getMessage());
		}
		try
		{
			md.update(mystr.getBytes("UTF-8"));
		}
		catch(UnsupportedEncodingException e1)
		{
			System.err.println("Exception in  :"+e1.getClass());
			System.err.println("Exception is  :"+e1);
			System.err.println("Exception is  :"+e1.getMessage());
			throw new ServiceUnavailableException(e1.getMessage());
		}
		
		byte L_Str[]=md.digest();
		
		L_encrypt=(new BASE64Encoder()).encode(L_Str);
		
		System.out.println("Encrypted in general bean::->"+L_encrypt);
           return L_encrypt;
       }
 
		}