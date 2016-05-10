// validateJS.js

function checkNull(cntl)
 {
 	if((document.getElementById(cntl).value)=="")
 	{	document.getElementById(cntl).focus();
 		return false;
 	}
 }
function closeWindow()
 {
 	window.close();
 }
