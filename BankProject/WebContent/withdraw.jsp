<%@page language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
buffer="20kb"
isThreadSafe="true"
isErrorPage="false"
session="true"
autoFlush="true"
import="commonFunction.*,generalClass.*,java.util.*,java.text.*,java.text.SimpleDateFormat,java.util.Date"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
 <LINK href="MainStyle.css" rel="stylesheet" type="text/css">
<script language = "Javascript" src = "MainScript.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Withdraw</title>
<script language="javascript" type="text/javascript" src="datetimepicker.js"></script>
<SCRIPT LANGUAGE=javascript>
    function on_cancel(){
    document.frm.action="withdraw.jsp";
    document.frm.submit();
}
 function ValidateForm(){
 	
     
     if (document.getElementById("txtwdAmmount").value == "")
	
	{
		alert ("Please Enter Ammount ");
		return false;
	}
         
        var oldPrice = document.frm.txtaBal.value
        var newPrice = document.frm.txtwdAmmount.value
         if (parseInt(newPrice) > parseInt(oldPrice))
        {
       
        alert("The new price cannot be less than the old price."); return false;
        }
 return true
}
    function save(){    
    if(!ValidateForm()) return;{
      document.frm.action="sDeposit";
      document.frm.submit();
     }
}
function moneyFormat(textObj) {
   var newValue = textObj.value;
   var decAmount = "";
   var dolAmount = "";
   var decFlag = false;
   var aChar = "";
   
   // ignore all but digits and decimal points.
   for(i=0; i < newValue.length; i++) {
      aChar = newValue.substring(i,i+1);
      if(aChar >= "0" && aChar <= "9") {
         if(decFlag) {
            decAmount = "" + decAmount + aChar;
         }
         else {
            dolAmount = "" + dolAmount + aChar;
         }
      }
      if(aChar == ".") {
         if(decFlag) {
            dolAmount = "";
            break;
         }
         decFlag=true;
      }
   }
   
   // Ensure that at least a zero appears for the dollar amount.

   if(dolAmount == "") {
      dolAmount = "0";
   }
   // Strip leading zeros.
   if(dolAmount.length > 1) {
      while(dolAmount.length > 1 && dolAmount.substring(0,1) == "0") {
         dolAmount = dolAmount.substring(1,dolAmount.length);
      }
   }
   
   // Round the decimal amount.
   if(decAmount.length > 2) {
      if(decAmount.substring(2,3) > "4") {
         decAmount = parseInt(decAmount.substring(0,2)) + 1;
         if(decAmount < 10) {
            decAmount = "0" + decAmount;
         }
         else {
            decAmount = "" + decAmount;
         }
      }
      else {
         decAmount = decAmount.substring(0,2);
      }
      if (decAmount == 100) {
         decAmount = "00";
         dolAmount = parseInt(dolAmount) + 1;
      }
   }
   
   // Pad right side of decAmount
   if(decAmount.length == 1) {
      decAmount = decAmount + "0";
   }
   if(decAmount.length == 0) {
      decAmount = decAmount + "00";
   }
   
   // Check for negative values and reset textObj
   if(newValue.substring(0,1) != '-' ||
         (dolAmount == "0" && decAmount == "00")) {
      textObj.value = dolAmount + "." + decAmount;

   }
   else{
      textObj.value = '-' + dolAmount + "." + decAmount;
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
Date todaysDate = new java.util.Date();
SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
String formattedDate = formatter.format(todaysDate);
%>


        <form name=frm method="post" >
            <TABLE border=1 ID="customer" style="background-color: #efefef; WIDTH: 590px; POSITION: absolute; TOP: 50px;">
           <THEAD>
        <tr>
                <td colspan="7" align="center"><font size="3">Withdraw</font></td>
        </tr>
           </THEAD>
                <TBODY>
                
                <TR><TD><b>Account Number</b></TD>
             <% 
                UserDetail udets = new UserDetail();
                String accNum=udets.accNo(UserId);
                  %>
            <%  UserDetail user5 = new UserDetail();
                String temp5[] = new String[20];
               
                Vector vList5 = new Vector();
                vList5=user5.Withdrawl(UserId);
                temp5 = (String[])vList5.get(0);
                
		%>
            <td><INPUT id=txtFromaccNo tabIndex=1 maxLength=50 name=txtFromaccNo size="22" VALUE="<%=checkNull(accNum)%>" READONLY></TD>
            <TD><b>Full Name</b></TD><td><INPUT id=txtFName tabIndex=1 maxLength=50 name=txtcFName size="22" 
            VALUE="<%=checkNull(temp5[0])%> <%=checkNull(temp5[1])%>" READONLY></TD></TR>
            <tr> <TD><b>Avalable Balance</b></TD>
            <td><INPUT id=txtaBal tabIndex=1 maxLength=50 name=txtaBal size="22" VALUE="<%=checkNull(temp5[3])%>" READONLY><img src="images/rup.jpg" width="14" height="22" border="0"></TD>
            <TD><b>Account Type</b></TD>
            <td><INPUT id=txtAcctype tabIndex=1 maxLength=50 name=txtAcctype size="22" VALUE="<%=checkNull(temp5[2])%>" READONLY></TD> </TR>

                <tr>                
                <TD ><B>Withdraw Ammount</B></TD>
                <td><INPUT id=txtwdAmmount tabIndex=19 maxLength=50 name=txtwdAmmount size="22" VALUE="" ONBLUR="moneyFormat(document.frm.txtwdAmmount)"><img src="images/rup.jpg" width="14" height="22" border="0"></TD>
                <TD><b>Today Date</b></TD>
                <td><INPUT id=txtTodayDt tabIndex=1 maxLength=50 name=txtTodayDt size="22" VALUE="<%=checkNull(formattedDate)%>" READONLY></TD> </TR>
                 
                <TR>
                   <td></td>
                 <TD >
                        
                <BUTTON  TABINDEX="21" type=button  value=save name=cmdsave onclick="save()" >Withdraw</BUTTON>&nbsp;&nbsp; 
                <BUTTON  TABINDEX="22" type="button" value="Cancel" id="button" name="cmdCancel"ONCLICK="on_cancel()">Cancel</BUTTON>

            </TD>
                     <td><INPUT type=HIDDEN name=userId value="<%=checkNull(UserId)%>" size="24"></td>
                      <td><INPUT type=HIDDEN id=txtType tabIndex=1 maxLength=50 name=txtType size="22" VALUE="Withdraw">
                   
                    
                </TR>
                </TBODY>
            </TABLE>
        </FORM>
    </body>
</html>
