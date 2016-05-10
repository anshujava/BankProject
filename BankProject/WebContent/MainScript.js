// MainScript.js

//<!--Begin
//Java Script Code for displaying System date as "Monday, May 23, 2005"





function checklength(s,num)
{
   if(num<s.length)
   {
    return false;
   }
   return true;
   
}
function IsFlaot(txtbox)
   //  check for valid numeric strings	
   {
   var strValidChars = "0123456789.";
   var strChar;
   var blnResult = true;
   var strString=txtbox.value;
   if (strString.length == 0) return false;

   //  test strString consists of valid characters listed above
   for (i = 0; i < strString.length && blnResult == true; i++)
      {
      strChar = strString.charAt(i);
      if(i==0 && strChar=='-') continue;
      if (strValidChars.indexOf(strChar) == -1)
         {
         blnResult = false;
         }
      }
   	if(!blnResult){
   		alert("Enter Valid Data");
   		txtbox.select();
   }
}

function IsNumeric(sText)
{
	
   var ValidChars = "0123456789.";
   var IsNumber=true;
   var Char;

 
   for (i = 0; i < sText.length && IsNumber == true; i++) 
      { 
      Char = sText.charAt(i); 
         if (ValidChars.indexOf(Char) == -1) 
         {
           IsNumber = false;
         }
      }
     
   return IsNumber;
   
   }





function isInteger(s)
{
	var i;
    for (i = 0; i < s.length; i++)
    {   
        var c = s.charAt(i);
        if (((c < "0") || (c > "9"))) return false;
    }
    return true;
}

function stripCharsInBag(s, bag)
{
	var i;
    var returnString = "";
    for (i = 0; i < s.length; i++)
    {   
        var c = s.charAt(i);
        if (bag.indexOf(c) == -1) returnString += c;
    }
    //alert (returnSring)
    return returnString;
}

function daysInFebruary (year)
{
	return (((year % 4 == 0) && ( (!(year % 100 == 0)) || (year % 400 == 0))) ? 29 : 28 );
}
function DaysArray(n) 
{
	for (var i = 1; i <= n; i++) 
	{
		this[i] = 31
		if (i==4 || i==6 || i==9 || i==11) 
		{
		this[i] = 30
		}
		if (i==2) 
		{
		this[i] = 29
		}
   } 
   return this
}

function isDate(dtStr)

   {
    var dtCh= "-";
    var minYear=1900;
    var maxYear=2100;
   
	var daysInMonth = DaysArray(12)
	var pos1=dtStr.indexOf(dtCh)
	var pos2=dtStr.indexOf(dtCh,pos1+1)
	var strDay=dtStr.substring(0,pos1)
	var strMonth=dtStr.substring(pos1+1,pos2)
	var strYear=dtStr.substring(pos2+1)
	strYr=strYear
	//alert("day "+ strDay+", Mon "+strMonth+", Year "+strYear)
	if (strDay.charAt(0)=="0" && strDay.length>1) strDay=strDay.substring(1)
	if (strMonth.charAt(0)=="0" && strMonth.length>1) strMonth=strMonth.substring(1)
	for (var i = 1; i <= 3; i++) 
	{
		if (strYr.charAt(0)=="0" && strYr.length>1) strYr=strYr.substring(1)
	}
	
	day=parseInt(strDay)
	month=parseInt(strMonth)
	year=parseInt(strYr)
	
	if (pos1==-1 || pos2==-1)
	{
		alert("The date format should be :dd-mon-yyyy");
		return false;
	}
	
	if (strDay.length<1 || day<1 || day>31 || (strMonth==2 && day>daysInFebruary(year)) || day > daysInMonth[strMonth])
	{
		alert("Please enter a valid day");
		return false;
	}
	var monName="";
	monName="JanFebMarAprMayJunJulAugSepOctNovDecjanfebmaraprmayjunjulaugsepoctnovdecJANFEBMARAPRMAYJUNJULAUGSEPOCTNOVDEC";
	//alert(monName.indexOf(strMonth));
	//alert(strMonth);
	if((monName.indexOf(strMonth)<0)||(strMonth.length!=3))
	//if((strMonth!="Jan") && (strMonth!="Feb") && (strMonth!="Mar") && (strMonth!="Apr") && (strMonth!="May") && (strMonth!="Jun") && (strMonth!="Jul") && (strMonth!="Aug") && (strMonth!="Sep") && (strMonth!="Oct") && (strMonth!="Nov") && (strMonth!="Dec"))
	//if((strMonth!="Jan") || (strMonth!="Feb") || (strMonth!="Mar") || (strMonth!="Apr") || (strMonth!="May") || (strMonth!="Jun") || (strMonth!="Jul") || (strMonth!="Aug") || (strMonth!="Sep") || (strMonth!="Oct") || (strMonth!="Nov") || (strMonth!="Dec"))
	//if (strMonth.length<1 || month<1 || month>12)
	{
		alert("Please enter A valid month");
		return false;
	}
	
	
	if (strYear.length != 4 || year==0 || year<minYear || year>maxYear)
	{
		//alert(strYear) 
		alert("Please enter a valid 4 digit year between "+minYear+" and "+maxYear);
		return false;
	}
	//alert(stripCharsInBag(dtStr, dtCh))
	if (dtStr.indexOf(dtCh,pos2+1)!=-1 && isInteger(stripCharsInBag(dtStr, dtCh))==false)
	{
		alert("Please enter a valid date");
		return false;
    }
    
    return true;
}











