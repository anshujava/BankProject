<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <SCRIPT LANGUAGE=javascript>
function save()
{
      document.frm.action="../bookServlet";
      document.frm.submit();
 }

function on_cancel(){
  
    document.frm.action="add.jsp";
    document.frm.submit();
}
</SCRIPT>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AddBookDetail</title>
</head>
<body>
 <form name=frm method="post" >
<table>
<tr>
<TD><b>Book Name</b></TD>
<td><INPUT id=txtBookName  name=txtBookName size="24" value =""></TD>
</tr>
<tr>
<TD><b>Book Author Name</b></TD>
<td><INPUT id=txtBookAuthorName  name=txtBookAuthorName size="24" value =""></TD>
<td><INPUT type="hidden" name=hidval size="24" value="Add"></td>
</tr>
<tr><TD>
<BUTTON type=button  value=save name=cmdsave onclick="save()" >Save</BUTTON>&nbsp;&nbsp; 
 <BUTTON type="button" value="Cancel" id="button" name="cmdCancel"ONCLICK="on_cancel()">Cancel</BUTTON>
</TD></tr>
</table>
</form>
</body>
</html>