<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN">
<HTML>
<HEAD>
<%@ page 
language="java"import="java.util.*,
javax.naming.Context,javax.naming.InitialContext"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
isErrorPage="true"
session="true"
%>


<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK href="Resources/Calender.css" rel="stylesheet"type="text/css">

<TITLE>calendar.jsp</TITLE>
<script language="javascript" src="Resources/CalendarPopup.js"></script>

<SCRIPT language=JavaScript>document.write(getCalendarStyles());</SCRIPT>
<SCRIPT language=JavaScript id=jscal1xx>
	 var cal1xx = new CalendarPopup("testdiv1");
     cal1xx.showNavigationDropdowns();
	 cal1xx.setCssPrefix("TEST");
</SCRIPT>
</HEAD>

<BODY vLink=#00615f aLink=#00615f link=#00615f bgColor=#ffffff>
<form id="forms" name="forms" method="post" >
<TABLE border=1 width="700">
	
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<TBODY> 
            <TR>
                <TD nowrap="nowrap"><B>&nbsp;From&nbsp;</B>
                    <INPUT size=20 id=txtstartdt name=txtstartdt  value="" readonly="readonly">&nbsp; 
                    <A id="anchor13" title="Click To Get Calender" 
                       href="javascript:cal1xx.select(document.forms.txtstartdt,'anchor13','dd-NNN-yyyy')" name="anchor13">
                    <IMG border="0"	src="images/Calender1.gif" style="top: 5" width="15" hight="15"></A>&nbsp;
                    <DIV id=testdiv1 style="VISIBILITY: hidden; POSITION: absolute; BACKGROUND-COLOR: white; layer-background-color: white"></DIV>
                    
                    <B>&nbsp;To&nbsp;</B>
                    <INPUT size=20 id=txtenddt name=txtenddt value="" readonly="readonly">&nbsp;
                    <A id="anchor14" title="Click To Get Calender"	onclick=""
                       href="javascript:cal1xx.select(document.forms.txtenddt,'anchor14','dd-NNN-yyyy',(document.forms.txtenddt.value=='')?document.forms.txtstartdt.value:null);" name="anchor14">
                    <IMG border="0"	src="images/Calender1.gif" style="top: 5" width="15" hight="15"></A>&nbsp;
                    
                    <DIV id=testdiv1 style="VISIBILITY: hidden; POSITION: absolute; BACKGROUND-COLOR: white; layer-background-color: white"></DIV>
                </TD>
            </TR>
	
	</TBODY>
</TABLE>

</BODY>
</HTML>
