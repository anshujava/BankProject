<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true" import="commonFunction.*,generalClass.*,java.util.*"%>
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
<%! 
       private String checkNull(String value) {
       	if(value=="null" || value==null)
       	{return "";}
       	return value;
       }
%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<LINK href="MainStyle.css" rel="stylesheet" type="text/css">
<script language = "Javascript" src = "MainScript.js"></script>
<TITLE>topbanner.jsp</TITLE>
<style type=text/css>
	BODY
	{
	
	}
	.mOver
	{
	    COLOR: dodgerblue;
	    TEXT-DECORATION: underline
	}
	.mOut
	{
	    COLOR: Navy;
	    TEXT-DECORATION: none
	}
</style>
<style type="text/css" media="all"> 
.frm { 
    font-family: Verdana, Arial, Helvetica, sans-serif; 
    font-size: 11px; 
    font-weight: bold; 
    color: green;; 
    background-color: #D1D1D1; 
    border: 0px solid #83AAD3; 
} 
</style>
</HEAD>
<script language="javaScript" src="MainScript.js" type="text/javascript"></script>

<body bgcolor="white" onload="display()" >
<FORM NAME = "clockForm"> 
<TABLE cellpadding="0" cellspacing="0" border="0" width=100% height="40" BGCOLOR="efefef">
    
	<TR align=left height="37px" style="COLOR: green; TEXT-DECORATION: none">
		
<td><b><script language="JavaScript">
 
    var now = new Date();
    var days = new Array(
      'Sunday','Monday','Tuesday',
      'Wednesday','Thursday','Friday','Saturday');
    var months = new Array(
      'January','February','March','April','May',
      'June','July','August','September','October',
      'November','December');
    var date = ((now.getDate()<10) ? "0" : "")+ now.getDate();
    function fourdigits(number)	{
      return (number < 1000) ? number + 1900 : number;}
    today =  days[now.getDay()] + ", " +
       months[now.getMonth()] + " " +
       date + ", " +
       (fourdigits(now.getYear()));
     document.write(today);
     
    function display() { 
		    var Today = new Date(); 
		    var hours = Today.getHours(); 
		    var min = Today.getMinutes(); 
		    var sec = Today.getSeconds(); 
		    var Time = ((hours > 12) ? hours - 12 :(hours == 0) ? 12 :hours); 
		    Time += ((min < 10) ? ":0" : ":") + min; 
		    Time += ((sec < 10) ? ":0" : ":") + sec; 
		    Time += (hours >= 12) ? " PM" : " AM"; 
		    this.clockForm.clock.value = Time; 
		    setTimeout("display()",1000); 
		  }  

</script></b>
<input TYPE="text" NAME="clock" SIZE="10" class="frm"><TD nowrap height="52" width="75"></td>
<% 
	UserDetail udet = new UserDetail();
	String fullnameUser=udet.userfullName(UserId);
        
       
%>		
	<TD class="mOut" onmouseover="mEffect(1)" onmouseout="mEffect(0)"  nowrap width="25">&nbsp;</TD>
		<TD class="mOut" onmouseover="mEffect(1)" onmouseout="mEffect(0)"  width="74" nowrap>&nbsp;</TD>
		<TD colspan="6" class="mOut" onmouseover="mEffect(1)" onmouseout="mEffect(0)" >&nbsp;</TD>
               
            <TD  nowrap align="LEFT"><b>Welcome</b>&nbsp;<%=checkNull(fullnameUser)%></td>
            </tr>
           

</TABLE>
</FORM>
</BODY>
</HTML>