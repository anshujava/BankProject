package generalClass;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import bean.*;
import commonFunction.Labcon;

public class bookDetail {
	Connection con = null;
	public void InsertBookDetailTable(book BookObj) throws SQLException {
		
	try {

	Labcon lc = new Labcon();
	con = lc.getLocalConnection();
	PreparedStatement pre = con.prepareStatement("insert into bookdetail (BookName,BookAuthor) values(?,?)");
	pre.setString(1,BookObj.getBookName());
	pre.setString(2,BookObj.getBookAuthorName());
	pre.executeUpdate();
	
	} catch (Exception e) {
		System.err.println("In InsertBookDetailTable Exception "+ e);
	}
}
	public Vector allBookDetailList() throws SQLException {
		Vector vList = new Vector();
		ResultSet rs = null;
		Statement stmt = null;
		try {
			// String userId="ID00000000";
			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String strSql = "select BookId,BookName,BookAuthor from bookdetail";
			System.out.println("allBookDetailList query--" + strSql);
			rs = stmt.executeQuery(strSql);

			while (rs.next()) {
				String temp[] = new String[3];
				temp[0] = rs.getString("BookId");
				temp[1] = rs.getString("BookName");
				temp[2] = rs.getString("BookAuthor");
				vList.add(temp);
			}

		} catch (Exception e) {
			System.err.print("allBookDetailList Exception : " + e.getMessage());
		} 
		

		return vList;
	}
	public Vector allBookDetailList(String search) throws SQLException {
		Vector vList = new Vector();
		ResultSet rs = null;
		Statement stmt = null;
		try {
			// String userId="ID00000000";
			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String strSql = "select BookId,BookName,BookAuthor from bookdetail where BookName LIKE '"+search+"%';";
			System.out.println("allBookDetailList query--" + strSql);
			rs = stmt.executeQuery(strSql);

			while (rs.next()) {
				String temp[] = new String[3];
				temp[0] = rs.getString("BookId");
				temp[1] = rs.getString("BookName");
				temp[2] = rs.getString("BookAuthor");
				vList.add(temp);
			}

		} catch (Exception e) {
			System.err.print("allBookDetailList Exception : " + e.getMessage());
		} 
		

		return vList;
	}
	public Vector getRecord(String id) throws SQLException {
		Vector vList = new Vector();
		ResultSet rs = null;
		Statement stmt = null;
		try {
			Labcon lc = new Labcon();
			con = lc.getLocalConnection();
			stmt = con.createStatement();
			String strSql = "select BookId,BookName,BookAuthor from bookdetail where BookId ='"+id+"'";
			System.out.println("getRecord query--" + strSql);
			rs = stmt.executeQuery(strSql);

			while (rs.next()) {
				String temp[] = new String[3];
				
				temp[0] = rs.getString("BookId");
				temp[1] = rs.getString("BookName");
				temp[2] = rs.getString("BookAuthor");

				vList.add(temp);
			}

		} catch (Exception e) {
		
			System.err.println("getRecord Exception : "	+ e.getMessage());
		} 
		

		return vList;
	}
	public void UpdateBookDetail(book objbook) throws SQLException
	 
	 {		
	 	Connection con1 = null;
		Statement stmt = null;
	     try
		{       
	     
	     Labcon lc = new Labcon();
	     con1 = lc.getLocalConnection();
		 stmt = con1.createStatement();
		 String query = "update bookdetail set BookName='"+objbook.getBookName()+"',BookAuthor='"+objbook.getBookAuthorName()+"' where BookId='"+objbook.getId()+"'";
		 System.err.println("query in UpdateBookDetail execute--:::"+query);
	     stmt.executeUpdate(query);
	           
	     }
		catch(Exception e)
		 {
		 System.err.println("In UpdateBookDetail Exception "+e.getMessage());
		 }
	     }
	public void Delete(String Myid) throws SQLException
	 
	 {		
	 	Connection con1 = null;
		Statement stmt = null;
	     try
		{       
	     
	     Labcon lc = new Labcon();
	     con1 = lc.getLocalConnection();
		 stmt = con1.createStatement();
		 String query = "delete from bookdetail where BookId="+Myid+"";
		 System.err.println("query in Delete execute--:::"+query);
	     stmt.executeUpdate(query);
	           
	     }
		catch(Exception e)
		 {
		 System.err.println("In Delete Exception "+e.getMessage());
		 }
		 
	 }

}