<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="commonFunction.*,java.sql.*,javax.servlet.*,java.util.Vector,javax.servlet.http.*,generalClass.UserDetail,java.sql.Blob,javax.servlet.ServletOutputStream,java.sql.*,java.io.*"%>
<html>
<head>
<title>newViewImage</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Software Architect">

<SCRIPT type="text/javascript">


var _sstmrID = null;

var _sstmrON = false;

var _sspos   = 80;

function _ScrollStatus(msg, delay)
{
  if (_sstmrON)
  {
    window.clearTimeout(_sstmrID);
    _sstmrON = false;
  }

  var statmsg = "";

  if (_sspos >= 0)
  {
    for (s = 0; s < _sspos; s++)
    {
      statmsg += " ";
    }

    statmsg += msg;
  }
  else
  {
    statmsg = msg.substring(-_sspos, msg.length);
  }

  window.status = statmsg;

  _sspos = (-_sspos > msg.length) ? 80 : _sspos - 1;

  fname = "_ScrollStatus('" + msg + "', " + delay + ")";
  _sstmrID = window.setTimeout(fname, delay);
  _sstmrON = true;
}



function _StopScrollStatus()
{
  if (_sstmrON)
  {
    window.clearTimeout(_sstmrID);
    window.status = window.defaultStatus;
    _sstmrID = null;
    _sstmrON = false;
  }
}


</SCRIPT>
</head>
<body>
 <form name="frm" method="post" >
<% // declare a connection by using Connection interface Connection connection = null;
String val=request.getQueryString();
//String val="IM00000013";
Connection con = null;

ResultSet rs = null;

PreparedStatement psmnt = null;

InputStream sImage;


Labcon lc = new Labcon();
con = lc.getLocalConnection();
psmnt = con.prepareStatement("SELECT image FROM imagefile1 WHERE imageid = ?");
psmnt.setString(1, val); 
rs = psmnt.executeQuery();
if(rs.next()) {
byte[] bytearray = new byte[1048576];
int size=0;
sImage = rs.getBinaryStream(1);
response.reset();
response.setContentType("image/jpeg");
while((size=sImage.read(bytearray))!= -1 ){
    

%>
<table border="1" width="100">
<tr>
<td width="20" height="20">
<%
response.getOutputStream().
write(bytearray,0,size);
}
}%>
</td>
</tr>
</table>
</form>
</body>
</html>
