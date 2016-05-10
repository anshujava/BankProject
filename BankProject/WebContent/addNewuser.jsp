<%@page language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
buffer="20kb"
isThreadSafe="true"
isErrorPage="false"
session="true"
autoFlush="true"
import="commonFunction.*,generalClass.*,java.util.*"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <LINK href="MainStyle.css" rel="stylesheet" type="text/css">
       
        <title>addNewUser</title>
        <script language = "Javascript" src = "MainScript.js"></script>
       
	<LINK href="Resources/flora.datepick.css" rel="stylesheet"type="text/css">
               
        <script language="javascript" src="Resources/jquery-1.4.2.js"></script>
        <script language="javascript" src="Resources/jquery.datepick.js"></script>
     <script type="text/javascript">
$(function() {
	$('#cdt').datepick();
	
});
</script>

 <SCRIPT LANGUAGE=javascript>
     function ValidateForm(){
     var rad=0;
     var rad1=0;
        if (document.getElementById("txtcFName").value == "")
	
	{
		alert ("Please Enter First Name");
		return false;
		
	}
	if (document.getElementById("txtclName").value == "")
	
	{
		alert ("Please  Enter Last Name");
		return false;
		
	}
        for (i=0;i<document.frm.cgender.length;i++)
	{
		if (document.frm.cgender[i].checked)
		{
			rad=1;
		}
	}
	if(rad==0)
	{
	 alert("Select Gender");
	 return false;
	}
	if (document.getElementById("txtuName").value == "")
	
	{
		alert ("Please Enter Login Name.");
		return false;
	}
	if (document.getElementById("txtPassword").value == "")
	
	{
		alert ("Please Enter Password");
		return false;
	}
    if (document.getElementById("txtconPassword").value == "")
	
	{
		alert ("Please Enter Confirm Password.");
		return false;
		
	}
   
	
	if (document.getElementById("cdt").value == "")
	
	{
		alert ("Please Choose Date Of Birth From Calendar");
		return false;
	}
	
	if (document.getElementById("txtAddress").value == "")
	
	{
		alert ("Please Enter Address");
		return false;
		
	}
	
	if (document.getElementById("txtCity").value == "")
	
	{
		alert ("Please Enter City");
		return false;
	}
	if (document.getElementById("txtState").value == "")
	
	{
		alert ("Please Enter State");
		return false;
	}
	if (document.getElementById("txtPin").value == "")
	
	{
		alert ("Please Enter Pin");
		return false;
	}
        if(!isInteger(document.frm.txtPin.value))
          {
            alert("Please Enter valid Pin");
            return false;
          }
	if (document.getElementById("txtTelephone").value == "")
	
	{
		alert ("Please Enter Telephone");
		return false;
	}
        if (!isInteger(document.getElementById("txtTelephone").value))
	
	{
		alert ("Please Enter Valid Phone No");
		return false;
	}
        
	if (document.getElementById("txtcEmail").value == "")
	
	{
		alert ("Please Enter Email");
		return false;
	}
         if(!emailcheck(document.frm.txtcEmail.value))
          {
            //alert("Please enter a valid mail-id");
            return false;
          }
	if (document.getElementById("cboRole").value == "")
	
	{
		alert ("Please Select Role ");
		return false;
	}
	
	if (document.getElementById("txtPassword").value.length < 4) {
         alert ("Password must be atleast 4 chars ");
		 return false;
	}
	if((document.getElementById("txtconPassword").value) != (document.getElementById("txtPassword").value)){
		 alert ("New password and confirm password not matching ");
		 return false;
	}
        if (document.getElementById("cboAcctype").value == "")
	
	{
		alert ("Please Select Account Type ");
		return false;
	}
	if (document.getElementById("txtAmmount").value == "")
	
	{
		alert ("Please Enter Ammount ");
		return false;
	}
        if(!isInteger(document.frm.txtAmmount.value))
          {
            alert("Please Enter valid Ammount");
            return false;
          }
        if (document.getElementById("txtMoName").value == "")
	
	{
		alert ("Please Enter Mother Name ");
		return false;
	}
         for (i=0;i<document.frm.status.length;i++)
	{
		if (document.frm.status[i].checked)
		{
			rad1=1;
		}
	}
	if(rad1==0)
	{
	 alert("Select Account Status");
	 return false;
	}
 return true
}
function save(){    
if(!ValidateForm()) return;
	{
      document.frm.action="sAddUser";
      document.frm.submit();
      }
}

