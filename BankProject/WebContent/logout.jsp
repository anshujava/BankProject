<%@ page import="java.sql.*,java.util.*,java.text.*,java.text.SimpleDateFormat,java.util.Date" %>
 <LINK href="MainStyle.css" rel="stylesheet" type="text/css">
 <script language = "Javascript" src = "MainScript.js"></script>
 <script>

  window.history.forward(1);

</script>
<%

HttpSession sUser = request.getSession(true);
String UserId = (String)sUser.getAttribute("UserId");
sUser.setAttribute("UserId",UserId);

String url = "jdbc:mysql://localhost:3306/";
String dbName = "test";
String driver = "com.mysql.jdbc.Driver";
String username = "root"; 
String userPassword = "root";
Connection conn = null;

Date todaysDate = new java.util.Date();
SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
String formattedDate = formatter.format(todaysDate);
try
{
	Class.forName(driver).newInstance();
	conn = DriverManager.getConnection(url+dbName,username,userPassword);
	Statement st = conn.createStatement();
	String queryString = "update adduser set outtime='"+formattedDate+"' where CUSTOMER_ID='"+UserId+"'";
	out.println(queryString);
	int i = st.executeUpdate(queryString);

	if(i>0)
	{
	session.invalidate();
	response.sendRedirect("login.jsp");
	}
	conn.close();
}
catch (Exception e)
{
	e.printStackTrace();
}
%> 

