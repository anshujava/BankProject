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
        <title>viewUserDetail</title>
    </head>
    <body>
   
    <TABLE border=1 ID="customer" style="background-color: #efefef; WIDTH: 590px; POSITION: absolute; TOP: 50px;">
           
        <THEAD>
        <tr>
                <td colspan="16" align="left"><font size="3">View Details</font></td>
                
        </tr>
    </THEAD>
                <TBODY>
        <TR bgcolor="#d6d6d6" align="left">
                    
                    <TD nowrap><FONT size=3 color=green><B>User-Name</B></FONT></TD>
                    <TD nowrap><FONT size=3 color=green><B>Gender</B></FONT></TD>
                    <TD nowrap><FONT size=3 color=green><B>DOB</B></FONT></TD>
                    <TD nowrap><FONT size=3 color=green><B>Telephone</B></FONT></TD>
                    <TD nowrap><FONT size=3 color=green><B>Mail</B></FONT></TD>
                    <TD nowrap><FONT size=3 color=green><B>Fax</B></FONT></TD>
                    <TD nowrap><FONT size=3 color=green><B>Role</B></FONT></TD>
                    <TD nowrap><FONT size=3 color=green><B>Address</B></FONT></TD>
                    <TD nowrap><FONT size=3 color=green><B>City</B></FONT></TD>
                    <TD nowrap><FONT size=3 color=green><B>State</B></FONT></TD>
                    <TD nowrap><FONT size=3 color=green><B>Pin</B></FONT></TD>
                    <TD nowrap><FONT size=3 color=green><B>Account Number</B></FONT></TD>
                    <TD nowrap><FONT size=3 color=green><B>Account Type</B></FONT></TD>
                    <TD nowrap><FONT size=3 color=green><B>Status</B></FONT></TD>
                    <TD nowrap><FONT size=3 color=green><B>Created By</B></FONT></TD>
                    <TD nowrap><FONT size=3 color=green><B>Created On</B></FONT></TD>
                    
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
                vReq= udet.allUserDetailList();
                
                for(int i=0;i<vReq.size();i++)
                {
                String temp[]=new String[20];
                temp = (String[])vReq.get(i);
               
                    %> 
                    <TR bgcolor="#d6d6d6">
                    <TD nowrap><%=checkNull(temp[0])%></TD>
                    <TD nowrap><%=checkNull(temp[1])%></TD>
                    <TD nowrap><%=checkNull(temp[2])%></TD>
                    <TD nowrap><%=checkNull(temp[7])%></TD>
                    <TD nowrap><%=checkNull(temp[9])%></TD>
                    <TD nowrap><%=checkNull(temp[8])%></TD>
                    <TD nowrap><%=checkNull(temp[10])%></TD>
                    <TD nowrap><%=checkNull(temp[3])%></TD>
                    <TD nowrap><%=checkNull(temp[4])%></TD>
                    <TD nowrap><%=checkNull(temp[5])%></TD>
                    <TD nowrap><%=checkNull(temp[6])%></TD>
                    <TD nowrap><%=checkNull(temp[13])%></TD>
                    <TD nowrap><%=checkNull(temp[14])%></TD>
                    <TD nowrap><%=checkNull(temp[15])%></TD>
                    <TD nowrap><%=checkNull(temp[11])%></TD>
                    <TD nowrap><%=checkNull(temp[12])%></TD>
                    
                </TR>
                
                
                <%}%>
                </TBODY>
    </table>
    
    </body>
</html>