function on_cancel(){
    document.frm.cboRole.selectedIndex=0;
    document.frm.cboAcctype.selectedIndex=0;
    document.frm.action="addNewuser.jsp";
    document.frm.submit();
}
function properFirst(val){
	var valPart;
	valPart=val.split(" ");
	for(i=0; i< valPart.length; i++){
		valPart[i]=valPart[i].substring(0,1).toUpperCase() + valPart[i].substring(1).toLowerCase();
	}
	document.frm.txtcFName.value=remSpace(valPart.join(" "));
}
function properLast(val){
	var valPart;
	valPart=val.split(" ");
	for(i=0; i< valPart.length; i++){
		valPart[i]=valPart[i].substring(0,1).toUpperCase() + valPart[i].substring(1).toLowerCase();
	}
	document.frm.txtclName.value=remSpace(valPart.join(" "));
}
function properMother(val){
	var valPart;
	valPart=val.split(" ");
	for(i=0; i< valPart.length; i++){
		valPart[i]=valPart[i].substring(0,1).toUpperCase() + valPart[i].substring(1).toLowerCase();
	}
	document.frm.txtMoName.value=remSpace(valPart.join(" "));
}

function remSpace(val){
	var pChar='', cChar='', retVal="";
	pChar=val.charAt(0);
	for(i=0; i<val.length; i++){
		cChar=val.charAt(i);
		if((pChar==' ') && (cChar==' ')){
			continue;
		}else{
			pChar=cChar;
			retVal=retVal + cChar;
		}
	}
	if(retVal.charAt(retVal.length-1)==' ')
		retVal=retVal.substring(0,retVal.length-1);
	return retVal;
}
function upCase(){
key=window.event.keyCode;
if((key > 0x60) && (key < 0x7B))
	window.event.keyCode=key - 0x20
}
function isSpclCharloginName(){

var iChars = "!@#$%^&*()+=-[]\\\';,./{}|\":<>?";

for (var i = 0; i < document.frm.txtuName.value.length; i++) {
    if (iChars.indexOf(document.frm.txtuName.value.charAt(i)) != -1) {
    alert ("The Login Name has special characters. \nThese are not allowed.\n");
    return false;
        }
    }
}
function isSpclCharPWD(){

var iChars = "!@#$%^&*()+=-[]\\\';,./{}|\":<>?";

for (var i = 0; i < document.frm.txtPassword.value.length; i++) {
    if (iChars.indexOf(document.frm.txtPassword.value.charAt(i)) != -1) {
    alert ("The Password has special characters. \nThese are not allowed.\n");
    return false;
        }
    }
}
function on_Attach(){
document.frm.action="attachImage.jsp";
 document.frm.submit();
}
function onState(){
 document.frm.action="addNewuser.jsp";
//document.frm.submit();
 var i=document.frm.txtState.value;
 var j=document.frm.txtAccNum1.value;
 var k=i+j;
 //alert(k);
document.frm.txtAccNum.value=k; 
 
 
 
 }
</SCRIPT>

    </head>
    <body>
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
	//sUserDept.setMaxInactiveInterval(3);
	//String url = request.getQueryString();
	if(sUser.getAttribute("UserId") == null) 
	{
 		response.sendRedirect ("logout.jsp");
	  }
