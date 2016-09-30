<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,servlet.*,java.util.*,generalClass.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit book detail</title>
</head>
<body>
<form method="post" action="../bookServlet">
<table border="0">
<tr><th>Book Name</th><th>Book Author</th></tr>
<%
String id=request.getParameter("id");
Vector vReq=new Vector();
bookDetail bookdet = new bookDetail();
vReq=bookdet.getRecord(id);

for(int i=0;i<vReq.size();i++)
{
String temp[]=new String[3];
temp = (String[])vReq.get(i);

%>
<tr>
<td><input type="text" name="bookName" value="<%=temp[1]%>"></td>
<td><input type="text" name="bookAuthor" value="<%=temp[2]%>"></td>
<td><input type="hidden" name="id" value="<%=temp[0]%>"></td>
<td><INPUT type="hidden" name=hidval size="24" value="Update"></td>
</tr>
<%}%>
<tr>
<td><input type="submit" name="Submit" value="Update" style="background-color:#49743D;font-weight:bold;color:#ffffff;"></td>
</tr>

</table>
</form>
</body>
</html>