function fourdigits(number){
	return (number < 1000) ? number + 1900 : number;
}
function toDayLong() {
	var X_now = new Date();
	var X_days = new Array('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday');
	var X_months = new Array('January','February','March','April','May','June','July','August','September','October','November','December');
	var X_date = ((X_now.getDate()<10) ? "0" : "")+ X_now.getDate();
	X_today =  X_days[X_now.getDay()] + ", " +
	              X_months[X_now.getMonth()] + " " +
	               X_date + ", " +
	                (fourdigits(X_now.getYear())) ;

	return "Date"+X_today;
}

//Java Script Code for validation of AlphaNumeric's:

function alphanumerikcheck(formname,alphanumtext,alpanumesg)
	{
			//alert("formname   "+formname);
			// alert("fieldstring1   "+fieldstring1);
			//alert("fieldstring2   "+fieldstring2);
	var msg1 = "";

	if (eval("document."+formname+"."+alphanumtext+".value.length")== 0)
	{
		//alert(" Enter "+alpanumesg);
		msg1 = msg1 + "enter  " + alpanumesg + "\n";
		eval("document."+formname+"."+alphanumtext+".focus()");
		return msg1;
	}

	if (eval("document."+formname+"."+alphanumtext+".value")== "")
	{
		//alert("Blank spaces are not allowed in"+alphmsg);
		//alert(" Enter "+alpanumesg);
		msg1 = msg1 + "enter  " + alpanumesg+ "\n";
		eval("document."+formname+"."+alpanumesg+".focus()");
		return msg1;
	}

	if(eval("document."+formname+"."+alphanumtext+".value")!="")
	{
		var checkOK6 = "abcdefghijklmnopqrstuvwxyz1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ .,-_/()#\t\r\n\f";
		var checkStr6 = eval("document."+formname+"."+alphanumtext+".value");
		var ckspclchar=0;
		fsblnk=0;
		fschar="";
	
		for (fsblnk = 0;  fsblnk < checkStr6.length;  fsblnk++)
		{
			fschar=checkStr6.charAt(0);
		}			 
	
		if(fschar==" ")
		{
			msg1 = msg1 + "First Character should not be a space in  "+alpanumesg;
			eval("document."+formname+"."+alphanumtext+".focus()");
			return msg1;		
		}

		fschar="";
				
    	var allValid6 = true;
		var cnt6 = 0;
		var flag6 = 0;
		var totalLen6 = eval("document."+formname+"."+alphanumtext+".value.length");

		var spsalpha=0;
		var overallspacecheckalncheck="";
		for(totsspacealpha=0;totsspacealpha<=totalLen6;totsspacealpha++)
		{
			//if(checkStr6[totsspacealpha]==' ')
			overallspacecheckalncheck=checkStr6.charAt(totsspacealpha);
			if(overallspacecheckalncheck==' ')
			{
				spsalpha=spsalpha+1;
			//alert(spsalpha+" spsalpha");	
			}
		}
		
		//alert(spsalpha+" spsalpha");
		if(parseInt(totalLen6)==parseInt(spsalpha))
		{
		//alert("Enter " +alpanumesg);
			msg1 = msg1 + "enter  " + alpanumesg+ "\n";
			eval("document."+formname+"."+alphanumtext+".focus()");
		return msg1;
		}

		for (mab = 0;  mab < checkStr6.length;  mab++)
		{
			chalph = checkStr6.charAt(mab);
			for (nab = 0;  nab < checkOK6.length;  nab++)
				if (chalph == checkOK6.charAt(nab))
					break;
		    if (nab == checkOK6.length)
			{
			   allValid6 = false;
			   break;
			}
		
		   /*
		if(chalph == '.')
			{
				cnt6= cnt6+1;
			}
					 
		if((chalph=='.' && mab == totalLen6-1)) // || (ch=='.' && mab == 0)) 'for initial dot
			{
		    	flag6 = 1;
			}*/
		}//end of for statement
				 
		if (cnt6 > 1 || flag6 == 1 || !allValid6 )
		{
		  //alert(" Enter only alphanumeric characters in "+alpanumesg);
		  
			msg1 = msg1 + " Enter only alphanumeric characters in " + alpanumesg+ "\n";
			eval("document."+formname+"."+alphanumtext+".focus()");
			return msg1;
		}else{return(0);}
	}
}


