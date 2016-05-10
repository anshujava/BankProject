<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
buffer="20kb"
isThreadSafe="true"
isErrorPage="false"
session="true"
autoFlush="true"%>
<html>
<head>
<SCRIPT LANGUAGE="Javascript">

function add()

{
	alert(document.frm.Image.value);
       document.frm.action="mystore";
	
	document.frm.submit();
	
}

</SCRIPT>
<title>storeImage</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Software Architect">
</head>
<body>
<%! 
       private String checkNull(String value) {
       	if(value=="null" || value==null)
       	{return "";}
       	return value;
       }
%>
<form name="frm" method="post" >

<table>
	
	
	<tr>
	    <td>Image Name</td>
		
		<td><input type="file" name="Image" size="20" value=""></td></tr>
		

<tr>
 	<BUTTON  TABINDEX="21" type=button  value=save name=cmdsave onclick="add()" >Save</BUTTON>
<a href="newViewImage.jsp" target="_self">VIew</a>	
</tr></table>
</form>
</body>
</html>
