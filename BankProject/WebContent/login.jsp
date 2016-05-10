<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%--
The taglib directive below imports the JSTL library. If you uncomment it,
you must also add the JSTL library to the project. The Add Library... action
on Libraries node in Projects view can be used to add the JSTL 1.1 library.
--%>
<%--
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <LINK href="MainStyle.css" rel="stylesheet" type="text/css">
        <script language = "Javascript" src = "MainScript.js"></script>
        <title>login</title>
        <SCRIPT LANGUAGE="Javascript">

function add()
{
	if(document.frm.txtuserName.value==""){
		
		document.frm.txtuserName.focus();
		alert("Enter Login Name");
		return false;
	}
	else if(document.frm.txtpassword.value==""){
		
		document.frm.txtpassword.focus();
		alert("Enter Password");
		return false;
	}else{
		
		document.frm.action="NewServlet";
        document.frm.submit();
		return true
	} 	
}
function on_cancel(){
  
	document.frm.action="login.jsp";
	document.frm.submit();


}
function isSpclCharLoginName(){

var iChars = "!@#$%^&*()+=-[]\\\';,./{}|\":<>?";

for (var i = 0; i < document.frm.txtuserName.value.length; i++) {
    if (iChars.indexOf(document.frm.txtuserName.value.charAt(i)) != -1) {
    alert ("The Login Name has special characters. \nThese are not allowed.\n");
    return false;
        }
    }
} 
function isSpclCharPWD(){

var iChars = "!@#$%^&*()+=-[]\\\';,./{}|\":<>?";

for (var i = 0; i < document.frm.txtpassword.value.length; i++) {
    if (iChars.indexOf(document.frm.txtpassword.value.charAt(i)) != -1) {
    alert ("The Password has special characters. \nThese are not allowed.\n");
    return false;
        }
    }
}   
</SCRIPT>
</head>
    
    <%! 
       private String checkNull(String value) {
       	if(value=="null" || value==null)
       	{return "";}
       	return value;
       }
%>

<%	

          
        String logoff=request.getParameter("logoff");
		HttpSession sMsg = request.getSession();
		String msg = (String)sMsg.getAttribute("msg");
		      
      if((logoff!=null) && (logoff.equals("invalidate")))
      {     
            
             sMsg.removeAttribute("msg");
             response.sendRedirect("login.jsp");
           
      }        
    HttpSession sUserDept = request.getSession(true);
    String UserId = (String)sUserDept.getAttribute("UserId");
	sUserDept.setAttribute("UserId",UserId);
	String url = request.getQueryString();

%>

<form name="frm" method="post" >
<INPUT type="hidden" name="url" value="<%=url%>">
<table width="446px" align="center" bgcolor="#efefef">

<tr><td align="center"><FONT size=2 color=red><%= checkNull(msg)%></FONT></td></tr>


	<tr><td align="center"><FONT size=4 color=green><b>Enter Your Login & Password</b></FONT></td></tr> 
</table>
<table width="446px" align="center"	bgcolor="#efefef">

	<tr>
		<td colspan=2></td>
	</tr>
	<tr>
		<td colspan=2>&nbsp;</td>
	</tr>

	<tr>
		<td><b>Login Name</b></td>
		<td bgcolor=""><input type="text" name="txtuserName" value="" size="23" onblur="isSpclCharLoginName()"></td>
	</tr>
	<tr>
		<td><b>Password</b></td>
		<td><input type="password" name="txtpassword" value="" size="23" onblur="isSpclCharPWD()"></td>
	</tr>
		
<tr></tr>
<tr></tr>

<tr>
	<td></td><td><BUTTON style="WIDTH: 70px" type="submit"  value=Save name=cmdSave onclick="add()">Login</BUTTON>
	 <BUTTON type="button" tabindex="11" style="width: 70px" name="btnCancel" value="Cancel"  onclick="on_cancel()">Cancel</BUTTON></td>
</tr>

</table>
</form>
</body>
</html>
