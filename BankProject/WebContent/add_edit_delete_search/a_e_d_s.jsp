<% //add edit delete search in a single page%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="./error.jsp" import="java.util.*,java.sql.*,bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
BODY
{

	BACKGROUND-COLOR: #efefef;
	
}



INPUT
{
    BACKGROUND-COLOR: #ffffff;
    FONT-FAMILY: Century
}


THEAD
{
	BACKGROUND-COLOR: #006699;
	font-weight: bold;
	color: white;
	font-size: 18;
	font-family:'Century';
	border: none;
}


TABLE
{
	
	BACKGROUND-COLOR:#efefef;
    border-color: black;
    border-left-color:black;
    border-right-color:black;
    border-top-color:black;
    border-bottom-color:black; 
}

BUTTON
{
	BACKGROUND-COLOR:lightgray;
    border-width: medium;
	border-style: outset;
                
}

TD
{
	border: none;
	border-style: none;
}

TR
{
	border: none;
	border-style: none;
}

A
{
	color: blue;
}
</style>
<SCRIPT LANGUAGE=javascript>

function add()
{   var f=document.frm;
    f.action='a_e_d_s.jsp?fn=add';
    f.submit();
 }
function on_update(id){
	var f=document.frm;
    f.action='a_e_d_s.jsp?fn=update&id='+id;
    f.submit();
 }
function on_search(){
	var f=document.frm;
	var search = f.txtSearch.value;
    f.action='a_e_d_s.jsp?fn=search&search='+search;
    f.submit();
 }

