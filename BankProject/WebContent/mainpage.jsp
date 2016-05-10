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
        <LINK href="MainStyle.css" rel="stylesheet" type="text/css">
        <script language = "Javascript" src = "MainScript.js"></script>
        <title>mainpage</title>
        <script>

  window.history.forward(1);

</script>
<SCRIPT LANGUAGE=javascript> 

function onrefresh()
{
    window.parent.tBanner.document.location.reload();
    window.parent.sMenu.document.location.reload();
    window.parent.body.document.location.reload();
    // window.parent.frames("tBanner").
}
</script>
    </head>
   <FRAMESET rows="110,*">
	<!-- <FRAME <jsp:include page="topbanner.jsp" flush="true"/> scrolling="no"> -->
	<FRAME src="topbanner.jsp" scrolling="auto" name="tBanner" frameborder="1" >
	<FRAMESET cols="23%,*" frameborder="no" onload="onrefresh()">
	


		<FRAME src="submenu.jsp" scrolling="auto" name="sMenu" frameborder="1">

		<FRAME src="welcome.jsp" scrolling="auto" name="body" frameborder="0">
	</FRAMESET>
	<NOFRAMES>
	<BODY onload="onrefresh()">
	<P>This page uses frames. The current browser you are using does not support frames.</P>
	</BODY>
	</NOFRAMES>
</FRAMESET>
</html>
