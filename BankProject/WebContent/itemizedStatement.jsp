<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN">
<HTML>
<HEAD>
<%@page language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
buffer="20kb"
isThreadSafe="true"
isErrorPage="false"
session="true"
autoFlush="true"
import="commonFunction.*,generalClass.*,java.util.*"%>


<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK href="MainStyle.css" rel="stylesheet" type="text/css">
<TITLE>itemizedStatement.jsp</TITLE>
<script language = "Javascript" src = "MainScript.js"></script>
<LINK href="Resources/flora.datepick.css" rel="stylesheet"type="text/css">

<script language="javascript" src="Resources/jquery-1.4.2.js"></script>
<script language="javascript" src="Resources/jquery.datepick.js"></script>
 <script type="text/javascript">
$(function() {
	$('#txtenddt').datepick();
	
});
</script>
<script type="text/javascript">
$(function() {
	$('#txtstartdt').datepick();
	
});
</script>
<SCRIPT language="JavaScript">
function Report()
{
	if(!ValidateForm()) return;
	{
		document.forms.action = "itemizedStatement.jsp";
		document.forms.submit();
	}
}
function ValidateForm()
{
	var dt=document.forms.txtstartdt
	var dt1=document.forms.txtenddt
        var dtt=dt.value;
	var dtt1=dt1.value;
	//if (dt.value=="")
  if(document.getElementById("txtstartdt").value=="")
	{
		alert("Please Enter From Date ");
		return false
	}
	//if (dt1.value=="")
	if(document.getElementById("txtenddt").value=="")
	{
		alert("Please Enter To Date ");
		return false
	}
        if(!datecompare(dtt,dtt1))
	{
	  alert("To Date should not be lessthan From Date");  
	  return false;
	}
   return true
 }
</SCRIPT>
<% HttpSession sUser = request.getSession(true);
    String UserId = (String)sUser.getAttribute("UserId");
    sUser.setAttribute("UserId",UserId);
    //sUserDept.setMaxInactiveInterval(3);
    //String url = request.getQueryString();
    if(sUser.getAttribute("UserId") == null) 
    {
            response.sendRedirect ("logout.jsp");
      }
%>
<%! 
private String checkNull(String value) {
if(value=="null" || value==null)
{return "";}
return value;
}
 %>
</HEAD>

<BODY vLink=#00615f aLink=#00615f link=#00615f bgColor=#ffffff>
<form id="forms" name="forms" action="pdfItemized" onsubmit="return ValidateForm()">
<TABLE border=1 width="600">
<%  UserDetail user5 = new UserDetail();
    String temp5[] = new String[20];

    Vector vList5 = new Vector();
    vList5=user5.userAcc(UserId);
    temp5 = (String[])vList5.get(0);

   %>   
        <THEAD>
            <tr>
                <td align="center"><font size="3">Itemized Statement</font></td>
            </tr>
        </thead>
	<TBODY> 
            <TR>
            <TD nowrap bgcolor="#d6d6d6"><B>Name: </B><%=checkNull(temp5[1])%> <%=checkNull(temp5[2])%></TD></tr>
           <TR><TD nowrap bgcolor="#d6d6d6"><B>Account Number: </B><%=checkNull(temp5[0])%></TD></tr>
           <TR><TD nowrap bgcolor="#d6d6d6"><B>Available Balance: </B><%=checkNull(temp5[3])%>  <img src="images/rup.jpg" width="14" height="16" border="0"></TD></tr>
           <TR>
           <INPUT type=HIDDEN name=fName value="<%=checkNull(temp5[1])%>" size="24">
           <INPUT type=HIDDEN name=lName value="<%=checkNull(temp5[2])%>" size="24">
           <INPUT type=HIDDEN name=accNo value="<%=checkNull(temp5[0])%>" size="24">
           <INPUT type=HIDDEN name=userId value="<%=checkNull(UserId)%>" size="24">
           <INPUT type=HIDDEN name=avlBal value="<%=checkNull(temp5[3])%>" size="24">
		<TD colspan="6">&nbsp;</TD>
	</TR>
            <TR>
                <TD nowrap="nowrap"><B>&nbsp;From&nbsp;</B>
                    <INPUT size=20 id=txtstartdt name=txtstartdt  value="" readonly="readonly">&nbsp; 
                   
                    
                    <B>&nbsp;To&nbsp;</B>
                    <INPUT size=20 id=txtenddt name=txtenddt value="" readonly="readonly">&nbsp;
                   
                </TD>
            </TR>
            <tr></tr>
            <tr></tr>
            <tr></tr><tr></tr>
            <tr></tr>
            
         <tr>	
   	<TD>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <BUTTON type="button"name="butReport" value="View Report" style="WIDTH: 100px" onclick="Report()">View Report</BUTTON>
	<BUTTON type="submit" name="subprint" value="Print" style="WIDTH: 100px" onclick="return ValidateForm()">Print</BUTTON></TD>
	</TR>
	<TR>
			<TD colspan="6">&nbsp;</TD>
		</TR>
		<TR>
			<TD colspan="6">
			<TABLE width="600" align="center"border=0>
                <TBODY>
                        <TR bgcolor="#d6d6d6">
                        <TD nowrap><B>Date</B></TD>
                        <TD nowrap><B>Transaction Type</B></TD>
                        <TD nowrap><B>Amount</B>  <img src="images/rup.jpg" width="14" height="16" border="0"></TD>
                        <TD nowrap><B>Balance</B>  <img src="images/rup.jpg" width="14" height="16" border="0"></TD>
                        </TR>

                <%     
                Vector vReq=new Vector();
                UserDetail udet = new UserDetail();
                String from=request.getParameter("txtstartdt");
	        String end=request.getParameter("txtenddt");
                vReq= udet.itemizedStatement(UserId,from,end);
                
                for(int i=0;i<vReq.size();i++)
                {
                String temp[]=new String[20];
                temp = (String[])vReq.get(i);
               
                    %> 
            <TR>
                    <TD nowrap="nowrap"><%=checkNull(temp[0])%></TD>
                    <TD nowrap="nowrap"><%=checkNull(temp[1])%></TD>
                    <TD nowrap="nowrap"><%=checkNull(temp[2])%></TD>
                    <TD nowrap="nowrap"><%=checkNull(temp[3])%></TD>
                    <TD nowrap="nowrap"><%=checkNull(temp[4])%></TD>

            </TR>

            <%}%>
            <TR>
            <TD>
            <input type="hidden" id=from name=from value=<%=from%>>
            <input type="hidden" id=end   name=end value=<%=end%>>
            </TD>
            </TR>	
    </TBODY>
                </TABLE>
                </TD>
        </TR>

</TBODY>
</TABLE>

</BODY>
</HTML>
