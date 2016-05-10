<%@page language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
buffer="20kb"
isThreadSafe="true"
isErrorPage="false"
session="true"
autoFlush="true"
import="commonFunction.*,generalClass.*,java.util.*,bean.*"%>

<%! 
       private String checkNull(String value) {
       	if(value=="null" || value==null)
       	{return "";}
       	return value;
       }
%>
<%	HttpSession sUser = request.getSession(true);
	String UserId = (String)sUser.getAttribute("UserId");
	sUser.setAttribute("UserId",UserId);
	
         
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <LINK href="MainStyle.css" rel="stylesheet" type="text/css">
        <script language = "Javascript" src = "MainScript.js"></script>
        <title>newPassword</title>
        <SCRIPT LANGUAGE=javascript>

function CheckPass() {
 if(document.getElementById("txthide").value =="false")
	{
		alert("Enter valid Old Password");
		document.getElementById("txtOldPassword").focus();
		return false;
	}
	
  	if(document.getElementById("txtNewPassWord").value==""){
		alert( "Enter New Password \n");
		document.getElementById("txtNewPassWord").focus();
		return false;
	}
if((document.getElementById("txtNewPassWord").value.length<2)||(document.getElementById("txtNewPassWord").value.length>20))
	{
		alert("Password Must be in between 8 to 20 Character \n");	
		document.getElementById("txtNewPassWord").focus();
		return false;
	}			
	if(document.getElementById("txtConfirmPassword").value != document.getElementById("txtNewPassWord").value ){
		alert("New Password and confirm password not matching \n");
		document.getElementById("txtConfirmPassword").focus();
		return false;
	}
	return true;
}

function on_cancel(){
  
	document.frmChangePass1.action="newPassword.jsp";
	document.frmChangePass1.submit();


}


</script>
<script>

  window.history.forward(1);

</script>
    </head>
    <body>
        <FORM METHOD=post name=frmChangePass1 action="sUpdatePWD" onsubmit="return CheckPass()">
        <TABLE border=1 ID="customer" style="background-color: #efefef; WIDTH: 400px; POSITION: absolute; TOP: 50px;">
            <THEAD>
                <tr>
                    <td colspan="7" align="center"><font size="3">New Password</font></td>
                </tr>
                </THEAD>
            <TBODY>
                
                
		<TR>
			
			<TD><B>New PassWord: </B></TD>
			<TD><INPUT tabindex="6" type="password" maxlength="20" id="txtNewPassWord"
				name="txtNewPassWord"></TD>

		</TR>
		<TR>
			
			<TD nowrap><B>Confirm PassWord:</B></TD>
			<TD><INPUT tabindex="7" type="password" maxlength="20" id="txtConfirmPassword"
				name="txtConfirmPassword"></TD>
		</TR>
            
                <INPUT type="hidden" name="userID" value="<%=checkNull(UserId)%>" id="userID">
                <INPUT type=HIDDEN name=hidval value="changepwd" size="24">
		<TR>
			<TD colspan="3" align="middle" height="31">
			<BUTTON style="WIDTH: 100px" type="submit" value="Submit" name="btnOk">Submit</BUTTON>
                         <BUTTON  style="WIDTH: 100px" type="button" value="Cancel" id="button" name="cmdCancel"ONCLICK="on_cancel()">Cancel</BUTTON>
			</TD>
		</TR>
            </TBODY>
        </TABLE>
    
    </body>
</html>