//Java Script Code for validation of AlphaNumeric's with special charecters:
function alphaNumericCheckWithSplChar(formName,fieldName,displayName,nullCheck)
{  
	var msg3;
	msg3 ="";	
			
	var checkOK6 = "abcdefghijklmnopqrstuvwxyz1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ,-(.)#' ";
	var pincode = eval("document."+formName+"."+fieldName+".value");
	var checkStr6 = pincode;
	
	var ckspclchar=0;
	fsblnk=0;
	fschar="";
	if (nullCheck == 'y')
	{
		if (pincode == "" || pincode == null)
		{
			msg3 = msg3 + " Enter "+displayName+"."+"\n";
			eval("document."+formName+"."+fieldName+".focus()");
			return msg3;
		}
	}
	for (fsblnk = 0;  fsblnk < checkStr6.length;  fsblnk++)
	{
		fschar=checkStr6.charAt(0);
	}			 
	if(fschar==" ")
	{
		msg3 = msg3 + " Space not allowed in "+displayName+"\n";
		eval("document."+formName+"."+fieldName+".focus()");
		return msg3;		
	}
	
	var allValid6 = true;
	var cnt6 = 0;
	var flag6 = 0;
	var totalLen6 = pincode.length;
	for (mab = 0;  mab < checkStr6.length;  mab++)
	{
		chalph = checkStr6.charAt(mab);
		for (nab = 0;  nab < checkOK6.length;  nab++)
			if (chalph == checkOK6.charAt(nab))
				break;
		if (nab == checkOK6.length)
		{
		   allValid6 = false;
		   break;
		}
	}//end of for statement
	if (!allValid6)
	{
	  msg3 = msg3 + "Please enter only alphanumeric characters in " + displayName+"."+"\n";
	  eval("document."+formName+"."+fieldName+".focus()");
	  return msg3;
	}

	return msg3;
	
}

