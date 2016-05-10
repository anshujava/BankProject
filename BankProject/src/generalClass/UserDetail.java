/*
 * UserDetail.java
 *
 * Created on February 12, 2011, 7:05 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package generalClass;

import java.sql.*;
import java.util.Vector;
import java.io.File;
import java.io.FileInputStream;
import java.sql.*;
import java.util.Vector;

import javax.naming.NamingException;
import bean.*;
import commonFunction.*;
import java.sql.*;
import java.util.Date;
import java.text.SimpleDateFormat;

/**
 * 
 * @author anshuman
 */
public class UserDetail {
	Connection con = null;
	CallableStatement call = null;
	ResultSet rs = null;
	Statement stmt = null;

	/** Creates a new instance of UserDetail */
	public String CheckLogin(LoginBean Objlogin) throws SQLException {

		String msg = "";

		try {
			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String strSql = "select LOGINNAME,password from adduser where LOGINNAME='"
					+ Objlogin.getUserName()
					+ "'and password='"
					+ Objlogin.getPassword() + "'";
			System.err.println("queryCheckLogin--" + strSql);
			rs = stmt.executeQuery(strSql);

			int count = 0;
			while (rs.next()) {

				count++;
			}

			if (count > 0) {
				msg = "";
			} else {
				msg = "Wrong LoginName/Password";
			}

		} catch (Exception e) {
			System.err.print("CheckLogin Exception : " + e);
			System.err.println("CheckLogin Exception : " + e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e1) {
				}
			}

			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e2) {
				}
			}
			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}

		return msg;
	}

	public String LoginUserID(LoginBean Objlogin) throws SQLException {
		String UserID = "";

		Date todaysDate = new java.util.Date();
		SimpleDateFormat formatter = new SimpleDateFormat(
				"dd-MMM-yyyy HH:mm:ss");
		String formattedDate = formatter.format(todaysDate);
		try { // con.setAutoCommit(false);
			Labcon lc = new Labcon();

			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String strSql = "select CUSTOMER_ID from adduser where LOGINNAME='"
					+ Objlogin.getUserName() + "'and password='"
					+ Objlogin.getPassword() + "'";
			System.err.println("queryLoginUserID--" + strSql);
			rs = stmt.executeQuery(strSql);

			while (rs.next()) {
				UserID = rs.getString("CUSTOMER_ID");

			}
			Statement stmt1 = null;
			stmt1 = con.createStatement();
			String queryUpdate = "Update adduser set intime = '"
					+ formattedDate + "'where CUSTOMER_ID='" + UserID + "'";
			System.err.println("Update adduser intime execute--" + queryUpdate);
			stmt1.execute(queryUpdate);
			// con.setAutoCommit(true);

		} catch (Exception e) {
			System.err.print("LoginUserID Exception : " + e);
			System.err.println("LoginUserID Exception : " + e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e1) {
				}
			}

			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e2) {
				}
			}
			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}

		return UserID;
	}

	public String userfullName(String userId) throws SQLException {
		String userName = "";

		try {
			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String strSql = "select FIRSTNAME,LASTNAME from ADDUSER where CUSTOMER_ID='"
					+ userId + "'";
			System.out.println("query-->" + strSql);
			rs = stmt.executeQuery(strSql);
			while (rs.next()) {
				userName = rs.getString("FIRSTNAME") + " "
						+ rs.getString("LASTNAME");
			}
		} catch (Exception e) {
			System.err.println("In-UserDetail- userName Exception  " + e);
			System.err.println("In-UserDetail- userName Exception  "
					+ e.getMessage());

		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e1) {
				}
			}

			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e2) {
				}
			}
			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}

		return userName;
	}

	public String changePwdStatus(String userId) throws SQLException {
		String pwdStatus = "";

		try {
			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String strSql = "select changed_paswword_status from ADDUSER where CUSTOMER_ID='"
					+ userId + "'";
			System.out.println("query-->" + strSql);
			rs = stmt.executeQuery(strSql);
			while (rs.next()) {
				pwdStatus = rs.getString("changed_paswword_status");
			}
		} catch (Exception e) {
			System.err
					.println("In-UserDetail- changePwdStatus Exception  " + e);
			System.err.println("In-UserDetail- changePwdStatus Exception  "
					+ e.getMessage());

		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e1) {
				}
			}

			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e2) {
				}
			}
			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}

		return pwdStatus;
	}

	/*
	 * public String AddUserTable(userBean UserObj) throws SQLException
	 * 
	 * { Connection con = null; CallableStatement call= null; String msg = "";
	 * ResultSet rs = null; Statement stmt = null; Statement stmt1 = null; try {
	 * 
	 * Labcon lc = new Labcon(); con = lc.getLocalConnection(); stmt =
	 * con.createStatement(); rs
	 * =stmt.executeQuery("Select LOGINNAME from ADDUSER where LOGINNAME='"+
	 * UserObj.getloginName()+ "' "); int count=0; while(rs.next()) {
	 * 
	 * count++; } if (count>0) { msg = "Login already exists"; } else { String
	 * query =
	 * "insert into ADDUSER(FIRSTNAME,LASTNAME,GENDER,LOGINNAME,PASSWORD,DOB,ADDRESS,CITY,STATE,PIN,TELEPHONE,FAX,EMAIL,ROLE,USER_CREATION_DATE,CUSTOMER_ID,USER_CREATEDBY,mothername) values ('"
	 * +UserObj.getfirstName()+ "','"+UserObj.getlastName()+
	 * "','"+UserObj.getgender()+ "','"+UserObj.getloginName()+
	 * "','"+UserObj.getpassword()+ "','"+UserObj.getdob()+
	 * "','"+UserObj.getaddress()+ "','"+UserObj.getcity()+
	 * "','"+UserObj.getstate()+ "','"+UserObj.getpin()+
	 * "','"+UserObj.gettelephone()+ "','"+UserObj.getfax()+
	 * "','"+UserObj.getemail()+ "','"+UserObj.getrole()+
	 * "','"+UserObj.getcreated_date()+ "','"+UserObj.getcustomer_id()+
	 * "','"+UserObj.getcreatedBy()+ "','"+UserObj.getmotherName()+ "')";
	 * System.err.println("query in adduser execute--:::"+query);
	 * stmt.executeUpdate(query); String query1 =
	 * "insert into ADDACCOUNTDETAIL(ACC_CREATION_DATE,CUSTOMER_ID,ACC_CREATEDBY,ACCOUNT_NUMBER,ACCOUNT_TYPE,AMMOUNT,STATUS)values ('"
	 * +UserObj.getcreated_date()+ "','"+UserObj.getcustomer_id()+
	 * "','"+UserObj.getcreatedBy()+ "','"+UserObj.getaccNum()+
	 * "','"+UserObj.getaccType()+ "','"+UserObj.getammount()+
	 * "','"+UserObj.getaccStatus()+ "')";
	 * System.err.println("query1 in addacc execute--"+query1);
	 * stmt.executeUpdate(query1); stmt1 = con.createStatement(); String
	 * queryUpdate="Update ParameterTable set IdentityValue = '"+
	 * UserObj.getaccNum() +"'where Upper(IdentityName)='ACCOUNT_NUMBER'";
	 * System.err.println("Update parameter table execute--"+queryUpdate);
	 * stmt1.execute(queryUpdate);
	 * 
	 * } } catch(Exception e) {
	 * System.err.println("In AddUserTable & ACCOUNT Exception "+e);
	 * System.err.println
	 * ("In AddUserTable & ACCOUNT Exception "+e.getMessage()); } finally{
	 * if(call!=null){ try{ call.close(); call=null; } catch(Exception e1) {} }
	 * 
	 * if(con!=null){ try{ con.close(); con=null; } catch(Exception e3) {} } }
	 * return msg; }
	 */
	public Vector UserRole(String userId) throws SQLException {
		Vector vList = new Vector();

		try {

			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String strSql = "select rights from adduser where customer_id='"
					+ userId + "'";
			System.out.println("UserRole query--" + strSql);
			rs = stmt.executeQuery(strSql);

			while (rs.next()) {
				String temp[] = new String[10];
				temp[0] = rs.getString("rights");
				vList.add(temp);
			}

		} catch (Exception e) {
			System.err.print("UserRole Exception : " + e);
			System.err.println("UserRole Exception : " + e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e1) {
				}
			}

			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e2) {
				}
			}
			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}

		return vList;
	}

	public Vector AccountList() throws SQLException {
		Vector vList = new Vector();

		try {
			// String userId="ID00000000";
			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String strSql = "select a.ACCOUNT_NUMBER,a.CUSTOMER_ID from addaccountdetail a,adduser u where a.CUSTOMER_ID=u.customer_id";
			System.out.println("AccountList query--" + strSql);
			rs = stmt.executeQuery(strSql);

			while (rs.next()) {
				String temp[] = new String[10];
				temp[0] = rs.getString("ACCOUNT_NUMBER");
				temp[1] = rs.getString("CUSTOMER_ID");
				vList.add(temp);
			}

		} catch (Exception e) {
			System.err.print("AccountList Exception : " + e);
			System.err.println("AccountList Exception : " + e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e1) {
				}
			}

			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e2) {
				}
			}
			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}

		return vList;
	}

	public Vector RoleList() throws SQLException {
		Vector vList = new Vector();

		try {
			// String userId="ID00000000";
			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String strSql = "select role,roleid from roletable ORDER BY role";
			System.out.println("RoleList query--" + strSql);
			rs = stmt.executeQuery(strSql);

			while (rs.next()) {
				String temp[] = new String[10];
				temp[0] = rs.getString("role");
				temp[1] = rs.getString("roleid");
				vList.add(temp);
			}

		} catch (Exception e) {
			System.err.print("RoleList Exception : " + e);
			System.err.println("RoleList Exception : " + e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e1) {
				}
			}

			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e2) {
				}
			}
			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}

		return vList;
	}

	public Vector StateList() throws SQLException {
		Vector vList = new Vector();

		try {
			// String userId="ID00000000";
			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String strSql = "select state_name,intial_name from state ORDER BY state_name";
			System.out.println("StateList query--" + strSql);
			rs = stmt.executeQuery(strSql);

			while (rs.next()) {
				String temp[] = new String[10];
				temp[0] = rs.getString("state_name");
				temp[1] = rs.getString("intial_name");
				vList.add(temp);
			}

		} catch (Exception e) {
			System.err.print("StateList Exception : " + e);
			System.err.println("StateList Exception : " + e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e1) {
				}
			}

			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e2) {
				}
			}
			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}

		return vList;
	}

	public String Rights(String RoleID) throws SQLException {
		String rights = "";

		try {
			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String strSql = "select status from formstable where role='"
					+ RoleID + "'";
			System.out.println("query-->" + strSql);
			rs = stmt.executeQuery(strSql);
			while (rs.next()) {
				rights = rs.getString("status");
			}
		} catch (Exception e) {
			System.err.println("In-UserDetail- Rights Exception  " + e);
			System.err.println("In-UserDetail- Rights Exception  "
					+ e.getMessage());

		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e1) {
				}
			}

			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e2) {
				}
			}
			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}

		return rights;
	}

	public Vector AccTypeList() throws SQLException {
		Vector vList = new Vector();

		try {
			// String userId="ID00000000";
			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String strSql = "select ACCOUNT_TYPE from ACCOUNTTYPE_TABLE ORDER BY ACCOUNT_TYPE";
			System.out.println("AccTypeList query--" + strSql);
			rs = stmt.executeQuery(strSql);

			while (rs.next()) {
				String temp[] = new String[10];
				temp[0] = rs.getString("ACCOUNT_TYPE");
				vList.add(temp);
			}

		} catch (Exception e) {
			System.err.print("AccTypeList Exception : " + e);
			System.err.println("AccTypeList Exception : " + e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e1) {
				}
			}

			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e2) {
				}
			}
			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}

		return vList;
	}

	public Vector UserDetailList(String Accnum) throws SQLException {
		Vector vList = new Vector();

		try {
			// String userId="ID00000000";
			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String strSql = "select u.FIRSTNAME,u.LASTNAME,u.GENDER,u.LOGINNAME,u.PASSWORD,u.DOB,u.ADDRESS,u.CITY,u.STATE,u.PIN,u.TELEPHONE,u.FAX,u.EMAIL,u.ROLE,u.USER_CREATEDBY,u.CUSTOMER_ID,u.mothername,u.rights,a.ACCOUNT_TYPE,a.AMMOUNT,a.STATUS from adduser u,addaccountdetail a where a.account_number='"
					+ Accnum + "' and a.CUSTOMER_ID=u.customer_id";
			System.out.println("UserDetailList query--" + strSql);
			rs = stmt.executeQuery(strSql);

			while (rs.next()) {
				String temp[] = new String[25];
				temp[0] = rs.getString("FIRSTNAME");
				temp[1] = rs.getString("LASTNAME");
				temp[2] = rs.getString("GENDER");
				temp[3] = rs.getString("LOGINNAME");
				temp[4] = rs.getString("PASSWORD");
				temp[5] = rs.getString("DOB");
				temp[6] = rs.getString("ADDRESS");
				temp[7] = rs.getString("CITY");
				temp[8] = rs.getString("STATE");
				temp[9] = rs.getString("PIN");
				temp[10] = rs.getString("TELEPHONE");
				temp[11] = rs.getString("FAX");
				temp[12] = rs.getString("EMAIL");
				temp[13] = rs.getString("ROLE");
				temp[14] = rs.getString("USER_CREATEDBY");
				temp[15] = rs.getString("ACCOUNT_TYPE");
				temp[16] = rs.getString("AMMOUNT");
				temp[17] = rs.getString("STATUS");
				temp[18] = rs.getString("CUSTOMER_ID");
				temp[19] = rs.getString("mothername");
				temp[20] = rs.getString("rights");

				vList.add(temp);
			}

		} catch (Exception e) {
			System.err.print("UserDetailList Exception : " + e);
			System.err.println("UserDetailList Exception : " + e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e1) {
				}
			}

			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e2) {
				}
			}
			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}

		return vList;
	}

	public String updateAddUserTable(userBean UserObj, LoginBean lobj,
			String filepath) throws SQLException {
		Connection con = null;
		CallableStatement call = null;
		String msg = "";
		ResultSet rs = null;
		Statement stmt = null;
		Statement stmt1 = null;
		Statement stmt2 = null;
		GeneralBean cfun = new GeneralBean();
		try {

			Labcon lc = new Labcon();
			con = lc.getLocalConnection();

			stmt1 = con.createStatement();
			String queryUpdate = "Update adduser set firstname='"
					+ UserObj.getfirstName() + "',LASTNAME='"
					+ UserObj.getlastName() + "',GENDER='"
					+ UserObj.getgender() + "',DOB='" + UserObj.getdob()
					+ "',ADDRESS='" + UserObj.getaddress() + "',CITY='"
					+ UserObj.getcity() + "',STATE='" + UserObj.getstate()
					+ "',PIN='" + UserObj.getpin() + "',TELEPHONE='"
					+ UserObj.gettelephone() + "',FAX='" + UserObj.getfax()
					+ "',EMAIL='" + UserObj.getemail() + "',ROLE='"
					+ UserObj.getrole() + "',updation_date='"
					+ UserObj.getcreated_date() + "',updated_by='"
					+ UserObj.getcreatedBy() + "',mothername='"
					+ UserObj.getmotherName() + "',rights='"
					+ UserObj.getRights() + "' where customer_id ='"
					+ UserObj.getcustomer_id() + "'";
			System.err.println("Update adduser table-" + queryUpdate);
			stmt1.execute(queryUpdate);
			stmt2 = con.createStatement();
			String queryUpdate1 = "Update addaccountdetail set ACCOUNT_TYPE='"
					+ UserObj.getaccType() + "',AMMOUNT='"
					+ UserObj.getammount() + "',STATUS='"
					+ UserObj.getaccStatus() + "',acc_updation_date='"
					+ UserObj.getcreated_date() + "',acc_updated_by='"
					+ UserObj.getcreatedBy() + "',ammount_type='"
					+ UserObj.getammountType() + "' where customer_id ='"
					+ UserObj.getcustomer_id() + "'";
			System.err.println("Update addaccount-" + queryUpdate1);
			stmt2.execute(queryUpdate1);
			if ((lobj.getImage().equalsIgnoreCase(""))
					&& (lobj.getImage().equalsIgnoreCase("null"))) {
				System.out.println("Image field is null");
			} else {
				String image = lobj.getImage();
				String imageId = lobj.getImageID();

				File imgfile = new File(image);

				System.out.println("*******" + image);
				FileInputStream fin = new FileInputStream(imgfile);
				System.out.println("Image field is not null");
				stmt = con.createStatement();
				rs = stmt
						.executeQuery("Select imageid from ImageFile1 where userid='"
								+ UserObj.getcustomer_id() + "'");
				int count = 0;
				while (rs.next()) {

					count++;
				}
				if (count > 0) {

					PreparedStatement pre1 = con
							.prepareStatement("DELETE FROM ImageFile1 WHERE userid='"
									+ UserObj.getcustomer_id() + "'");
					System.out.println("delete-");
					pre1.executeUpdate();

					PreparedStatement pre = con
							.prepareStatement("insert into ImageFile1 (imageid,image,imagename,userid) values(?,?,?,?)");
					pre.setString(1, cfun.getGenerateId("IMAGEID"));
					pre.setBinaryStream(2, fin, (int) imgfile.length());
					pre.setString(3, filepath);
					pre.setString(4, UserObj.getcustomer_id());

					System.out.println("in if image problem solved");
					pre.executeUpdate();
					System.out.println("in if Inserting Successfully!");
					pre.close();

				} else {

					PreparedStatement pre2 = con
							.prepareStatement("insert into ImageFile1 (imageid,image,imagename,userid) values(?,?,?,?)");
					pre2.setString(1, cfun.getGenerateId("IMAGEID"));
					pre2.setBinaryStream(2, fin, (int) imgfile.length());
					pre2.setString(3, filepath);
					pre2.setString(4, UserObj.getcustomer_id());

					System.out.println("in else image problem solved");
					pre2.executeUpdate();
					System.out.println("in else Inserting Successfully!");
					pre2.close();
				}
			}
		} catch (Exception e) {
			System.err.println("In update AddUserTable & ACCOUNT Exception "
					+ e);
			System.err.println("In update AddUserTable & ACCOUNT Exception "
					+ e.getMessage());
		} finally {
			if (call != null) {
				try {
					call.close();
					call = null;
				} catch (Exception e1) {
				}
			}

			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}
		return msg;
	}

	public Vector allUserDetailList() throws SQLException {
		Vector vList = new Vector();

		try {
			// String userId="ID00000000";
			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String strSql = "select u.FIRSTNAME,u.LASTNAME,u.GENDER,u.DOB,u.ADDRESS,u.CITY,u.STATE,u.PIN,u.TELEPHONE,u.FAX,u.EMAIL,u.ROLE,u.USER_CREATEDBY,u.USER_CREATION_DATE,a.ACCOUNT_NUMBER,a.ACCOUNT_TYPE,a.STATUS from adduser u,addaccountdetail a where a.CUSTOMER_ID=u.customer_id";
			System.out.println("allUserDetailList query--" + strSql);
			rs = stmt.executeQuery(strSql);

			while (rs.next()) {
				String temp[] = new String[20];
				temp[0] = rs.getString("FIRSTNAME") + " "
						+ rs.getString("LASTNAME");
				temp[1] = rs.getString("GENDER");
				temp[2] = rs.getString("DOB");
				temp[3] = rs.getString("ADDRESS");
				temp[4] = rs.getString("CITY");
				temp[5] = rs.getString("STATE");
				temp[6] = rs.getString("PIN");
				temp[7] = rs.getString("TELEPHONE");
				temp[8] = rs.getString("FAX");
				temp[9] = rs.getString("EMAIL");
				temp[10] = rs.getString("ROLE");
				temp[11] = rs.getString("USER_CREATEDBY");
				temp[12] = rs.getString("USER_CREATION_DATE");
				temp[13] = rs.getString("account_number");
				temp[14] = rs.getString("ACCOUNT_TYPE");
				temp[15] = rs.getString("STATUS");

				vList.add(temp);
			}

		} catch (Exception e) {
			System.err.print("allUserDetailList Exception : " + e);
			System.err.println("allUserDetailList Exception : "
					+ e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e1) {
				}
			}

			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e2) {
				}
			}
			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}

		return vList;
	}

	public Vector UserloginStatus(String UserId) throws SQLException {
		Vector vList = new Vector();

		try {
			// String userId="ID00000000";
			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String strSql = "select intime,outtime from adduser where CUSTOMER_ID='"
					+ UserId + "'";
			System.out.println("UserloginStatus query--" + strSql);
			rs = stmt.executeQuery(strSql);

			while (rs.next()) {
				String temp[] = new String[20];
				temp[0] = rs.getString("intime");
				temp[1] = rs.getString("outtime");

				vList.add(temp);
			}

		} catch (Exception e) {
			System.err.print("UserloginStatus Exception : " + e);
			System.err.println("UserloginStatus Exception : " + e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e1) {
				}
			}

			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e2) {
				}
			}
			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}

		return vList;
	}

	public String accNo(String userId) throws SQLException {
		String accNumber = "";

		try {
			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String strSql = "select account_number from addaccountdetail where CUSTOMER_ID='"
					+ userId + "'";
			System.out.println("accNoquery-->" + strSql);
			rs = stmt.executeQuery(strSql);
			while (rs.next()) {
				accNumber = rs.getString("account_number");
			}
		} catch (Exception e) {
			System.err.println("In-accNo Exception  " + e);
			System.err.println("In-accNo Exception  " + e.getMessage());

		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e1) {
				}
			}

			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e2) {
				}
			}
			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}

		return accNumber;
	}

	public String avlBalance(String userId) throws SQLException {
		String avlBalance = "";

		try {
			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String strSql = "select ammount from addaccountdetail where CUSTOMER_ID='"
					+ userId + "'";
			System.out.println("avlBalance-->" + strSql);
			rs = stmt.executeQuery(strSql);
			while (rs.next()) {
				avlBalance = rs.getString("ammount");
			}
		} catch (Exception e) {
			System.err.println("In-avlBalance Exception  " + e);
			System.err.println("In-avlBalance Exception  " + e.getMessage());

		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e1) {
				}
			}

			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e2) {
				}
			}
			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}

		return avlBalance;
	}

	public double getAmmount(String custId) throws SQLException {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		Labcon lc = new Labcon();
		double oldAmmount = 0.00;
		try {

			String strSql;
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			strSql = "Select AMMOUNT from addaccountdetail where CUSTOMER_ID='"
					+ custId + "'";
			rs = stmt.executeQuery(strSql);

			while (rs.next()) {
				oldAmmount = rs.getDouble("AMMOUNT");
				System.out.println("amount in getammount" + oldAmmount);
			}

		} catch (Exception e) {
			System.err.println("In getAmmount Exception :" + e);
			System.err.println("In getAmmount Exception :" + e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e1) {
				}
			}

			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e2) {
				}
			}
			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}

		return oldAmmount;
	}

	public String updateAccountBalance(userBean UserObj, String AmountType)
			throws SQLException {
		Connection con = null;
		CallableStatement call = null;
		String msg = "";
		ResultSet rs = null;

		Statement stmt1 = null;
		Statement stmt = null;
		Date todaysDate = new java.util.Date();
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
		String formattedDate = formatter.format(todaysDate);
		try {

			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			if (AmountType.equalsIgnoreCase("Credited")) {
				stmt1 = con.createStatement();
				String queryUpdate = "Update addaccountdetail set from_acc_number='"
						+ UserObj.getfromAccno()
						+ "',AMMOUNT='"
						+ UserObj.getdepositAmmount()
						+ "',deposited_date='"
						+ UserObj.getcreated_date()
						+ "',from_customerid='"
						+ UserObj.getcustomer_id()
						+ "',ammount_type='"
						+ UserObj.getammountType()
						+ "',amount_deposited='"
						+ UserObj.getdepositdAmmount()
						+ "'where ACCOUNT_NUMBER='"
						+ UserObj.gettoAccno()
						+ "'";
				System.err.println("updateCredit in Account-" + queryUpdate);
				stmt1.execute(queryUpdate);
			} else {
				stmt = con.createStatement();
				String queryUpdate = "Update addaccountdetail set AMMOUNT='"
						+ UserObj.getdepositAmmount() + "',deposited_date='"
						+ UserObj.getcreated_date() + "',ammount_type='"
						+ UserObj.getammountType() + "',amount_deposited='"
						+ UserObj.getwithdrawAmmount()
						+ "' where ACCOUNT_NUMBER='" + UserObj.getaccNum()
						+ "'";
				System.err.println("update Withdraw in Account-" + queryUpdate);
				stmt.execute(queryUpdate);

			}
		} catch (Exception e) {
			System.err.println("In updateAccountBalance Exception " + e);
			System.err.println("In updateAccountBalance Exception "
					+ e.getMessage());
		} finally {
			if (call != null) {
				try {
					call.close();
					call = null;
				} catch (Exception e1) {
				}
			}

			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}
		return msg;
	}

	public Vector AccountList(String accNo) throws SQLException {
		Vector vList = new Vector();

		try {
			// String userId="ID00000000";
			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String strSql = "select ACCOUNT_NUMBER,CUSTOMER_ID from addaccountdetail where ACCOUNT_NUMBER!='"
					+ accNo + "'";
			System.out.println("AccountList query--" + strSql);
			rs = stmt.executeQuery(strSql);

			while (rs.next()) {
				String temp[] = new String[10];
				temp[0] = rs.getString("ACCOUNT_NUMBER");
				temp[1] = rs.getString("CUSTOMER_ID");
				vList.add(temp);
			}

		} catch (Exception e) {
			System.err.print("AccountList Exception : " + e);
			System.err.println("AccountList Exception : " + e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e1) {
				}
			}

			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e2) {
				}
			}
			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}

		return vList;
	}

	public Vector Withdrawl(String userId) throws SQLException {
		Vector vList = new Vector();

		try {
			// String userId="ID00000000";
			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String strSql = "select u.FIRSTNAME,u.LASTNAME,a.ACCOUNT_TYPE,a.AMMOUNT from adduser u,addaccountdetail a where a.CUSTOMER_ID='"
					+ userId + "' and a.CUSTOMER_ID=u.customer_id";
			System.out.println("UserDetailList query--" + strSql);
			rs = stmt.executeQuery(strSql);

			while (rs.next()) {
				String temp[] = new String[20];
				temp[0] = rs.getString("FIRSTNAME");
				temp[1] = rs.getString("LASTNAME");
				temp[2] = rs.getString("ACCOUNT_TYPE");
				temp[3] = rs.getString("AMMOUNT");
				vList.add(temp);
			}

		} catch (Exception e) {
			System.err.print("UserDetailList Exception : " + e);
			System.err.println("UserDetailList Exception : " + e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e1) {
				}
			}

			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e2) {
				}
			}
			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}

		return vList;
	}

	public String updateBalance(String bal, String uId, String ammount_type,
			String trasfer_ammount) throws SQLException {
		Connection con = null;
		CallableStatement call = null;
		String msg = "";
		ResultSet rs = null;
		Statement stmt1 = null;
		Date todaysDate = new java.util.Date();
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
		String formattedDate = formatter.format(todaysDate);

		try {

			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt1 = con.createStatement();
			String queryUpdate = "Update addaccountdetail set AMMOUNT='" + bal
					+ "',AMMOUNT_TYPE='" + ammount_type
					+ "',amount_deposited='" + trasfer_ammount
					+ "',deposited_date='" + formattedDate
					+ "' where CUSTOMER_ID='" + uId + "'";
			System.err.println("updateBalance in Account-" + queryUpdate);
			stmt1.execute(queryUpdate);

		} catch (Exception e) {
			System.err.println("In updateBalance Exception " + e);
			System.err.println("In updateBalance Exception " + e.getMessage());
		} finally {
			if (call != null) {
				try {
					call.close();
					call = null;
				} catch (Exception e1) {
				}
			}

			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}
		return msg;
	}

	public Vector BalanceEnq(String userId) throws SQLException {
		Vector vList = new Vector();

		try {
			// String userId="ID00000000";
			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String strSql = "select a.ACCOUNT_NUMBER,a.AMMOUNT,a.ACCOUNT_TYPE,u.firstname,u.lastname from addaccountdetail a,adduser u where u.customer_id ='"
					+ userId + "' and a.CUSTOMER_ID=u.customer_id";
			System.out.println("AccountList query--" + strSql);
			rs = stmt.executeQuery(strSql);

			while (rs.next()) {
				String temp[] = new String[10];
				temp[0] = rs.getString("ACCOUNT_NUMBER");
				temp[1] = rs.getString("AMMOUNT");
				temp[2] = rs.getString("ACCOUNT_TYPE");
				temp[3] = rs.getString("firstname");
				temp[4] = rs.getString("lastname");

				vList.add(temp);
			}

		} catch (Exception e) {
			System.err.print("AccountList Exception : " + e);
			System.err.println("AccountList Exception : " + e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e1) {
				}
			}

			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e2) {
				}
			}
			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}

		return vList;
	}

	public Vector userAcc(String userID) throws SQLException {
		Vector vList = new Vector();

		try {
			// String userId="ID00000000";
			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String strSql = "select u.ACCOUNT_NUMBER,a.firstname,a.lastname,u.ammount from adduser a,addaccountdetail u where u.customer_id ='"
					+ userID + "' and a.CUSTOMER_ID=u.customer_id";
			System.out.println("userAcc query--" + strSql);
			rs = stmt.executeQuery(strSql);

			while (rs.next()) {
				String temp[] = new String[10];
				temp[0] = rs.getString("ACCOUNT_NUMBER");
				temp[1] = rs.getString("firstname");
				temp[2] = rs.getString("lastname");
				temp[3] = rs.getString("ammount");
				vList.add(temp);
			}

		} catch (Exception e) {
			System.err.print("userAcc Exception : " + e);
			System.err.println("userAcc Exception : " + e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e1) {
				}
			}

			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e2) {
				}
			}
			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}

		return vList;
	}

	public Vector miniStatement(String userID) throws SQLException {
		Vector vList = new Vector();

		try {
			// String userId="ID00000000";
			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String strSql = "select deposited_date,ammount_type,amount_deposited,ammount from acc_transaction where CUSTOMER_ID='"
					+ userID + "' order by trans_date DESC  LIMIT 10";
			System.out.println("miniStatement query--" + strSql);
			rs = stmt.executeQuery(strSql);

			while (rs.next()) {
				String temp[] = new String[10];
				temp[0] = rs.getString("deposited_date");
				temp[1] = rs.getString("ammount_type");
				temp[2] = rs.getString("amount_deposited");
				temp[3] = rs.getString("ammount");

				vList.add(temp);
			}

		} catch (Exception e) {
			System.err.print("miniStatement Exception : " + e);
			System.err.println("miniStatement Exception : " + e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e1) {
				}
			}

			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e2) {
				}
			}
			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}

		return vList;
	}

	public Vector itemizedStatement(String userID, String startingDate,
			String endingDate) throws SQLException {
		Vector vList = new Vector();

		try {
			// String userId="ID00000000";
			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String strSql = "select deposited_date,ammount_type,amount_deposited,ammount from acc_transaction where CUSTOMER_ID='"
					+ userID
					+ "' and deposited_date BETWEEN '"
					+ startingDate
					+ "'AND'" + endingDate + "'";
			System.out.println("itemizedStatement query--" + strSql);
			rs = stmt.executeQuery(strSql);

			while (rs.next()) {
				String temp[] = new String[10];
				temp[0] = rs.getString("deposited_date");
				temp[1] = rs.getString("ammount_type");
				temp[2] = rs.getString("amount_deposited");
				temp[3] = rs.getString("ammount");

				vList.add(temp);
			}

		} catch (Exception e) {
			System.err.print("itemizedStatement Exception : " + e);
			System.err.println("itemizedStatement Exception : "
					+ e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e1) {
				}
			}

			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e2) {
				}
			}
			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}

		return vList;
	}

	public Vector Role() throws SQLException {
		Vector vList = new Vector();

		try {
			// String userId="ID00000000";
			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String strSql = "select RoleID,Role from roletable ";
			System.out.println("Role query--" + strSql);
			rs = stmt.executeQuery(strSql);

			while (rs.next()) {
				String temp[] = new String[10];
				temp[0] = rs.getString("RoleID");
				temp[1] = rs.getString("role");
				vList.add(temp);
			}

		} catch (Exception e) {
			System.err.print("Role Exception : " + e);
			System.err.println("Role Exception : " + e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e1) {
				}
			}

			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e2) {
				}
			}
			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}

		return vList;
	}

	public Vector userName() throws SQLException {
		Vector vList = new Vector();

		try {
			// String userId="ID00000000";
			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String strSql = "select FIRSTNAME,LASTNAME,CUSTOMER_ID,role from adduser ";
			System.out.println("UserName query--" + strSql);
			rs = stmt.executeQuery(strSql);

			while (rs.next()) {
				String temp[] = new String[10];
				temp[0] = rs.getString("CUSTOMER_ID");
				temp[1] = rs.getString("FIRSTNAME") + " "
						+ rs.getString("LASTNAME");
				temp[2] = rs.getString("role");
				vList.add(temp);
			}

		} catch (Exception e) {
			System.err.print("UserName Exception : " + e);
			System.err.println("UserName Exception : " + e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e1) {
				}
			}

			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e2) {
				}
			}
			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}

		return vList;
	}

	public Vector FormList(String role) throws SQLException {
		Vector vList = new Vector();

		try {

			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String strSql = "select forms_id,forms_name,forms_path,status from formstable where role='"
					+ role + "'";
			System.out.println("FormList query--" + strSql);
			rs = stmt.executeQuery(strSql);

			while (rs.next()) {
				String temp[] = new String[10];
				temp[0] = rs.getString("forms_id");
				temp[1] = rs.getString("forms_name");
				temp[2] = rs.getString("forms_path");
				temp[3] = rs.getString("status");

				vList.add(temp);
			}

		} catch (Exception e) {
			System.err.print("FormList Exception : " + e);
			System.err.println("FormList Exception : " + e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e1) {
				}
			}

			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e2) {
				}
			}
			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}

		return vList;
	}

	public String updateRights(LoginBean objLog, String userId, String Role)
			throws SQLException {
		Connection con = null;
		CallableStatement call = null;
		String msg = "";
		ResultSet rs = null;
		Statement stmt = null;
		Statement stmt1 = null;

		try {

			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String queryUpdate = "Update adduser set Rights='"
					+ objLog.getuserRights() + "'where CUSTOMER_ID='" + userId
					+ "'";
			System.err.println("update adduser-" + queryUpdate);
			stmt.execute(queryUpdate);

			stmt1 = con.createStatement();
			String queryUpdate1 = "Update formstable set status='"
					+ objLog.getuserRights() + "'where role='" + Role + "'";
			System.err.println("update formstable-" + queryUpdate1);
			stmt1.execute(queryUpdate1);

		} catch (Exception e) {
			System.err.println("In updateRights Exception " + e);
			System.err.println("In updateRights Exception " + e.getMessage());
		} finally {
			if (call != null) {
				try {
					call.close();
					call = null;
				} catch (Exception e1) {
				}
			}

			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}
		return msg;
	}

	public String Logout(String userId) throws SQLException {
		Connection con = null;
		CallableStatement call = null;
		String logout = "";
		ResultSet rs = null;
		Statement stmt = null;

		Date todaysDate = new java.util.Date();
		SimpleDateFormat formatter = new SimpleDateFormat(
				"dd-MMM-yyyy HH:mm:ss");
		String formattedDate = formatter.format(todaysDate);

		try {

			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String queryString = "update adduser set outtime='" + formattedDate
					+ "' where CUSTOMER_ID='" + userId + "'";
			System.out.println(queryString);
			int i = stmt.executeUpdate(queryString);

			if (i > 0) {
				logout = "";
			}
			con.close();
		} catch (Exception e) {
			System.err.println("In Logout Exception " + e);
			System.err.println("In Logout Exception " + e.getMessage());
		} finally {
			if (call != null) {
				try {
					call.close();
					call = null;
				} catch (Exception e1) {
				}
			}

			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}
		return logout;
	}

	public userBean UserPwdVerify(String val) throws SQLException {
		String temp1[] = new String[6];
		userBean user = new userBean();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		CryptoLibrary cl = new CryptoLibrary();
		try {
			int i = 0;
			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String strSql = "SELECT loginname,password FROM adduser where CUSTOMER_ID='"
					+ val + "'";

			rs = stmt.executeQuery(strSql);
			if (rs.next()) {
				String selpwd = rs.getString("password");
				String decpwd = cl.decrypt(selpwd);
				System.out.println(selpwd + "<-Password->" + decpwd);
				user.setloginName(rs.getString("loginname"));
				user.setOPwd(decpwd);

			}
			rs.close();
		} catch (Exception e) {
			System.err.println("UserPwdVerify Exception" + e);
			System.err.println("UserPwdVerify Exception" + e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e1) {
				}
			}

			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e2) {
				}
			}
			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
			return user;
		}

	}

	public String updatePwd(String userId, LoginBean lbean, String status)
			throws SQLException {
		Connection con = null;
		CallableStatement call = null;
		String logout = "";
		ResultSet rs = null;
		Statement stmt = null;

		try {

			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String queryString = "update adduser set PASSWORD='"
					+ lbean.getPassword() + "',changed_paswword_status='"
					+ status + "' where CUSTOMER_ID='" + userId + "'";
			System.out.println("password updated" + queryString);
			stmt.executeUpdate(queryString);

		} catch (Exception e) {
			System.err.println("In updatePwd Exception " + e);
			System.err.println("In updatePwd Exception " + e.getMessage());
		} finally {
			if (call != null) {
				try {
					call.close();
					call = null;
				} catch (Exception e1) {
				}
			}

			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}
		return logout;
	}

	public void addImage(LoginBean objDetail, String imageName)
			throws SQLException, NamingException {

		Labcon lc = new Labcon();
		con = lc.getLocalConnection();

		try {

			String image = objDetail.getImage();
			String imageId = objDetail.getImageID();

			File imgfile = new File(image);

			System.out.println("*******" + image);
			FileInputStream fin = new FileInputStream(imgfile);

			PreparedStatement pre = con
					.prepareStatement("insert into ImageFile1 (imageid,image,imagename,userid) values(?,?,?,?)");
			pre.setString(1, imageId);
			pre.setBinaryStream(2, fin, (int) imgfile.length());
			pre.setString(3, imageName);
			pre.setString(4, objDetail.getuser());

			System.out.println("image problem solved");
			pre.executeUpdate();
			System.out.println("Inserting Successfully!");
			pre.close();

		} catch (Exception e) {
			System.err.println("addImage Exception  " + e);
			System.err.println("addImage Exception  " + e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e1) {
				}
			}

			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e2) {
				}
			}
			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}
	}

	public byte[] getReturnInvoiceDetails(String SId) {

		byte[] img = new byte[300000];
		try {

			int n = 0;
			n = System.in.available();
			img = new byte[n];

			Blob blob = null;

			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String strSql = "SELECT image FROM imagefile1 WHERE imageid ='"
					+ SId + "'";
			System.out.println("FormList query--" + strSql);
			rs = stmt.executeQuery(strSql);
			while (rs.next()) {
				img = rs.getBytes(1);

			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return img;
	}

	public Vector ImageList(String userid) throws SQLException {
		Vector vList = new Vector();

		try {
			// String userId="ID00000000";
			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String strSql = "select imageid,imagename from ImageFile1 where userid='"
					+ userid + "'";
			System.out.println("ImageList query--" + strSql);
			rs = stmt.executeQuery(strSql);

			while (rs.next()) {
				String temp[] = new String[2];
				temp[0] = rs.getString("imageid");
				temp[1] = rs.getString("imagename");
				vList.add(temp);
			}

		} catch (Exception e) {
			System.err.print("ImageList Exception : " + e);
			System.err.println("ImageList Exception : " + e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e1) {
				}
			}

			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e2) {
				}
			}
			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (Exception e3) {
				}
			}
		}

		return vList;
	}
}
