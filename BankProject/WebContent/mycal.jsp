<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
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
        <title>JSP Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <LINK href="MainStyle.css" rel="stylesheet" type="text/css">
        <LINK href="Resources/flora.datepick.css" rel="stylesheet"type="text/css">
               
        <script language="javascript" src="Resources/jquery-1.4.2.js"></script>
        <script language="javascript" src="Resources/jquery.datepick.js"></script>
     <script type="text/javascript">
$(function() {
	$('#popupDatepicker').datepick();
	
});
</script>
</head>
<body bgcolor="#ADFF2F">
<h1><font color="green">jQuery popup Date picker</font></h1>
<font color="green">
<p>Enter Date &nbsp;<input type="text" id="popupDatepicker"></p>
</font>
</body>
</html>