//Java Script Code for Phone Fax validations:
function Phone_fax_Validations(form_name,txt_phone,phnmesg)
{
	var msg4 = "";
	if(eval("document."+form_name+"."+txt_phone+".value")=="")
	{
		msg4 = msg4 + " Enter " +phnmesg+"\n";
		eval("document."+form_name+"."+txt_phone+".focus()");
		return msg4;
	}

	if (eval("document."+form_name+"."+txt_phone+".value.length") > 20)
	{
		msg4 = msg4 + "Digits in "+phnmesg+" should be greater than 5 or less than 21 digits"+"\n";
		eval("document."+form_name+"."+txt_phone+".focus()");
		return msg4;
	}

	if (eval("document."+form_name+"."+txt_phone+".value.length") < 6)
	{
		msg4 = msg4 + phnmesg+" should not be less than six digits and greater than 20 digits"+"\n";
		eval("document."+form_name+"."+txt_phone+".focus()");
		return msg4;
	}

	var checkOKtel = "()0123456789.- \t\r\n\f";
	var checkStrtel = eval("document."+form_name+"."+txt_phone+".value");
	var allValid = true;
	//var cnt = 0;
	//var flag = 0;
	var totalLen = eval("document."+form_name+"."+txt_phone+".value.length");
	var sps=0;
	var spacingphonecheck="";
	for(totsspace=0;totsspace<=totalLen;totsspace++)
	{
		//if(checkStrtel[totsspace]==' ')
		spacingphonecheck=checkStrtel.charAt(totsspace);

		if(spacingphonecheck==' ')
		{
		sps=sps+1;
		}
	}
		
	if(parseInt(totalLen)==parseInt(sps))
	{
		msg4 = msg4 + " Enter " +phnmesg+"\n";
		eval("document."+form_name+"."+txt_phone+".focus()");
		return msg4;
	}
	
	var ltrms=0;
	var afterphonecheck="";
	for(ltrm=0;ltrm<=totalLen;ltrm++)
	{
		//if(checkStrtel[ltrm]==' ')
		afterphonecheck=checkStrtel.charAt(ltrm);
		if(afterphonecheck==' ')
		{
		ltrms=ltrms+1;
		}
		else
		{
		break;
		}
	}

		//alert(ltrms+"ltrms is spaces");
	var ltcheck=0;		
	for (itel = ltrms;  itel < checkStrtel.length;  itel++)
	{
		ltcheck=ltcheck+1;
	
	}

	if(parseInt(ltcheck)<6)
		{
		msg4 = msg4 + phnmesg+" should be greater than five digits and less than 21 digits"+"\n";
		eval("document."+form_name+"."+txt_phone+".focus()");
		return msg4;
	}

	for (itel = 0;  itel < checkStrtel.length;  itel++)
	{
		var chtel = checkStrtel.charAt(itel);
		for (jtel = 0;  jtel < checkOKtel.length;  jtel++)
			if (chtel == checkOKtel.charAt(jtel))
				break;
		if (jtel == checkOKtel.length)
		{
			allValid = false;
			break;
		}

   		if(chtel == '.')
		{
			cnt	= cnt+1;
		}
	
		 /*
		if((ch=='.' && itel == totalLen-1)) // || (ch=='.' && itel == 0)) 'for initial dot
		{
		flag = 1;
		}*/
	
	}//end of for statement
		
		/*
		//if (cnt > 1 || flag == 1 || !allValid )
		*/

	if ( !allValid )
	{
		//alert("Please enter a valid " +phnmesg+ " , only characters with '('  , ')'  ,  '-'  and numerals alone can be entered in "+phnmesg);
		msg4 = msg4 + " Enter a valid " +phnmesg+ " , only characters with '('  , ')'  ,  '-'  and numerics alone can be entered in "+phnmesg+"\n";
		eval("document."+form_name+"."+txt_phone+".focus()");
		return msg4;
	}else{return(0);} 

   return msg4;
}

//Java Script Code for validation of TextArea:
function TextAreaRequired(txA) {
	var length = eval(txA.value.length);
	if (length == 0) {
		var msg3 =  "You must enter some comments.! ";
		return msg3;
	} else{return(0)}
}

//Form Validation:
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
	if(cntl.selectedIndex<=0)
	{
		alert("Select "+msg);
		cntl.focus();	
		return false;
	}
}

function formAction(frmObj,actUrl)
{
	frmObj.action=actUrl;
	frmObj.submit();
}