function on_cancel(){
  
    document.frm.bookName.value="";
    document.frm.bookAuthor.value="";
}
</SCRIPT>
<title>ADD-EDIT-DELETE-SEARCH</title>
</head>
<body >
<form name=frm method="post" >
 <%   String Querystr = request.getQueryString();
      System.out.println("queryString="+Querystr);
       System.out.println("search="+request.getParameter("txtSearch"));%> 
    <% 
    if((Querystr!=null)){%> 
    <% 
    if(request.getParameter("fn").equals("ShowList")){%> 
    <TABLE border =1>
        <THEAD>
        <tr >
                <td colspan="16" align="left" ><font size="3">View Details</font></td>
                
        </tr>
    </THEAD>
                <TBODY>
      <tr bgcolor="#d6d6d6" align="left">
      <td><INPUT id=txtSearch  name=txtSearch size="24" value =""></td>
      <td><BUTTON type=button  value=search name=cmdsearch onclick="on_search()" >Search</BUTTON>&nbsp;&nbsp; </td>
      </tr>      
                
        <TR bgcolor="#d6d6d6" align="left">
         			<TD nowrap><FONT size=3 ><B>SL No</B></FONT></TD>                    
                    <TD nowrap><FONT size=3 ><B>BookId</B></FONT></TD>
                    <TD nowrap><FONT size=3 ><B>Book Name</B></FONT></TD>
                    <TD nowrap><FONT size=3 ><B>Book Author Name</B></FONT></TD>
                    <TD nowrap><FONT size=3 ><B><A HREF="a_e_d_s.jsp?fn=add">Add </A></B></FONT></TD>
                    
                </tr>
                <%! 
                private String checkNull(String value) {
                if(value=="null" || value==null)
                {return "";}
                return value;
                }
                
           	    public Connection getLocalConnection()
	           	 {
           	    	Connection con = null;
	           	       try
	           	        {
	           	        	Class.forName("com.mysql.jdbc.Driver");
	           	    		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	           	         
	           	        }
	           	        catch (ClassNotFoundException e)
	           	        {
	           	            System.err.println("ClassNotFoundException in getConnection, " + e.getMessage());
	
	           	        }
	           	        catch (SQLException e)
	           	        {
	           	            System.err.println("SQLException in getConnection, " + e.getMessage());
	           	        }
	           	        return con;
	           	    }
                %>
               
                 <%   
                 	Connection con1 = null;
      				con1 =getLocalConnection();
      				ResultSet rs = null;
        		    Statement stmt = null;
      				stmt = con1.createStatement();
                	Vector vReq=new Vector();
         		     
		         		try {
		         			
		         			String strSql = "select BookId,BookName,BookAuthor from bookdetail order by BookId desc";
		         			rs = stmt.executeQuery(strSql);
		
		         			while (rs.next()) {
		         				String temp[] = new String[3];
		         				temp[0] = rs.getString("BookId");
		         				temp[1] = rs.getString("BookName");
		         				temp[2] = rs.getString("BookAuthor");
		         				vReq.add(temp);
		         			}
		
		         		} catch (Exception e) {
		         			System.err.print("allBookDetailList Exception : " + e.getMessage());
		         		} 
                     
                     for(int i=0;i<vReq.size();i++)
                     {
                     String temp[]=new String[3];
                     temp = (String[])vReq.get(i);
                     
                         %>	
                    <TR bgcolor="#d6d6d6" align="left">
                     <TD nowrap><%=i+1%></TD>
                    <TD nowrap><%=checkNull(temp[0])%></TD>
                    <TD nowrap><%=checkNull(temp[1])%></TD>
                    <TD nowrap><%=checkNull(temp[2])%></TD>
                    <td><A HREF= "a_e_d_s.jsp?fn=edit&id=<%=temp[0]%>">Edit </A> </td>
                     <td><A HREF= "a_e_d_s.jsp?fn=delete&id=<%=temp[0]%>">Delete </A> </td>
                     <%  }%>	
                </TR>
                </TBODY>
    </table>
    <%}else if(request.getParameter("fn").equals("add")){ 
    	
    %>
   
    <TABLE border =1>  <THEAD>
        <tr >
                <td colspan="16" align="left" ><font size="3">Add Book Details</font></td>
                
        </tr>
    </THEAD>
<%

String bookName=request.getParameter("bookName");
String bookAuthor=request.getParameter("bookAuthor");


if((request.getParameter("bookName")!=null)&&(request.getParameter("bookName").trim().length()>0)){
try {
	Connection con = null;
	con = getLocalConnection();
	PreparedStatement pre = con.prepareStatement("insert into bookdetail (BookName,BookAuthor) values(?,?)");
	pre.setString(1,bookName);
	pre.setString(2,bookAuthor);
	pre.executeUpdate();
	
	} catch (Exception e) {
		System.err.println("In InsertBookDetailTable Exception "+ e);
	}
	String L_url1=response.encodeRedirectURL("./a_e_d_s.jsp?fn=ShowList");
	response.sendRedirect(L_url1);
}
%>

 <tr bgcolor="#d6d6d6" align="left">
 <td>Book Name: </td>
<td><input type="text" name="bookName" value=""></td>
</tr>
<tr bgcolor="#d6d6d6" align="left">
<td>Book Author: </td>
<td><input type="text" name="bookAuthor" value=""></td>

</tr >
<tr bgcolor="#d6d6d6" align="left"><td></td><td>
<BUTTON type=button  value=save name=cmdsave onclick="add()" >Save</BUTTON>
<BUTTON type="button" value="Cancel" id="button" name="cmdCancel"ONCLICK="on_cancel()">Cancel</BUTTON></td>
<td><a href='./a_e_d_s.jsp?fn=ShowList'>Click here to go to List page</a></td>
</tr>

	
    </TABLE>
  <%  }else if(request.getParameter("fn").equals("edit")){
  %>    
   
    <TABLE border =1>  <THEAD>
        <tr >
                <td colspan="16" align="left" ><font size="3">Edit Book Details</font></td>
                
        </tr>
    </THEAD>
<%
String id=request.getParameter("id");
Vector vReq1=new Vector();
ResultSet rs = null;
Statement stmt = null;
Connection con2 = null;
try {
	con2 = getLocalConnection();
	stmt = con2.createStatement();
	String strSql = "select BookId,BookName,BookAuthor from bookdetail where BookId ='"+id+"'";
	rs = stmt.executeQuery(strSql);

	while (rs.next()) {
		String temp[] = new String[3];
		
		temp[0] = rs.getString("BookId");
		temp[1] = rs.getString("BookName");
		temp[2] = rs.getString("BookAuthor");

		vReq1.add(temp);
	}

} catch (Exception e) {

	System.err.println("getRecord Exception : "	+ e.getMessage());
} 

for(int i=0;i<vReq1.size();i++)
{
String temp1[]=new String[3];
temp1 = (String[])vReq1.get(i);

%>

 <tr bgcolor="#d6d6d6" align="left">
 <td>Book Name: </td>
<td><input type="text" name="bookName" value="<%=temp1[1]%>"></td>
</tr>
<tr bgcolor="#d6d6d6" align="left">
<td>Book Author: </td>
<td><input type="text" name="bookAuthor" value="<%=temp1[2]%>"></td>

</tr>
	<tr bgcolor="#d6d6d6" align="left"><td></td><td>
<BUTTON type=button  value=save name=cmdsave onclick="on_update(<%=temp1[0]%>);" >Save</BUTTON>
<BUTTON type="button" value="Cancel" id="button" name="cmdCancel"ONCLICK="on_cancel()">Cancel</BUTTON></td>
<td><a href='./a_e_d_s.jsp?fn=ShowList'>Click here to go to List page</a></td>
</tr>

    </TABLE>
  <%  }}else if(request.getParameter("fn").equals("update")){
	 
  %>  
  <%

String bookName=request.getParameter("bookName");
String bookAuthor=request.getParameter("bookAuthor");
String id=request.getParameter("id");
try {
	Connection con1 = null;
	Statement stmt = null;
     con1 =getLocalConnection();
	 stmt = con1.createStatement();
	String query = "update bookdetail set BookName='"+bookName+"',BookAuthor='"+bookAuthor+"' where BookId='"+id+"'";
	stmt.executeUpdate(query);
	
	} catch (Exception e) {
		System.err.println("In updateDetailTable Exception "+ e);
	}
%>  
	<table border =1 ><tr bgcolor="#d6d6d6" align="left"><tr><td>updated successfully</td><td><a href='./a_e_d_s.jsp?fn=ShowList'>Click here to go to List page</a> </td></tr></table>
<%}else if(request.getParameter("fn").equals("delete")){
%>
<table border =1><tr bgcolor="#d6d6d6" align="left"><tr><td>Deleted Successfully</td><td><a href='./a_e_d_s.jsp?fn=ShowList'>Click here to go to List page</a> </td></tr></table>
        <%
       
        String id=request.getParameter("id");
        try {
        	Connection con1 = null;
        	Statement stmt = null;
        	
             con1 =getLocalConnection();
        	 stmt = con1.createStatement();
        	 String query = "delete from bookdetail where BookId="+id+"";
    	     stmt.executeUpdate(query);
        	
        	} catch (Exception e) {
        		System.err.println("In deleted Exception "+ e);
        	}  %>  
        	<%}else if(request.getParameter("fn").equals("search")){ %>
        	       <% if((request.getParameter("search")!=null) && !(request.getParameter("search").trim().equalsIgnoreCase(""))){
        	    	   System.out.println("search");
        	    	   %>
        	        
        	<TABLE border =1>
        <THEAD>
        <tr >
                <td colspan="16" align="left" ><font size="3">View Details</font></td>
                
        </tr>
   		 </THEAD>
                <TBODY>
      <tr bgcolor="#d6d6d6" align="left">
      <td><INPUT id=txtSearch  name=txtSearch size="24" value ="<%=checkNull(request.getParameter("txtSearch"))%>"></td>
      <td><BUTTON type=button  value=search name=cmdsearch onclick="on_search()" >Search</BUTTON>&nbsp;&nbsp; </td>
      </tr>      
                
        <TR bgcolor="#d6d6d6" align="left">
         			<TD nowrap><FONT size=3 ><B>SL No</B></FONT></TD>                    
                    <TD nowrap><FONT size=3 ><B>BookId</B></FONT></TD>
                    <TD nowrap><FONT size=3 ><B>Book Name</B></FONT></TD>
                    <TD nowrap><FONT size=3 ><B>Book Author Name</B></FONT></TD>
                    <TD nowrap><FONT size=3 ><B><A HREF="a_e_d_s.jsp?fn=add">Add </A></B></FONT></TD>          
                </tr>
               
                 <%   
                 	Connection con1 = null;
      				con1 =getLocalConnection();
      				ResultSet rs = null;
        		    Statement stmt = null;
      				stmt = con1.createStatement();
                	Vector vReq=new Vector();
         		     
		         		try {
		         			String searchInput = request.getParameter("txtSearch");
		         			String strSql = "select BookId,BookName,BookAuthor from bookdetail where BookName LIKE '"+searchInput+"%' order by BookId desc;";
		         			rs = stmt.executeQuery(strSql);
		
		         			while (rs.next()) {
		         				String temp[] = new String[3];
		         				temp[0] = rs.getString("BookId");
		         				temp[1] = rs.getString("BookName");
		         				temp[2] = rs.getString("BookAuthor");
		         				vReq.add(temp);
		         			}
		
		         		} catch (Exception e) {
		         			System.err.print("allBookDetailList Exception : " + e.getMessage());
		         		} 
                     
                     for(int i=0;i<vReq.size();i++)
                     {
                     String temp[]=new String[3];
                     temp = (String[])vReq.get(i);
                     
                         %>	
                    <TR bgcolor="#d6d6d6" align="left">
                     <TD nowrap><%=i+1%></TD>
                    <TD nowrap><%=checkNull(temp[0])%></TD>
                    <TD nowrap><%=checkNull(temp[1])%></TD>
                    <TD nowrap><%=checkNull(temp[2])%></TD>
                    <td><A HREF= "a_e_d_s.jsp?fn=edit&id=<%=temp[0]%>">Edit </A> </td>
                     <td><A HREF= "a_e_d_s.jsp?fn=delete&id=<%=temp[0]%>">Delete </A> </td>
                     <%  }%>
                     <% }else{
                    	
                    	 response.sendRedirect("./a_e_d_s.jsp?fn=ShowList");
                     }%>
                     
                     <%}else{}%>	
                     
                </TR>
                </TBODY>
    </table>
        	<%}else{ 
        	response.sendRedirect("./a_e_d_s.jsp?fn=ShowList");
        		}%>
    </form>
</body>
</html>