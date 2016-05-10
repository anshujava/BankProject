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
    
       userBean user = new userBean();
       UserDetail userDet = new UserDetail();
%>
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
	if(sUser.getAttribute("UserId") == null) 
	{
 		response.sendRedirect ("logout.jsp");
	  }
          else{
             user = userDet.UserPwdVerify(UserId);
             }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <LINK href="MainStyle.css" rel="stylesheet" type="text/css">
        <script language = "Javascript" src = "MainScript.js"></script>
        <title>changePassword</title>
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

function check()
{
	document.frmChangePass1.action='changePassword.jsp';
	document.frmChangePass1.submit();
	
	
}

function isSpclCharPWD(){

var iChars = "!@#$%^&*()+=-[]\\\';,./{}|\":<>?";

for (var i = 0; i < document.frmChangePass1.txtNewPassWord.value.length; i++) {
    if (iChars.indexOf(document.frmChangePass1.txtNewPassWord.value.charAt(i)) != -1) {
    alert ("The New Password has special characters. \nThese are not allowed.\n");
    return false;
        }
    }
}

</script>
    </head>
    <body>
        <FORM METHOD=post name=frmChangePass1 action="sUserRights" onsubmit="return CheckPass()">
        <TABLE border=1 ID="customer" style="background-color: #efefef; WIDTH: 400px; POSITION: absolute; TOP: 50px;">
            <THEAD>
                <tr>
                    <td colspan="7" align="center"><font size="3">Change Password</font></td>
                </tr>
                </THEAD>
            <TBODY>
                <TR>
			
			<TD><B>Login Name: </B></TD>
			<TD><INPUT id="txtLogin" maxlength="50" tabindex="txtLogin" readonly
				value="<%=user.getloginName()%>" ></TD>
		</TR>
                <TR>
			
			<TD><B>Old PassWord:</B></TD>
			<TD><INPUT
				value='<%=checkNull(request.getParameter("txtOldPassword"))%>'
				tabindex="5" type="password" maxlength="20" name="txtOldPassword" id="txtOldPassword"
				onblur="check()"></TD>
		</TR>
		<TR>
			
			<TD><B>New PassWord: </B></TD>
			<TD><INPUT tabindex="6" type="password" maxlength="20" id="txtNewPassWord"
				name="txtNewPassWord" ONBLUR="isSpclCharPWD()"></TD>

		</TR>
		<TR>
			
			<TD nowrap><B>Confirm PassWord:</B></TD>
			<TD><INPUT tabindex="7" type="password" maxlength="20" id="txtConfirmPassword"
				name="txtConfirmPassword"></TD>
		</TR>
            <%
				String OP= request.getParameter("txtOldPassword");
				if(OP==null)
				{
					OP="";
				}
                               String flag = user.checkOpwd(OP);
			%>
		
		<INPUT type="hidden" name="txthide" value="<%=checkNull(flag)%>" id="txthide">
                <INPUT type="hidden" name="userID" value="<%=checkNull(UserId)%>" id="userID">
                <INPUT type=HIDDEN name=hidval value="changepwd" size="24">
		<TR>
			<TD colspan="3" align="middle" height="31">
			<BUTTON style="WIDTH: 100px" type="submit" value="Submit"
				name="btnOk">Submit</BUTTON>
			</TD>
		</TR>
            </TBODY>
        </TABLE>
    
    </body>
</html>