function frmAction(ss)
{
	document.frm.action=ss;
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

function initText(control,value) {

// Initialize a text field
	if(value!="null")
		control.value = value;
}

function initTextArea(control,value) {
// Initialize a text area field
	if(value!="null")
		control.value = value;
}

function initCheckBox(control,value) {
// Initialize a check box
	control.checked = (value =="1"); 
}

function initRadio(control,value) {
// Initialize a radio button
	for (var i = 0; i < control.length; i++) { 
		if (control[i].value == value) {
			control[i].checked = true;
			break;
		}
	}
}

function initSelect(control,value) {
// Initialize a selection list (single valued)
	if (value == "") return;
	for (var i = 0; i < control.length; i++) {
		if (control.options[i].value == value) {
			control.options[i].selected = true;
			break;
		}
	}
}

function initSelectMulti(control,value) {
// Initialize a selection list (multi valued)
	if (value == "") return;
	var a = value.split(","); // make array
	for (var i = 0; i < a.length; i++) {
		for (var j = 0; j < control.length; j++) {
			if (control.options[j].value == a[i]) {
				control.options[j].selected = true;
				break;
			}
		}
	}
}

function lTrim(arg) {
  while (1) {
    if (arg.substring(0, 1) != " ")
      break;
    arg = arg.substring(1, arg.length);
  }
  return arg;
}

function initCheckBoxMulti(control,value) {
// Initialize a list of check boxes
	if (value == "") return;
	var a = value.split(","); // make array
	for (var i = 0; i < a.length; i++) {
		if (typeof(control.length) == "undefined") {
			if (control.value == a[i]) {
				control.checked = true;
				return;
			}
		}
		for (var j = 0; j < control.length; j++) {
			if (control[j].value == a[i]) {
				control[j].checked = true;
				break;
			}
		}
	}
}
function emailcheck(str) {

var at="@"
var dot="."
var lat=str.indexOf(at)
var lstr=str.length
var ldot=str.indexOf(dot)
if (str.indexOf(at)==-1){
alert("Invalid E-mail ID")
return false
}

if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
alert("Invalid E-mail ID")
return false
}

if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
alert("Invalid E-mail ID")
return false
}

if (str.indexOf(at,(lat+1))!=-1){
alert("Invalid E-mail ID")
return false
}

if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
alert("Invalid E-mail ID")
return false
}

if (str.indexOf(dot,(lat+2))==-1){
alert("Invalid E-mail ID")
return false
}

if (str.indexOf(" ")!=-1){
alert("Invalid E-mail ID")
return false
}
//alert("valid E-mail ID")
return true 
}

function ValidateEmail(){
var emailID=document.frm.txtEmail

if ((emailID.value==null)||(emailID.value=="")){
alert("Please Enter your Email Address")
emailID.focus()
return false
}
if (emailcheck(emailID.value)==false){
emailID.value=""
emailID.focus()
return false
}
return true
}
function datecompare(dtStr1,dtStr2)
{
	var dtCh= "-";
	//var X_months = new Array('January','February','March','April','May','June','July','August','September','October','November','December');
	var X_months = new Array('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec');
	var pos1=dtStr1.indexOf(dtCh);
	
	var pos2=dtStr1.indexOf(dtCh,pos1+1);
	
    var strDay1=dtStr1.substring(0,pos1);
    
	var strMonth1=dtStr1.substring(pos1+1,pos2);
	
	var strYear1=dtStr1.substring(pos2+1);
	
    var day1=parseInt(strDay1);
    
     //alert(day1);
	var monthNum1;
	for(var i=1;i<=12;i++)
	{
		if(strMonth1==X_months[i])
		{
			monthNum1=i;
			//alert(monthNum1);
		}
	}

	var year1=parseInt(strYear1)
	var pos11=dtStr2.indexOf(dtCh);
	var pos22=dtStr2.indexOf(dtCh,pos11+1);
    var strDay2=dtStr2.substring(0,pos11);
	var strMonth2=dtStr2.substring(pos11+1,pos22);
	var strYear2=dtStr2.substring(pos22+1);
    var day2=parseInt(strDay2);
   //alert(day2);
	var monthNum2;
	for(var j=1;j<=12;j++)
	{
		if(strMonth2==X_months[j])
		{

          monthNum2=j;
         //alert(monthNum2);
		}
	}
	var year2=parseInt(strYear2)
	//alert(year1)
	//alert(year2)

   if(year1<year2)
	{
	   return true;
	   exit;
    }
   if(year1>year2)
	{
	   return false;
	   exit;
	}
	if(year1==year2)
	{
       //alert(monthNum1);
	   //alert(monthNum2);
	   if(monthNum1<monthNum2)
		{
		   return true;
		   exit;
		}
		if(monthNum1>monthNum2)
		{
			return false;
			exit;
		}
		if(monthNum1==monthNum2)
		{
           //alert(day1);
		  // alert(day2);
		   if(day1<=day2)
			{
			   return true;
			   exit;
			}
			else
			{
			 return false;
			}
		}
	}
	
}








// End -->