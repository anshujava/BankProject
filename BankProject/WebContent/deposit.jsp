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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <LINK href="MainStyle.css" rel="stylesheet" type="text/css">
        <script language = "Javascript" src = "MainScript.js"></script>
        <title>Deposit</title>
        <script language="javascript" type="text/javascript" src="datetimepicker.js"></script>
        <SCRIPT LANGUAGE=javascript>
    function onAccountNumber(){
	 document.frm.action="deposit.jsp";
         document.frm.submit();	    
	  }
     function ValidateForm(){
 	if (document.getElementById("cboAccnum").value == "")
	
	{
		alert ("Please Select Account No");
		return false;
	}
       
     
     if (document.getElementById("txtAmmount").value == "")
	
	{
		alert ("Please Enter Ammount ");
		return false;
	}
         
        var oldPrice = document.frm.txtavBal.value
        var newPrice = document.frm.txtAmmount.value
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

function on_cancel(){
    document.frm.action="deposit.jsp";
    document.frm.submit();
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
            <TABLE border=1 ID="customer" style="background-color: #efefef; WIDTH: 600px; POSITION: absolute; TOP: 50px;">
                <THEAD>
        <tr>
                <td colspan="7" align="center"><font size="3">Transfer</font></td>
        </tr>
    </THEAD>
                <TBODY>
               
                <TR><TD><b>From Account Number</b></TD>
                <% 
                UserDetail udets = new UserDetail();
                String accNum=udets.accNo(UserId);
                
                UserDetail udetbal = new UserDetail();
                String avlBal=udetbal.avlBalance(UserId);
                  %>
                <td><INPUT id=txtFromaccNo tabIndex=1 maxLength=50 name=txtFromaccNo size="19" VALUE="<%=checkNull(accNum)%>" READONLY></TD>
			<TD><B>Available Balance</B></TD>
		 <td><INPUT id=txtavBal tabIndex=2 maxLength=50 name=txtavBal size="19" VALUE="<%=checkNull(avlBal)%>" READONLY>
             <img src="images/rup.jpg" width="14" height="22" border="0"></TD>	
                    
                </TR>
                    <TR><TD><B>To Account Number</B></TD>
			<TD><SELECT id="cboAccnum" style="WIDTH: 133px" name="cboAccnum"
				onchange="onAccountNumber()" tabindex="3"> 
				<OPTION  selected value="">Select Account No</OPTION>
				<%
                                String acc ="";
                                String id ="";
				UserDetail user2 = new UserDetail();
                                Vector vList2 = new Vector();
				vList2 = user2.AccountList(accNum);	
				for(int i=0;i<vList2.size();i++)
					{
					String tempArray2[] = new String[10];
					tempArray2 = (String[])vList2.get(i);
					if((request.getParameter("cboAccnum")!=null)&&(request.getParameter("cboAccnum").trim().equalsIgnoreCase(tempArray2[0].trim()))){
						out.println("<OPTION value='"+tempArray2[0]+"' selected>"+tempArray2[0]+"</OPTION>");
					 acc=tempArray2[0];
                                         id =tempArray2[1]; 
                                                }else{
						out.println("<OPTION value='"+tempArray2[0]+"'>"+tempArray2[0]+"</OPTION>");
					}
				}	
				%>
                               
			</SELECT></TD>
      <%  UserDetail user5 = new UserDetail();
                    String temp5[] = new String[20];
                    if(!(acc.equals("null"))&& !(acc.equals("")))
                 {
                    Vector vList5 = new Vector();
                    vList5=user5.UserDetailList(request.getParameter("cboAccnum"));
                    temp5 = (String[])vList5.get(0);
            }
            %>
        <TD><b>Name</b></TD>
        <td><INPUT id=txtcFName tabIndex=4 maxLength=50 name=txtcFName size="22" VALUE="<%=checkNull(temp5[0])%> <%=checkNull(temp5[1])%>" READONLY></TD></TR>
        <tr><TD><b>Today Date</b></TD>
                <td><INPUT id=txtTodayDt tabIndex=5 maxLength=50 name=txtTodayDt size="19" VALUE="<%=checkNull(formattedDate)%>" READONLY></TD>
            <TD><b>Account Type</b></TD>
        <td><INPUT id=txtAcctype tabIndex=6 maxLength=50 name=txtAcctype size="22" VALUE="<%=checkNull(temp5[15])%>" READONLY></TD>
             <td><INPUT type=HIDDEN id=txtAccId tabIndex=1 maxLength=50 name=txtAccId size="22" VALUE="<%=checkNull(id)%>"></TD>
         <td><INPUT type=HIDDEN id=txtType tabIndex=1 maxLength=50 name=txtType size="22" VALUE="Deposite"></TD></tr>
         <tr><TD ><B>Transfer Ammount</B></TD>
                <td><INPUT id=txtAmmount tabIndex=7 maxLength=50 name=txtAmmount size="19" VALUE="" ONBLUR="moneyFormat(document.frm.txtAmmount)"><img src="images/rup.jpg" width="14" height="22" border="0"></TD></tr>
                     <td><INPUT type=HIDDEN name=userId value="<%=checkNull(UserId)%>" size="24"></td>
                      <td><INPUT type=HIDDEN name=ToaccountNo value="<%=acc%>" size="24"></td>
                       <TR>
                 
                    <TD >
                        
                        <BUTTON  TABINDEX="8" type=button  value=save name=cmdsave onclick="save()" >Transfer</BUTTON>&nbsp;&nbsp; 
                        <BUTTON  TABINDEX="9" type="button" value="Cancel" id="button" name="cmdCancel"ONCLICK="on_cancel()">Cancel</BUTTON>
                    
                    </TD>
                     <td><INPUT type=HIDDEN name=userId value="<%=checkNull(UserId)%>" size="24"></td>
                      <td><INPUT type=HIDDEN name=ToaccountNo value="<%=acc%>" size="24"></td>
                   
                    
                </TR>
            </TBODY>
            </TABLE>
        </FORM>
    </body>
</html>
