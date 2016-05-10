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
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <LINK href="MainStyle.css" rel="stylesheet" type="text/css">
 <script language = "Javascript" src = "MainScript.js"></script>
 <SCRIPT LANGUAGE=javascript>
     	
function CheckVal(chk){
	chk.value=chk.checked?"on":"off"; 
}
 function onUserName()
    {
     document.frm.action="userRights.jsp";
     document.frm.submit();	    
     }
 
     function save()
     {    

      document.frm.action="sUserRights";
      document.frm.submit();
     
}
function getRights()
{
    document.frm.action="userRights.jsp";
     document.frm.submit();	
     document.getElementById("GeneralInfo").style.visibility='visible';
     }
function viewPage(){
	
        document.getElementById("GeneralInfo").style.visibility='hidden';
	
	
}
</SCRIPT>        
    </head>
    <body >
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
                 <TABLE border=1 ID="customer" style="background-color: #efefef; WIDTH: 482px; POSITION: absolute; TOP: 50px;">
                     <THEAD>
                         <tr>
                             <td colspan="7" align="center"><font size="3">Set User Rights</font></td>
                         </tr>
                     </THEAD>
                     <TBODY>
                         <TR>
                             <TD><B>User Name:-</B><SELECT id="cboUserName" style="WIDTH: 164px" name="cboUserName" onchange="onUserName()" tabindex="1"> 
                                     <OPTION  selected >Select User Name</OPTION>
                                     <%
                                     String userid="";
                                     String userRole="";
                                     UserDetail user1 = new UserDetail();
                                     Vector vList1 = new Vector();
                                     vList1 = user1.userName();	
                                     for(int i=0;i<vList1.size();i++)
                                     {
                                     String tempArray1[] = new String[10];
                                     tempArray1 = (String[])vList1.get(i);
                                     if((request.getParameter("cboUserName")!=null)&&(request.getParameter("cboUserName").trim().equalsIgnoreCase(tempArray1[0].trim()))){
                                     out.println("<OPTION value='"+tempArray1[0]+"' selected>"+tempArray1[1]+"</OPTION>");
                                     userid=tempArray1[0];
                                     userRole=tempArray1[2];
                                     }else{
                                     out.println("<OPTION value='"+tempArray1[0]+"'>"+tempArray1[1]+"</OPTION>");
                                     }
                                     }	
                                     %>
                                     
                             </SELECT></TD><td>
                                 <INPUT type=HIDDEN name=userId value="<%=checkNull(userid)%>" size="24">
                                 <INPUT type=HIDDEN name=userRole value="<%=checkNull(userRole)%>" size="24">
                             </td>
                             <TD><B>Role:-</B><SELECT id="cboRole" style="WIDTH: 164px" name="cboRole"  tabindex="1"> 
                                     <OPTION  selected>Select Role</OPTION>
                                     <%
                                     String Role="";
                                     UserDetail user2 = new UserDetail();
                                     Vector vList2 = new Vector();
                                     vList2 = user2.Role();	
                                     for(int i=0;i<vList2.size();i++)
                                     {
                                     String tempArray2[] = new String[10];
                                     tempArray2 = (String[])vList2.get(i);
                                     //if((request.getParameter("cboRole")!=null)&&(request.getParameter("cboRole").trim().equalsIgnoreCase(tempArray2[0].trim()))){
                                     if(((userRole)!=null)&&(userRole.equals(tempArray2[0]))){	
                                     out.println("<OPTION value='"+tempArray2[0]+"' selected>"+tempArray2[1]+"</OPTION>");
                                     Role=tempArray2[0];
                                     }else{
                                     out.println("<OPTION value='"+tempArray2[0]+"'>"+tempArray2[1]+"</OPTION>");
                                     }
                                     }	
                                     %>
                                     
                             </SELECT></TD>
                         <td><INPUT type=HIDDEN name=role value="<%=checkNull(Role)%>" size="24">
                             <INPUT type=HIDDEN name=hidval value="allrights" size="24"></td></TR>
                         
                         <tr><TD >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <BUTTON  TABINDEX="21" type=BUTTON  value=save name=cmdsave  ONCLICK="getRights()">Get Rights</BUTTON>
                   
                    </TD></TR>
                         <TR>
                             <TD colspan="6">
                                 <TABLE border=0 ID="GeneralInfo">
                                     <%
                         
                         Vector vCheck=new Vector();
                         String temp[] = new String[25];
                         UserDetail udet = new UserDetail();
                         GeneralBean cfun= new GeneralBean();
                         //if(((request.getParameter("cboRole")!=null)&&!(request.getParameter("cboRole").equalsIgnoreCase("Select Role"))))
                         if(((request.getParameter("cboRole"))!=null) && !(request.getParameter("cboRole").equalsIgnoreCase("Select Role")))
                         {
                         Vector vList = new Vector();
                         vList=udet.FormList(request.getParameter("cboRole"));
                         temp = (String[])vList.get(0);
                         vCheck=cfun.getDelimitedList(temp[3],",");
                         for(int i=0;i<vCheck.size();i++){
                         temp[i]=cfun.Val((String)vCheck.get(i));
                         }
                         }
                         %>   
                 <TBODY>
                     <tr><TD nowrap>
                             <%if(checkNull(temp[0]).equals("on")){%>
                             <INPUT style="LEFT: 6px;TOP: 2px; " type="checkbox" name="AddUser" size="18" onclick="CheckVal(document.frm.AddUser)" checked="checked">
                             <%}else{%>
                             <INPUT style="LEFT: 6px;TOP: 2px; " type="checkbox" name="AddUser" size="18" onclick="CheckVal(document.frm.AddUser)" >
                             <%}%>
                     <FONT size=3 color=green><B>AddUser</B></FONT></TD></TR>
                     <tr><TD nowrap>
                             <%if(checkNull(temp[1]).equals("on")){%>
                             <INPUT style="LEFT: 6px;TOP: 2px; " type="checkbox" name="EditUser" size="18" onclick="CheckVal(document.frm.EditUser)" checked="checked">
                             <%}else{%>
                             <INPUT style="LEFT: 6px;TOP: 2px; " type="checkbox" name="EditUser" size="18" onclick="CheckVal(document.frm.EditUser)" >
                             <%}%>
                     <FONT size=3 color=green><B>EditUser</B></FONT></TD></TR>
                     <tr><TD nowrap>
                             <%if(checkNull(temp[2]).equals("on")){%>
                             <INPUT style="LEFT: 6px;TOP: 2px; " type="checkbox" name="ViewUserDetail" size="18" onclick="CheckVal(document.frm.ViewUserDetail)" checked="checked">
                             <%}else{%>
                             <INPUT style="LEFT: 6px;TOP: 2px; " type="checkbox" name="ViewUserDetail" size="18" onclick="CheckVal(document.frm.ViewUserDetail)">
                             <%}%>
                     <FONT size=3 color=green><B>ViewUserDetail</B></FONT></TD></TR>
                     <tr><TD nowrap>
                             <%if(checkNull(temp[3]).equals("on")){%>
                             <INPUT style="LEFT: 6px;TOP: 2px; " type="checkbox" name="BalanceEnquiry" size="18" onclick="CheckVal(document.frm.BalanceEnquiry)" checked="checked">
                             <%}else{%>
                             <INPUT style="LEFT: 6px;TOP: 2px; " type="checkbox" name="BalanceEnquiry" size="18" onclick="CheckVal(document.frm.BalanceEnquiry)" >
                             <%}%>
                     <FONT size=3 color=green><B>BalanceEnquiry</B></FONT></TD></TR>
                     <tr><TD nowrap>
                             <%if(checkNull(temp[4]).equals("on")){%>
                             <INPUT style="LEFT: 6px;TOP: 2px; " type="checkbox" name="Transfer" size="18" onclick="CheckVal(document.frm.Transfer)" checked="checked">
                             <%}else{%>
                             <INPUT style="LEFT: 6px;TOP: 2px; " type="checkbox" name="Transfer" size="18" onclick="CheckVal(document.frm.Transfer)" >
                             <%}%>
                     <FONT size=3 color=green><B>Transfer</B></FONT></TD></TR>
                     <tr><TD nowrap>
                             <%if(checkNull(temp[5]).equals("on")){%>
                             <INPUT style="LEFT: 6px;TOP: 2px; " type="checkbox" name="Withdraw" size="18" onclick="CheckVal(document.frm.Withdraw)" checked="checked">
                             <%}else{%>
                             <INPUT style="LEFT: 6px;TOP: 2px; " type="checkbox" name="Withdraw" size="18" onclick="CheckVal(document.frm.Withdraw)">
                             <%}%>
                     <FONT size=3 color=green><B>Withdraw</B></FONT></TD></TR>
                     <tr><TD nowrap>
                             <%if(checkNull(temp[6]).equals("on")){%>
                             <INPUT style="LEFT: 6px;TOP: 2px; " type="checkbox" name="MiniStatement" size="18" onclick="CheckVal(document.frm.MiniStatement)" checked="checked">
                             <%}else{%>
                             <INPUT style="LEFT: 6px;TOP: 2px; " type="checkbox" name="MiniStatement" size="18" onclick="CheckVal(document.frm.MiniStatement)">
                             <%}%>
                     <FONT size=3 color=green><B>MiniStatement</B></FONT></TD></TR>
                     <tr><TD nowrap>
                             <%if(checkNull(temp[7]).equals("on")){%>
                             <INPUT style="LEFT: 6px;TOP: 2px; " type="checkbox" name="ItemizesSratement" size="18" onclick="CheckVal(document.frm.ItemizesSratement)" checked="checked">
                             <%}else{%>
                             <INPUT style="LEFT: 6px;TOP: 2px; " type="checkbox" name="ItemizesSratement" size="18" onclick="CheckVal(document.frm.ItemizesSratement)">
                             <%}%>
                     <FONT size=3 color=green><B>ItemizesSratement</B></FONT></TD></TR>
                     <tr><TD nowrap>
                             <%if(checkNull(temp[8]).equals("on")){%>
                             <INPUT style="LEFT: 6px;TOP: 2px; " type="checkbox" name="UserRights" size="18" onclick="CheckVal(document.frm.UserRights)" checked="checked">
                             <%}else{%>
                             <INPUT style="LEFT: 6px;TOP: 2px; " type="checkbox" name="UserRights" size="18" onclick="CheckVal(document.frm.UserRights)">
                             <%}%>
                         <FONT size=3 color=green><B>UserRights</B></FONT></TD>
                     </TR>
                     <tr><TD nowrap>
                             <%if(checkNull(temp[9]).equals("on")){%>
                             <INPUT style="LEFT: 6px;TOP: 2px; " type="checkbox" name="changePassword" size="18" onclick="CheckVal(document.frm.changePassword)" checked="checked">
                             <%}else{%>
                             <INPUT style="LEFT: 6px;TOP: 2px; " type="checkbox" name="changePassword" size="18" onclick="CheckVal(document.frm.changePassword)">
                             <%}%>
                         <FONT size=3 color=green><B>ChangePassword</B></FONT></TD>
                     </TR>
                     <tr> <TD >
                    <BUTTON  TABINDEX="21" type=button  value=save name=cmdsave onclick="save()" >Save</BUTTON>&nbsp;&nbsp; 
                    <BUTTON  TABINDEX="22" type="button" value="Cancel" id="button" name="cmdCancel"ONCLICK="on_cancel()">Cancel</BUTTON>
        </TD></TR>
                         </TBODY></TABLE></TD></TR>
        </TBODY>
            </TABLE>
    </body>
</html>
