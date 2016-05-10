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
        <LINK href="MainStyle.css" rel="stylesheet" type="text/css">
        <script language = "Javascript" src = "MainScript.js"></script>
       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>editUser</title>
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
        if (document.getElementById("cboAccnum").value == "")
	
	{
		alert ("Please Select Account No");
		return false;
	}
	
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
	
	
        if (document.getElementById("cboAcctype").value == "")
	
	{
		alert ("Please Select Account Type ");
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
    document.frm.cboAccnum.selectedIndex=0;
    document.frm.action="editUser.jsp";
    document.frm.submit();
}	
function onAccountNumber(){
 document.frm.action="editUser.jsp";
 document.frm.submit();	    
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
                <td colspan="7" align="center"><font size="3">Edit User & Account Details</font></td>
        </tr>
    </THEAD>
                <TBODY>
                <TR>
			<TD><B>Account Number</B></TD>
			<TD><SELECT id="cboAccnum" style="WIDTH: 163px" name="cboAccnum"
				onchange="onAccountNumber()" tabindex="1" > 
				<OPTION  selected value="">Select Account Number</OPTION>
				<%
                                String acc ="";
				UserDetail user2 = new UserDetail();
                                Vector vList2 = new Vector();
				vList2 = user2.AccountList();	
				for(int i=0;i<vList2.size();i++)
					{
					String tempArray2[] = new String[10];
					tempArray2 = (String[])vList2.get(i);
					if((request.getParameter("cboAccnum")!=null)&&(request.getParameter("cboAccnum").trim().equalsIgnoreCase(tempArray2[0].trim()))){
						out.println("<OPTION value='"+tempArray2[0]+"' selected>"+tempArray2[0]+"</OPTION>");
					 acc=tempArray2[0]; 
                                                }else{
						out.println("<OPTION value='"+tempArray2[0]+"'>"+tempArray2[0]+"</OPTION>");
					}
				}	
				%>
                               
			</SELECT></TD>
                         <%  UserDetail user5 = new UserDetail();
                                        String temp5[] = new String[25];
                                        if(!(acc.equals("null"))&& !(acc.equals("")))
				     {
					Vector vList5 = new Vector();
					vList5=user5.UserDetailList(request.getParameter("cboAccnum"));
					temp5 = (String[])vList5.get(0);
				}
				%>
                        <TD><b>City</b></TD>
                <td><INPUT id=txtCity tabIndex=10 maxLength=50 name=txtCity size="24" VALUE="<%=checkNull(temp5[7])%>"></TD></TR>
                <TR>
                    <TD colspan=2 nowrap ><FONT size=4 color=green><B>User Detail:</B></FONT></TD>
                   
                </TR>
                                     
                  <INPUT type=HIDDEN name=custId value="<%=checkNull(temp5[18])%>" size="24">     
               <tr> <TD><b>First Name</b></TD>
                <td><INPUT id=txtcFName tabIndex=2 maxLength=50 name=txtcFName size="24" VALUE="<%=checkNull(temp5[0])%>"></TD>
                <TD><b>State</b></TD>
                <td>
                <select id="txtState" name="txtState" style="WIDTH: 165px" tabindex="15">
                            <OPTION  selected >Select State</OPTION>
                           <%
                                UserDetail userst = new UserDetail();
				Vector vSPEst = new Vector();
				vSPEst = userst.StateList();	
				for(int i=0;i<vSPEst.size();i++)
					{
					String tempArrayst[] = new String[10];
					tempArrayst = (String[])vSPEst.get(i);
					//if((request.getParameter("cboRole")!=null)&&(request.getParameter("cboRole").trim().equalsIgnoreCase(tempArray[0].trim()))){
                                    if(((temp5[8])!=null)&&(temp5[8].equals(tempArrayst[1]))){	
                                    out.println("<OPTION value='"+tempArrayst[1]+"' selected>"+tempArrayst[0]+"</OPTION>");
                                          }else{
						out.println("<OPTION value='"+tempArrayst[1]+"'>"+tempArrayst[0]+"</OPTION>");
					}
				}	
				%></select></TD></TR>
                <tr><TD><b>Last Name</b></TD>
                <td><INPUT id=txtclName tabIndex=3 maxLength=50 name=txtclName size="24" VALUE="<%=checkNull(temp5[1])%>"></TD>
                <TD><b>Pin</b></TD>
                <td><INPUT id=txtPin tabIndex=12 maxLength=50 name=txtPin size="24" VALUE="<%=checkNull(temp5[9])%>"></TD></TR>
                <tr><TD><b>Gender</b></TD>
                    <td>
                         <%if(checkNull(temp5[2]).equals("Male")){%>
                         <INPUT type="radio" tabIndex=4 size="18" value="Male" name="cgender" CHECKED>Male
                         
                         <%}else{%>
                          <INPUT type="radio" tabIndex=4 size="18" value="Male" name="cgender">Male
                          <%}%>
                          <%if(checkNull(temp5[2]).equals("Female")){%>
                         <INPUT type="radio" tabIndex=5 size="19" value="Female" name="cgender" CHECKED>Female
                         
                         <%}else{%>
                          <INPUT type="radio" tabIndex=5 size="19" value="Female" name="cgender">Female
                          <%}%>
                </TD><TD><b>Fax</b></TD>
                <td><INPUT id=txtFax tabIndex=13 maxLength=11 name=txtFax size="24" VALUE="<%=checkNull(temp5[11])%>"></TD> 
                </TR>
                <tr>
                <TD><b>Telephone</b></TD>
                <td><INPUT id=txtTelephone tabIndex=6 maxLength=11 name=txtTelephone size="24" VALUE="<%=checkNull(temp5[10])%>"></TD>
                <TD><b>Email</b></TD>
                <td><INPUT id=txtcEmail tabIndex=14 maxLength=50 name=txtcEmail size="24" VALUE="<%=checkNull(temp5[12])%>"></TD></TR>
                <tr>
                </TR>
                <tr><TD><b>Address</b></TD>
                <td><INPUT id=txtAddress tabIndex=7 maxLength=50 name=txtAddress size="24" VALUE="<%=checkNull(temp5[6])%>"></TD>
                <TD><b>Role</b></TD>
                    <td><select id="cboRole" name="cboRole" style="WIDTH: 165px" tabindex="15">
                            <OPTION  selected >Select Role</OPTION>
                           <%
                                UserDetail user = new UserDetail();
				Vector vSPE = new Vector();
				vSPE = user.RoleList();	
				for(int i=0;i<vSPE.size();i++)
					{
					String tempArray[] = new String[10];
					tempArray = (String[])vSPE.get(i);
					//if((request.getParameter("cboRole")!=null)&&(request.getParameter("cboRole").trim().equalsIgnoreCase(tempArray[0].trim()))){
                                    if(((temp5[13])!=null)&&(temp5[13].equals(tempArray[1]))){	
                                    out.println("<OPTION value='"+tempArray[1]+"' selected>"+tempArray[0]+"</OPTION>");
                                          }else{
						out.println("<OPTION value='"+tempArray[1]+"'>"+tempArray[0]+"</OPTION>");
					}
				}	
				%></select> </TD></TR>
                                
                   
                <tr><TD><b>Date Of Birth</b></TD>
                    <td>
                    <input type="text" id="cdt"  name="cdt" tabIndex="8" size="24"  value="<%=checkNull(temp5[5])%>" readonly>(Click For Date)
                </TD>
                <TD><b>ClickImage</b>
            <%
                //if(!(request.getParameter("custId").equalsIgnoreCase("null"))&& !(request.getParameter("custId").equalsIgnoreCase("")))
                    // {
                  
		    UserDetail udet = new UserDetail();
		     Vector V_ids=new Vector();
		     
		     V_ids=udet.ImageList(temp5[18]);
		     
		    System.out.println("Vector Size is    :"+V_ids.size());
		     for(int i=0;i<V_ids.size();i++)
		     {
		        
				String temp[] = new String[2];
				int j=i+1;
				temp=(String[])V_ids.get(i);
				//if(i%2==0)
				//out.println("<TR bgcolor='lightcyan'>");
				//else
				//out.println("<TR>");
                                
		   %></TD>
                  
                <td><a target='_blank'  href='<%=response.encodeURL("newImage.jsp?"+temp[0])%>' onmouseover='_ScrollStatus("Click here for view", 1);' onmouseout='_StopScrollStatus();' onblur='_StopScrollStatus();' >
			 <b><%=temp[1]%></b>  
			    </a></TD>
                             <INPUT type=HIDDEN name=ImgId value="<%=checkNull(temp[0])%>" size="10">   
                        <%
					
		     
		   }
		   
		  %></TR>
                
                <tr><TD ><B>Mother Name</B></TD>
                <td><INPUT id=txtMoName tabIndex=9 maxLength=50 name=txtMoName size="24" value="<%=checkNull(temp5[19])%>"></TD>
                <TD><b>Upload Image</b></TD>
                <td><input type="file" name="Image" size="20" value="">
                </TD></TR>
               
                <tr><TD colspan=2 nowrap ><FONT size=4 color=green><B>Bank Account Detail:</B></FONT></TD></TR>
                <tr>                
                <TD ><B>Ammount</B></TD>
                <td><INPUT id=txtAmmount tabIndex=16 maxLength=50 name=txtAmmount size="24" VALUE="<%=checkNull(temp5[16])%>" READONLY><img src="images/rup.jpg" width="18" height="22" border="0"></TD></TR>
                <tr><TD ><B>Account Type</B></TD>
                <td><select id="cboAcctype" name="cboAcctype" style="WIDTH: 165px" tabindex="17">
                            <OPTION  selected value="">Select Account Type</OPTION>
                             <%
                                UserDetail user1 = new UserDetail();
				Vector vSPE1 = new Vector();
				vSPE1 = user1.AccTypeList();	
				for(int i=0;i<vSPE1.size();i++)
					{
					String tempArray1[] = new String[10];
					tempArray1 = (String[])vSPE1.get(i);
					//if((request.getParameter("cboAcctype")!=null)&&(request.getParameter("cboAcctype").trim().equalsIgnoreCase(tempArray1[0].trim()))){
					if(((temp5[15])!=null)&&(temp5[15].equals(tempArray1[0]))){	
                                        out.println("<OPTION value='"+tempArray1[0]+"' selected>"+tempArray1[0]+"</OPTION>");
					}else{
						out.println("<OPTION value='"+tempArray1[0]+"'>"+tempArray1[0]+"</OPTION>");
					}
				}	
				%></select> </TD>
                <TD ><B>Status</B></TD>
                <td>
                     <%if(checkNull(temp5[17]).equals("Functional")){%>
                    <INPUT type="radio" tabIndex=20 size="18" value="Functional" name="status" CHECKED>Functional
                    <%}else{%>
                    <INPUT type="radio" tabIndex=20 size="18" value="Functional" name="status" >Functional
                    <%}%>
                          <%if(checkNull(temp5[17]).equals("Closed")){%>
                    <INPUT type="radio" tabIndex=20 size="19" value="Closed" name="status" CHECKED>Closed   
                    <%}else{%>
                    <INPUT type="radio" tabIndex=20 size="19" value="Closed" name="status" >Closed   
                    <%}%>
                  </TD> </TR>
                  <tr></tr>
                  <tr></tr>
                <TR>
                    
                    <td><INPUT type=HIDDEN name=userId value="<%=checkNull(UserId)%>" size="24"></td>
                    <INPUT type=HIDDEN name=rights value="<%=checkNull(temp5[20])%>" size="24"></td>
                    
                    <TD >
                        <BUTTON  TABINDEX="21" type=button  value=save name=cmdsave onclick="save()" >Update</BUTTON>&nbsp;&nbsp; 
                        <BUTTON  TABINDEX="22" type="button" value="Cancel" id="button" name="cmdCancel"ONCLICK="on_cancel()">Cancel</BUTTON>
                    </TD>
                    
                    <td><INPUT type=HIDDEN name=hidValue value="edit" size="24"></td>
                    <td></td>
                </TR>
                </TBODY>
            </TABLE>
        </FORM>
    </body>
</html>
