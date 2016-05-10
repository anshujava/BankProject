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
        <title>Balance-Enquiry</title>
        <script language="javascript" type="text/javascript" src="datetimepicker.js"></script>
        <SCRIPT LANGUAGE=javascript>
    	
</SCRIPT>
<style type="text/css">
p.sansserif{font-family:Rupee Foradian;}
</style>
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
SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
String formattedDate = formatter.format(todaysDate);
%>


        <form name=frm method="post" >
            <TABLE border=1 ID="customer" style="background-color: #efefef; WIDTH: 590px; POSITION: absolute; TOP: 50px;">
              <THEAD>
        <tr>
                <td colspan="7" align="center"><font size="3">Balance Enquiry</font></td>
        </tr>
    </THEAD>
                <TBODY>          
                <%  UserDetail user5 = new UserDetail();
                            String temp5[] = new String[20];

                            Vector vList5 = new Vector();
                            vList5=user5.BalanceEnq(UserId);
                            temp5 = (String[])vList5.get(0);

                    %>
                <TR><TD><FONT size=3 color=green><b>Account Number-:</b></FONT>  <%=checkNull(temp5[0])%> </TD>     
                    <TD><FONT size=3 color=green><b>Full Name-:</b></FONT>  <%=checkNull(temp5[3])%> <%=checkNull(temp5[4])%></TD>
                    
                </TR>
                <TR><TD><FONT size=3 color=green><b>Available Balance-:</b></FONT> <%=checkNull(temp5[1])%> <img src="images/rup.jpg" width="14" height="16" border="0"></TD>     
                    <TD><FONT size=3 color=green><b>Account Type-:</b></FONT> <%=checkNull(temp5[2])%> </TD>
                    
                </TR>
                </TBODY> 
            </TABLE>
        </FORM>
    </body>
</html>