%>
        <form name=frm method="post" >
             
            <TABLE border=1 ID="customer" style="background-color: #efefef; WIDTH: 710px; POSITION: absolute; TOP: 50px;">
     <THEAD>
        <tr>
                <td colspan="7" align="center"><font size="3">Add User & Account Details</font></td>
        </tr>
    </THEAD>
                <TBODY>
                <TR>
                    <TD colspan=2 nowrap  ><FONT size=4 color=green><B>User Detail:</B></FONT></TD>
                   
                </TR>
                <%
		HttpSession sMessage = request.getSession();
                String message = (String)sMessage.getAttribute("message");
                %>
            <tr><td align="center"><FONT size=2 color=red><%= checkNull(message)%></FONT></td></tr>

			<%sMessage.removeAttribute("message");%>
                 <tr><TD><b>State</b></TD>
                
                <td><select id="txtState" name="txtState" style="WIDTH: 165px" tabindex="16" onchange="onState()">
                            <OPTION selected value="">Select State</OPTION>
                           <%
                                UserDetail users = new UserDetail();
				Vector vSPEs = new Vector();
				String st="";
                                vSPEs = users.StateList();	
                                
				for(int i=0;i<vSPEs.size();i++)
					{
					String tempArray11[] = new String[10];
					tempArray11 = (String[])vSPEs.get(i);
					if((request.getParameter("txtState")!=null)&&(request.getParameter("txtState").trim().equalsIgnoreCase(tempArray11[1].trim()))){
						out.println("<OPTION value='"+tempArray11[1]+"' selected>"+tempArray11[0]+"</OPTION>");
					st=tempArray11[1];
                                                }else{
						out.println("<OPTION value='"+tempArray11[1]+"'>"+tempArray11[0]+"</OPTION>");
					}
				}	
				%></select> </TD> 
                <TD><b>First Name</b></TD>
                <td><INPUT id=txtcFName tabIndex=1 maxLength=50 name=txtcFName size="24" onblur="properFirst(this.value)"></TD></TR>
                <tr><TD><b>City</b></TD>
                <td><INPUT id=txtCity tabIndex=10 maxLength=50 name=txtCity size="24" ></TD>
                <TD><b>Last Name</b></TD>
                <td><INPUT id=txtclName tabIndex=2 maxLength=50 name=txtclName size="24" onblur="properLast(this.value)"></TD>
                </TR>
                                
                <tr><TD><b>Gender</b></TD>
                    <td><INPUT type="radio" tabIndex=3 size="18" value="Male" name="cgender">Male
                         <INPUT type="radio" tabIndex=4 size="18" value="Female" name="cgender" >Female      
                </TD> 
                <TD><b>Pin</b></TD>
                <td><INPUT id=txtPin tabIndex=12 maxLength=50 name=txtPin size="24"></TD></TR>
                <tr><TD><b>Login Name</b></TD>
                <td><INPUT id=txtuName tabIndex=5 maxLength=50 name=txtuName size="24" ONBLUR="isSpclCharloginName()"></TD>
                <TD><b>Telephone</b></TD>
                <td><INPUT id=txtTelephone tabIndex=13 maxLength=11 name=txtTelephone size="24" ></TD></TR>
                <tr><TD><b>Password</b></TD>
                <td><INPUT id=txtPassword tabIndex=6 maxLength=50 name=txtPassword size="24" ONBLUR="isSpclCharPWD()"></TD>
                <TD><b>Fax</b></TD>
                <td><INPUT id=txtFax tabIndex=14 maxLength=11 name=txtFax size="24" ></TD></TR>
                <tr><TD><b>Confirm Password</b></TD>
                <td><INPUT id=txtconPassword tabIndex=7 maxLength=50 name=txtconPassword size="24"></TD>
                <TD><b>Email</b></TD>
                <td><INPUT id=txtcEmail tabIndex=15 maxLength=50 name=txtcEmail size="24"></TD></TR>
                <tr><TD><b>Date Of Birth</b></TD>
                    <td><input type="text" id="cdt"  name="cdt" tabIndex="8" size="24"  value="" readonly>(Click For Date)</TD>
                <TD><b>Role</b></TD>
                    <td><select id="cboRole" name="cboRole" style="WIDTH: 165px" tabindex="16">
                            <OPTION>Select Role</OPTION>
                           <%
                                UserDetail user = new UserDetail();
				Vector vSPE = new Vector();
				
                                vSPE = user.RoleList();	
                                String roleID="";
				for(int i=0;i<vSPE.size();i++)
					{
					String tempArray[] = new String[10];
					tempArray = (String[])vSPE.get(i);
					if((request.getParameter("cboRole")!=null)&&(request.getParameter("cboRole").trim().equalsIgnoreCase(tempArray[0].trim()))){
						out.println("<OPTION value='"+tempArray[1]+"' selected>"+tempArray[0]+"</OPTION>");
					
                                                }else{
						out.println("<OPTION value='"+tempArray[1]+"'>"+tempArray[0]+"</OPTION>");
					}
				}	
				%></select> </TD></TR>
                <tr><TD><b>Address</b></TD>
                <td><INPUT id=txtAddress tabIndex=9 maxLength=50 name=txtAddress size="24"></TD>
             <TD ><B>Mother Name</B></TD>
                <td><INPUT id=txtMoName tabIndex=17 maxLength=50 name=txtMoName size="24" value="" ONBLUR="properMother(this.value)"></TD></TR>
                <% 
                GeneralBean cfun = new GeneralBean();
                String temp= cfun.getGenerateId("ACCOUNT_NUMBER");
                %>
                <tr><TD colspan=2 nowrap ><FONT size=4 color=green><B>Bank Account Detail:</B></FONT></TD>
               </TR>
                <tr><TD ><B>Account Number</B></TD>
                <td><INPUT id=txtAccNum tabIndex=17 maxLength=50 name=txtAccNum size="24" value="" READONLY>
                     <INPUT type=HIDDEN id=txtAccNum1 tabIndex=17 maxLength=50 name=txtAccNum1 size="24" value="<%=checkNull(temp)%>" READONLY></TD>
                <TD ><B>Ammount</B></TD>
                <td><INPUT id=txtAmmount tabIndex=19 maxLength=50 name=txtAmmount size="24" ><img src="images/rup.jpg" width="14" height="22" border="0"></TD></TR>
                <tr><TD ><B>Account Type</B></TD>
                <td><select id="cboAcctype" name="cboAcctype" style="WIDTH: 165px" tabindex="18">
                            <OPTION>Select Account Type</OPTION>
                             <%
                                UserDetail user1 = new UserDetail();
				Vector vSPE1 = new Vector();
				vSPE1 = user1.AccTypeList();	
				for(int i=0;i<vSPE1.size();i++)
					{
					String tempArray1[] = new String[10];
					tempArray1 = (String[])vSPE1.get(i);
					if((request.getParameter("cboAcctype")!=null)&&(request.getParameter("cboAcctype").trim().equalsIgnoreCase(tempArray1[0].trim()))){
						out.println("<OPTION value='"+tempArray1[0]+"' selected>"+tempArray1[0]+"</OPTION>");
					}else{
						out.println("<OPTION value='"+tempArray1[0]+"'>"+tempArray1[0]+"</OPTION>");
					}
				}	
				%></select> </TD>
                <TD ><B>Status</B></TD>
                <td><INPUT type="radio" tabIndex=20 size="18" value="Functional" name="status" CHECKED>Functional
                    <INPUT type="radio" tabIndex=20 size="18" value="Closed" name="status" >Closed      
                  </TD> </TR>
                  <tr><TD ><B>Upload Image</B></TD>
                  <td><input type="file" name="Image" size="20" value=""></TD>
                  </tr>
                  <tr></tr>
                  <tr></tr>
                <TR>
                    <td><INPUT type=HIDDEN name=userId value="<%=checkNull(UserId)%>" size="24">
                        <INPUT type=HIDDEN name=hidValue value="add" size="24">
                        <INPUT type=HIDDEN name=roleId value="<%=checkNull(roleID)%>" size="24">
                       
                        </td>
                    <TD >
                        <BUTTON  TABINDEX="21" type=button  value=save name=cmdsave onclick="save()" >Save</BUTTON>&nbsp;&nbsp; 
                        <BUTTON  TABINDEX="22" type="button" value="Cancel" id="button" name="cmdCancel"ONCLICK="on_cancel()">Cancel</BUTTON>
                    </TD>
                </TR>
                </TBODY>
            </TABLE>
        </FORM>
    </body>
</html>
