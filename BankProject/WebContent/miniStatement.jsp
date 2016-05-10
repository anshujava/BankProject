<%@page language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
buffer="20kb"
isThreadSafe="true"
isErrorPage="false"
session="true"
autoFlush="true"
import="commonFunction.*,generalClass.*,java.util.*"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <LINK href="MainStyle.css" rel="stylesheet" type="text/css">
        <script language = "Javascript" src = "MainScript.js"></script>
        <title>miniStatement</title>
    </head>
    <body>
   <form id="frm" method="post" action="pdfMini">
    <TABLE border=1 ID="customer" style="background-color: #efefef; WIDTH: 590px; POSITION: absolute; TOP: 50px;">
           
        <THEAD>
        <tr>
                <td colspan="7" align="center"><font size="3">Mini-Statement</font></td>
        </tr>
    </THEAD>
                <TBODY>
          <TR align="left">
               <%  UserDetail user5 = new UserDetail();
                String temp5[] = new String[20];
               
                Vector vList5 = new Vector();
                vList5=user5.userAcc(UserId);
                temp5 = (String[])vList5.get(0);
       
        %>               
          <TD nowrap bgcolor="#d6d6d6"><B>Name: </B><%=checkNull(temp5[1])%> <%=checkNull(temp5[2])%></TD>
           <TD nowrap bgcolor="#d6d6d6"><B>Account Number: </B><%=checkNull(temp5[0])%></TD><td nowrap bgcolor="#d6d6d6"></td><td nowrap bgcolor="#d6d6d6"></td></tr>
           <INPUT type=HIDDEN name=fName value="<%=checkNull(temp5[1])%>" size="24">
           <INPUT type=HIDDEN name=lName value="<%=checkNull(temp5[2])%>" size="24">
           <INPUT type=HIDDEN name=accNo value="<%=checkNull(temp5[0])%>" size="24">
           <INPUT type=HIDDEN name=userId value="<%=checkNull(UserId)%>" size="24">
     
        <TR bgcolor="#d6d6d6" >
                   
                    <TD nowrap><B>Date</B></TD>
                    <TD nowrap><B>Transaction Type</B></TD>
                    <TD nowrap><B>Amount</B>  <img src="images/rup.jpg" width="14" height="16" border="0"></TD>
                    <TD nowrap><B>Balance</B>  <img src="images/rup.jpg" width="14" height="16" border="0"></TD>
                    
                    
                    
                </tr>
                <%! 
                private String checkNull(String value) {
                if(value=="null" || value==null)
                {return "";}
                return value;
                }
                %>
                <%     
                Vector vReq=new Vector();
                UserDetail udet = new UserDetail();
                vReq= udet.miniStatement(UserId);
                
                for(int i=0;i<vReq.size();i++)
                {
                String temp[]=new String[20];
                temp = (String[])vReq.get(i);
               
                    %> 
                    <TR bgcolor="#d6d6d6">
                    <TD nowrap><%=checkNull(temp[0])%></TD>
                    <TD nowrap><%=checkNull(temp[1])%> </TD>
                    <TD nowrap><%=checkNull(temp[2])%></TD>
                    <TD nowrap><%=checkNull(temp[3])%></TD>
                   
                                      
                </TR>
                
                
                <%}%>
                <tr bgcolor="#d6d6d6"> <TD nowrap><B>Available Balance: </B><%=checkNull(temp5[3])%>  <img src="images/rup.jpg" width="14" height="16" border="0"></TD>
                <td nowrap bgcolor="#d6d6d6"></td><td nowrap bgcolor="#d6d6d6"></td><td nowrap bgcolor="#d6d6d6"></td></TR>
                 <INPUT type=HIDDEN name=avlBal value="<%=checkNull(temp5[3])%>" size="24">
                <tr><TD colspan="2" align="right">
		<BUTTON type="submit" name="subprint" value="Print" style="WIDTH: 100px;">Print</BUTTON>&nbsp;</TD></tr>
             </TBODY>
            </table>
    
    </body>
</html>
