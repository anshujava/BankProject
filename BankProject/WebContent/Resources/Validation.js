// Validation.js

// Validation.js

// newFunction
function addOption(selectObject,optionText) 
{
	var optionObject = new Option(optionText);
 	var optionRank = selectObject.options.length;
 	selectObject.options[optionRank]=optionObject;
}

function deleteOption(selectObject,optionRank) 
	{
 		if (selectObject.options.length!=0) { selectObject.options[optionRank]=null }
	}
function add2List(ctrl,txt,ctrl1)
{
	if(document.getElementById(ctrl).selectedIndex<=-1)
	{
		alert(txt);
		document.getElementById(ctrl).focus();	
	}
	else
	{  addOption(document.getElementById(ctrl1),document.getElementById(ctrl).value);
       document.getElementById(ctrl).selectedIndex =0;
	}
}
function removefromList(ctrl)
{
	if (document.getElementById(ctrl).selectedIndex!=-1) 
    	deleteOption(document.getElementById(ctrl),document.getElementById(ctrl).selectedIndex)
 	else 
	  alert("Select an option and click Remove")
}

function getSelectedRadio(buttonGroup) {
   if (buttonGroup[0]) { 
      for (var i=0; i<buttonGroup.length; i++) {
         if (buttonGroup[i].checked) {
            return i
         }
      }
   } else {
      if (buttonGroup.checked) { return 0; } 
   }
   return -1;
}
function chkDDL(msg,cntl)
{
	if(document.getElementById(cntl).selectedIndex<=0)
	{
		alert("Select "+msg);
		document.getElementById(cntl).focus();	
		return false;
	}
}

function formAction(action)
{
		document.frm.action=action;
		document.frm.submit();
}
function getSelectedRadioValue(buttonGroup) {
   var i = getSelectedRadio(buttonGroup);
   if (i == -1) {
      return "";
   } else {
      if (buttonGroup[i]) { 
         return buttonGroup[i].value;
      } else { 
         return buttonGroup.value;
      }
   }
}