/*
 * AllDetail.java
 *
 * Created on March 4, 2011, 8:34 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package generalClass;
import java.sql.*;
import java.util.Vector;
import java.io.File;
import java.io.FileInputStream;
import bean.*;
import commonFunction.*;
import java.sql.*;
import java.util.Date;
import java.text.SimpleDateFormat;
/**
 *
 * @author anshuman
 */
public class AllDetail {
        Connection con = null;
	CallableStatement call= null;
	ResultSet rs = null;
	Statement stmt = null;
   public String AddUserTable(userBean UserObj,LoginBean lobj,String path) throws SQLException
	 {	
    String msg = "";	
    Connection con = null;
    Connection con1 = null;
    Connection con2 = null;
    CallableStatement call= null;
    GeneralBean cfun = new GeneralBean();
    try
    {
          
         Labcon lc = new Labcon();
         con = lc.getLocalConnection();
         stmt = con.createStatement();
         rs =stmt.executeQuery("Select LOGINNAME from ADDUSER where LOGINNAME='"+ UserObj.getloginName()+ "' ");
         int count=0;
         while(rs.next())
        {

         count++;
            }
         if (count>0) {
        msg = "Login Name already exists";
        } else {
          //Excute adduser store procedure
        	PreparedStatement pre = con.prepareStatement("insert into adduser (PASSWORD,FIRSTNAME,LASTNAME,LOGINNAME,GENDER,DOB,ADDRESS,CITY,STATE,PIN,TELEPHONE,FAX,EMAIL,Rights,ROLE,CUSTOMER_ID,USER_CREATION_DATE,USER_CREATEDBY,updation_date,intime,outtime,updated_by,mothername,changed_paswword_status) " +
        			"values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			pre.setString(1,UserObj.getpassword());
			pre.setString(2,UserObj.getfirstName());
            pre.setString(3,UserObj.getlastName());
            pre.setString(4,UserObj.getloginName());
            pre.setString(5,UserObj.getgender());
            pre.setString(6,UserObj.getdob());
            pre.setString(7,UserObj.getaddress());
            pre.setString(8,UserObj.getcity());
            pre.setString(9,UserObj.getstate());
            pre.setString(10,UserObj.getpin());
            pre.setString(11,UserObj.gettelephone());
            pre.setString(12,UserObj.getfax());
            pre.setString(13,UserObj.getemail());
            pre.setString(14,UserObj.getRights());
            pre.setString(15,UserObj.getrole());
            pre.setString(16,UserObj.getcustomer_id());
            pre.setString(17,UserObj.getcreated_date());
            pre.setString(18,UserObj.getcreatedBy());
            pre.setString(19,"");
            pre.setString(20,"");
            pre.setString(21,"");
            pre.setString(22,"");
            pre.setString(23,UserObj.getmotherName());
            pre.setString(24,"NO");
            pre.executeUpdate();
			System.out.println("adduser Successfully!");
			pre.close();
            System.out.println("sp_adduser completed");
          //Excute addaccountdetail store procedure  
          String accno=UserObj.getaccNum();
          String Newaccno=accno.substring(2,12);
          System.out.println("accno-"+accno);
          System.out.println("Newaccno-"+Newaccno);
          Labcon lc1 = new Labcon();
          con1 = lc1.getLocalConnection();
          PreparedStatement pre1 = con1.prepareStatement("insert into ACCOUNT_NUMBER,ACCOUNT_TYPE,AMMOUNT,STATUS,ACC_CREATEDBY,CUSTOMER_ID,ACC_CREATION_DATE,acc_updation_date,from_customerid,from_acc_number,deposited_date,acc_updated_by,ammount_type,amount_deposited)" +
          		" values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		  pre1.setString(1,accno);
		  pre1.setString(2,UserObj.getaccType());
          pre1.setString(3,UserObj.getammount());
          pre1.setString(4,UserObj.getaccStatus());
          pre1.setString(5,UserObj.getcreatedBy());
          pre1.setString(6,UserObj.getcustomer_id());
          pre1.setString(7,UserObj.getcreated_date());
          pre1.setString(8,"");
          pre1.setString(9,"");
          pre1.setString(10,"");
          pre1.setString(11,"");
          pre1.setString(12,"");
          pre1.setString(13,"");
          pre1.setString(14,"0.00");
     	  System.out.println("Inserting addaccountdetail Successfully!");
		  pre1.close();
         
          //Update ParameterTable(Field Name-:ACCOUNT_NUMBER)      
          Labcon lc2 = new Labcon();
          con2 = lc2.getLocalConnection();
          ResultSet rs2 = null;
	      Statement stmt2 = null;
          stmt2=con2.createStatement();
          String queryUpdate="Update ParameterTable set IdentityValue = '"+Newaccno+"'where Upper(IdentityName)='ACCOUNT_NUMBER'";
          System.err.println("Update parameter table execute--"+queryUpdate);
          stmt2.execute(queryUpdate);
          System.out.println("parameter completed");
          if((lobj.getImage().equalsIgnoreCase("")) && (lobj.getImage().equalsIgnoreCase("null")))
          {
              System.out.println("AddUserTable null");
          }
          else{
            System.out.println("AddUserTable Not null");
            String image = lobj.getImage();
			String imageId = lobj.getImageID();
			
			File imgfile = new File(image);

			System.out.println("<<>>*******"+image);
			FileInputStream fin = new FileInputStream(imgfile);

			PreparedStatement pre2 = con.prepareStatement("insert into ImageFile1 (imageid,image,imagename,userid) values(?,?,?,?)");
			pre2.setString(1,cfun.getGenerateId("IMAGEID"));
			pre2.setBinaryStream(2,fin,(int)imgfile.length());
            pre2.setString(3,path);
            pre2.setString(4,UserObj.getcustomer_id());
			
			System.out.println("image problem solved");
			pre2.executeUpdate();
			 System.out.println("ImageFile1 completed");
			System.out.println("Inserting Successfully!");
			pre2.close();
          }
                }
	     }
		catch(Exception e)
		 {
		 System.err.println("In AddUserTable Exception "+e);
		 System.err.println("In AddUserTable Exception "+e.getMessage());
		 }
		 return msg;
   }	 			

	 }

