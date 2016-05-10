<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="commonFunction.*,generalClass.*,java.util.*"%>
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

<STYLE type="text/css">

.mStl {
	width:150px;
	background-color: #efefef;
	border-width: medium;
	border-style: groove;
	display: block;
}
A:LINK
{
	color: green;
}
A:VISITED {
	color: #006699;
}
A:HOVER
{
	
	color: green;
	font-weight: bold;
}

</STYLE>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <LINK href="MainStyle.css" rel="stylesheet" type="text/css">
        <script language = "Javascript" src = "MainScript.js"></script>
        <title>submenu</title>
    </head>
   <body >
       <FORM name=frm method=post >
           <%! 
           private String checkNull(String value) {
           if(value=="null" || value==null)
           {return "";}
           return value;
           }
           %>
           <% 
	UserDetail udet1 = new UserDetail();
        String temp5[] = new String[20];
        Vector vList5 = new Vector();
        vList5=udet1.UserloginStatus(UserId);
        temp5 = (String[])vList5.get(0);
       
%>
           <% 
	 
         Vector vCheck=new Vector();
         String temp[] = new String[25];
         UserDetail udet = new UserDetail();
         GeneralBean cfun= new GeneralBean();
         Vector vList = new Vector();
         vList=udet.UserRole(UserId);
         temp = (String[])vList.get(0);
         vCheck=cfun.getDelimitedList(temp[0],",");
         for(int i=0;i<vCheck.size();i++){
         temp[i]=cfun.Val((String)vCheck.get(i));
        
        }
           %>
            <%if(checkNull(temp[0]).equals("on")){%>
             <SPAN id=AddUser style="VISIBILITY:visible "> 
              <li><a href="addNewuser.jsp" style='text-decoration: none;' target='body'><B >&raquo;&nbsp;AddUser</B></a></li>   
             </SPAN>
             <%}else{%>
             <SPAN id=AddUser style="VISIBILITY:hidden"> 
              <li><a href="addNewuser.jsp" style='text-decoration: none;' target='body'><B >&raquo;&nbsp;AddUser</B></a></li>   
             </SPAN>
             <%}%>
             <%if(checkNull(temp[1]).equals("on")){%>
             <SPAN id=EditUser style="VISIBILITY:visible "> 
               <li><a href="editUser.jsp" style='text-decoration: none;' target='body' ><B >&raquo;&nbsp;EditUser</B></a></li>  
             </SPAN>
             <%}else{%>
             <SPAN id=EditUser style="VISIBILITY:hidden"> 
               <li><a href="editUser.jsp" style='text-decoration: none;' target='body' ><B >&raquo;&nbsp;EditUser</B></a></li> 
             </SPAN>
             <%}%>
             <%if(checkNull(temp[2]).equals("on")){%>
             <SPAN id=ViewUserDetail style="VISIBILITY:visible "> 
               <li><a href="viewUserDetail.jsp" style='text-decoration: none;' target='body' ><B >&raquo;&nbsp;ViewUserDetail</B></a></li>
             </SPAN>
             <%}else{%>
             <SPAN id=ViewUserDetail style="VISIBILITY:hidden"> 
               <li><a href="viewUserDetail.jsp" style='text-decoration: none;' target='body' ><B >&raquo;&nbsp;ViewUserDetail</B></a></li>
             <%}%>
             <%if(checkNull(temp[3]).equals("on")){%>
             <SPAN id=BalanceEnquiry style="VISIBILITY:visible "> 
               <li><a href="balanceEnquiry.jsp" style='text-decoration: none;' target='body' ><B >&raquo;&nbsp;BalanceEnquiry</B></a></li>
             </SPAN>
             <%}else{%>
             <SPAN id=BalanceEnquiry style="VISIBILITY:hidden"> 
               <li><a href="balanceEnquiry.jsp" style='text-decoration: none;' target='body' ><B >&raquo;&nbsp;BalanceEnquiry</B></a></li>
             </SPAN>
             <%}%>
             <%if(checkNull(temp[4]).equals("on")){%>
             <SPAN id=Transfer style="VISIBILITY:visible "> 
               <li><a href="deposit.jsp" style='text-decoration: none;' target='body' ><B >&raquo;&nbsp;Transfer</B></a></li>
             </SPAN>
             <%}else{%>
             <SPAN id=Transfer style="VISIBILITY:hidden"> 
               <li><a href="deposit.jsp" style='text-decoration: none;' target='body' ><B >&raquo;&nbsp;Transfer</B></a></li>
             </SPAN>
             <%}%>
             <%if(checkNull(temp[5]).equals("on")){%>
             <SPAN id=Withdraw style="VISIBILITY:visible "> 
               <li><a href="withdraw.jsp" style='text-decoration: none;' target='body' ><B >&raquo;&nbsp;Withdraw</B></a></li>  
             </SPAN>
             <%}else{%>
             <SPAN id=Withdraw style="VISIBILITY:hidden"> 
               <li><a href="withdraw.jsp" style='text-decoration: none;' target='body' ><B >&raquo;&nbsp;Withdraw</B></a></li> 
             </SPAN>
             <%}%>
             <%if(checkNull(temp[6]).equals("on")){%>
             <SPAN id=MiniStatement style="VISIBILITY:visible "> 
               <li><a href="miniStatement.jsp" style='text-decoration: none;' target='body' ><B >&raquo;&nbsp;MiniStatement</B></a></li>
             </SPAN>
             <%}else{%>
             <SPAN id=MiniStatement style="VISIBILITY:hidden"> 
               <li><a href="miniStatement.jsp" style='text-decoration: none;' target='body' ><B >&raquo;&nbsp;MiniStatement</B></a></li>
             </SPAN>
             <%}%>
             <%if(checkNull(temp[7]).equals("on")){%>
             <SPAN id=ItemizedStatement style="VISIBILITY:visible "> 
               <li><a href="itemizedStatement.jsp" style='text-decoration: none;' target='body' ><B >&raquo;&nbsp;ItemizedStatement</B></a></li> 
             </SPAN>
             <%}else{%>
             <SPAN id=ItemizedStatement style="VISIBILITY:hidden"> 
               <li><a href="itemizedStatement.jsp" style='text-decoration: none;' target='body' ><B >&raquo;&nbsp;ItemizedStatement</B></a></li> 
             </SPAN>
             <%}%>
             <%if(checkNull(temp[8]).equals("on")){%>
             <SPAN id=UserRights style="VISIBILITY:visible "> 
               <li><a href="userRights.jsp" style='text-decoration: none;' target='body' ><B >&raquo;&nbsp;UserRights</B></a></li>  
             </SPAN>
             <%}else{%>
             <SPAN id=UserRights style="VISIBILITY:hidden"> 
               <li><a href="userRights.jsp" style='text-decoration: none;' target='body' ><B >&raquo;&nbsp;UserRights</B></a></li> 
             </SPAN>
             <%}%>
             <%if(checkNull(temp[9]).equals("on")){%>
             <SPAN id=changePassword style="VISIBILITY:visible "> 
               <li><a href="changePassword.jsp" style='text-decoration: none;' target='body' ><B >&raquo;&nbsp;ChangePassword</B></a></li>  
             </SPAN>
             <%}else{%>
             <SPAN id=changePassword style="VISIBILITY:hidden"> 
               <li><a href="changePassword.jsp" style='text-decoration: none;' target='body' ><B >&raquo;&nbsp;ChangePassword</B></a></li> 
             </SPAN>
             <%}%>
              <SPAN id=logout style="VISIBILITY:visible"> 
             <li><a href=logout.jsp style='text-decoration: none;' target='_top'><B>&raquo;&nbsp;LogOff</B></a></li>
             <table>
                 <tr><td><FONT size=3 color=green><b>Last Login-Time</b></font></td></tr>
                 <tr><td><marquee style="font-family:Book Antiqua; color: #FFFFFF"  scrolldelay="800"><FONT size=3 color=green><%=checkNull(temp5[1])%></FONT></marquee></td></tr>
             </table>
             </SPAN>
       </form>
</body>
</html>
