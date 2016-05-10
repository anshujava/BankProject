<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,javax.servlet.*,java.util.Vector,javax.servlet.http.*,generalClass.UserDetail"%>
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
<table>

		

</table>
</body>
</html>
