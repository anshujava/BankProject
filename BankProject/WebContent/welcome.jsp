<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<%@ page 
language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
isThreadSafe="false"
isErrorPage="false"
session="true"
autoFlush="true"
%>
<%! 
       public void jspInit() {
       
       }
%>
<%

	response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
	
	response.setHeader("Pragma","no-cache"); // HTTP 1.0
	
	response.setDateHeader ("Expires", 0); // Prevents caching at the proxy server...

%>
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<LINK href="MainStyle.css" rel="stylesheet" type="text/css">
<script language = "Javascript" src = "MainScript.js"></script>
<META http-equiv="Content-Style-Type" content="text/css">
<LINK href="MainStyle.css" rel="stylesheet"
	type="text/css">
	<%	HttpSession sUser = request.getSession(true);
	String UserId = (String)sUser.getAttribute("UserId");
	sUser.setAttribute("UserId",UserId);
	//sUserDept.setMaxInactiveInterval(3);
	//String url = request.getQueryString();
	if(sUser.getAttribute("UserId") == null) 
	{
 		response.sendRedirect ("login.jsp");
	  }
%>
<TITLE>welcome.jsp</TITLE>
</HEAD>

<SCRIPT language="JavaScript" src="MainScript.js"></SCRIPT>
<SCRIPT LANGUAGE=javascript>
function on_refresh()
{
    window.parent.tBanner.document.location.reload();
    window.parent.sMenu.document.location.reload();
   // window.parent.frames("tBanner").
}
</SCRIPT>
<BODY onload="on_refresh()">
<TABLE align='center' border='0' BGCOLOR="efefef">
	<TR>
		<TD>&nbsp;</TD>
	</TR>
	<TR>
		<TD>&nbsp;</TD>
	</TR>
	<TR>
		<TD>&nbsp;</TD>
	</TR>
	<TR>
		<TD>&nbsp;</TD>
	</TR>
                        <TR>
                            <TD>
                                <H1 align=center style="color: green; font-family: Times New Roman">Welcome</H1>
                        </TD></tr>
                      <tr>  <TD>
		<H1 align=center style="color: green; font-family: Times New Roman">To</H1>
			</TD>
	</TR>
         <tr>  <TD>
		<H1 align=center style="color: green; font-family: Times New Roman">Bank</H1>
			</TD>
	</TR>
	
	<TR>
		<TD align=center><FONT size=2><i></i> </FONT>
		</TD>
	</TR>
	<Tr>
		<TD>&nbsp;</TD>
	</Tr>
	
	</TABLE>
	
	</BODY>
	
	</HTML>
