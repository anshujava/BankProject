<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<%@ page 
language="java" import=" java.util.*, javax.servlet.http.*"
contentType="text/html; charset=ISO-8859-1"
isThreadSafe="true"
isErrorPage="false"
session="true"
autoFlush="true"
%>



<%

	response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
	
	response.setHeader("Pragma","no-cache"); // HTTP 1.0
	
	response.setDateHeader ("Expires", 0); // Prevents caching at the proxy server...

%>
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>attachImage.jsp</TITLE>
</HEAD>
<BODY onload=javascript:document.forms.form1.reset();>
<SCRIPT src="Resources/fileUploading.js" type=text/javascript></SCRIPT>
<LINK href="Resources/MainStyle.css" rel="stylesheet" type="text/css">
<SCRIPT language="JavaScript">

    
</SCRIPT>
<FORM name=form1 >
<SPAN id=chooserSpan>
<INPUT id=test1 type="hidden" name=test1>
<INPUT id="desc" type="hidden" name="desc">
<INPUT type="hidden" name="anaComp" id="anaComp">
<INPUT id="fileInput" type="file" onchange="javascript:fileChange();" name="fileInput" size=30></SPAN>
<INPUT id="desc" type="hidden" name="desc">
<INPUT id=uploadFilesButton	style="FONT-SIZE: 12px" onclick=javascript:uploadFiles2(); style="WIDTH: 85px; HEIGHT: 23px" type=button value="Save" name=upload>

	<table>
	<Tr><Td>Maximum 20 images you can Upload 
	</Td>
	<%
	
	
	 %>
	</Tr>
	</table>
   		
  
<INPUT id=noPopup type="hidden"	checked="checked"><br>
</FORM><BR>

<DIV id=mainUploadDiv
	style="FONT-SIZE: 12px; OVERFLOW: hidden; WIDTH: 600px; BACKGROUND-COLOR: #77ddhh"
	align=left>
<DIV class=uploadPathDiv id=uploadDeleteTitleDiv style="WIDTH: 100px"
	align=center><B></B></DIV>
<DIV class=uploadPathDiv id=uploadPreviewTitleDiv style="WIDTH: 0px"
	align=center><B> </B></DIV>
<DIV class=uploadPathDiv id=uploadPathTitleDiv style="WIDTH: 500px"
	align=center><B>Maximum(File <SCRIPT>document.write(maxUploads);</SCRIPT>
)</B></DIV>
</DIV>
<SCRIPT>
fileUpload();
</SCRIPT>
<SCRIPT type="text/javascript">


</SCRIPT>
<FORM id="uploadForm" method="post" action="mystore"
	encType="multipart/form-data" ><INPUT id=uid type=hidden name=uid>
	

	<INPUT id=test type="hidden" name=test >
	
	
<DIV id=temp></DIV>
</FORM>
</BODY>

</HTML>
