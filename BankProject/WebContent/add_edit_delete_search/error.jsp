<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Error Page</title>
</head>
<body>
<table> <tr><td> <font color="red">
<h3>Sorry an exception occured!</h3></font>  <td></tr>
 <tr><td> <font color="red">
Exception is: <%= exception %></font>  <td></tr>
<tr><td> 
Please go to <a href="./a_e_d_s.jsp?fn=ShowList">Main Page</a><td></tr>
</table>
</body>
</html>