package commonFunction;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.NamingException;

public class Labcon {
	Connection con = null;
	 public Connection getLocalConnection()
	    
	   //for oracle
	 /*
	     {
	    
	       try
	        {
	        	Class.forName("oracle.jdbc.driver.OracleDriver");
	    		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:mydb","anshu","anshu");
	         
	        }
	        catch (ClassNotFoundException e)
	        {
	            System.err.println("ClassNotFoundException in getConnection, " + e.getMessage());

	        }
	        catch (SQLException e)
	        {
	            System.err.println("SQLException in getConnection, " + e.getMessage());
	        }

	        return con;
	    }*/
	 
	 //for mysql
	 {
		    
	       try
	        {
	        	Class.forName("com.mysql.jdbc.Driver");
	    		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","anshu","anshu");
	         
	        }
	        catch (ClassNotFoundException e)
	        {
	            System.err.println("ClassNotFoundException in getConnection, " + e.getMessage());

	        }
	        catch (SQLException e)
	        {
	            System.err.println("SQLException in getConnection, " + e.getMessage());
	        }

	        return con;
	    }
	 public void setConnectionClose() throws SQLException	
		{
		 con.close();
		}

}
