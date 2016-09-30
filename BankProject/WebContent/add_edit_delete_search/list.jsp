<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="commonFunction.*,generalClass.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <SCRIPT LANGUAGE=javascript>
function add()
{
      document.frm.action="add.jsp";
      document.frm.submit();
 }
function editRecord(id){
	
    var f=document.frm;
    f.method="post";
    f.action='edit.jsp?id='+id;
    f.submit();
}
function deleteRecord(id){
	var myid=id;
	var hid="Delete";
    var f=document.frm;
    f.method="post";
    f.action='../bookServlet?myid='+myid+ '&hidval=' + hid;
    f.submit();
}
function search(){
	document.frm.action="list.jsp";
    document.frm.submit();
}
</SCRIPT>
<title>Book List</title>
</head>
 <body>
   <form name=frm method="post" >
    <TABLE border=1 ID="customer" style="background-color: #efefef; WIDTH: 590px; POSITION: absolute; TOP: 50px;">
       <tr><TD>
       <BUTTON type=button  value=save name=cmdsave onclick="add()" >Add</BUTTON>&nbsp;&nbsp; 
      </TD></tr>    
      <tr>
      <td><INPUT id=txtSearch  name=txtSearch size="24" value =""></td>
      <td><BUTTON type=button  value=search name=cmdsearch onclick="search()" >Search</BUTTON>&nbsp;&nbsp; </td>
      </tr>
        <THEAD>
        <tr>
                <td colspan="16" align="left"><font size="3">View Details</font></td>
                
        </tr>
    </THEAD>
                <TBODY>
        <TR bgcolor="#d6d6d6" align="left">
                    
                    <TD nowrap><FONT size=3 color=green><B>SL No</B></FONT></TD>
                    <TD nowrap><FONT size=3 color=green><B>Book Name</B></FONT></TD>
                    <TD nowrap><FONT size=3 color=green><B>Book Author Name</B></FONT></TD>
                   
                    
                </tr>
                <%! 
                private String checkNull(String value) {
                if(value=="null" || value==null)
                {return "";}
                return value;
                }
                %>
               
                 <%   
               
                Vector vReq1=new Vector();
                bookDetail bookdet = new bookDetail();
                String searchInput = request.getParameter("txtSearch");
                vReq1= bookdet.allBookDetailList(searchInput);
                
                for(int i=0;i<vReq1.size();i++)
                {
                String temp1[]=new String[3];
                temp1 = (String[])vReq1.get(i);
               
                    %> 
                 <TR bgcolor="#d6d6d6">
                    <TD nowrap><%=checkNull(temp1[0])%></TD>
                    <TD nowrap><%=checkNull(temp1[1])%></TD>
                    <TD nowrap><%=checkNull(temp1[2])%></TD>
                    <td><input type="button" name="edit" value="Edit" style="background-color:green;font-weight:bold;color:white;" onclick="editRecord(<%=temp1[0]%>);" ></td>
					<td><input type="button" name="delete" value="Delete" style="background-color:red;font-weight:bold;color:white;" onclick="deleteRecord(<%=temp1[0]%>);" ></td>
                   
                    
                </TR>
                 <%}%>
                </TBODY>
    </table>
    </form>
    </body>
</html>