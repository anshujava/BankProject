// fileUploading.js

// newFunction

function newFunction() {
}

var maxUploads = 20;
var allowedExtensions = new Array("jpg", "jpeg", "gif", "bmp", "tif", "tiff", "png");

var ie = navigator.appName == "Microsoft Internet Explorer";
var curUploads = 0; //how many files the user is uploading
var divCount = 0; //a counter to give divs new IDs every time
var randSession;

var myWin;
var desc="hi";//=document.getElementById("test").value;
function popUpStatus() {
	//window properties
	var winName = "";
	var width = 400;
	var height = 150;
	var toolbar = 0;
	var location = 0;
	var directories = 0;
	var status = 0;
	var menubar = 0;
	var scrollbars = 0;
	var resizable = 0;
	
	//create the new window
	if(!myWin || myWin.closed){
		//myWin = window.open("", winName, 'width=' + width + ',height=' + height + ',toolbar=' + toolbar + ',location=' + location + ',directories=' + directories + ',status=' + status + ',menubar=' + menubar + ',scrollbars=' + scrollbars + ',resizable=' + resizable + ',top=' + ((screen.height/2)-(height/2)) + ',left=' + ((screen.width/2)-(width/2)));
	}
	else{
		myWin.focus();
	}
}

function fileChange() {
	var fileLoc = document.getElementById("fileInput").value;
	desc=desc+"{"+document.getElementById("desc").value+fileLoc+"}";
	alert(""+desc);
	insertUploadRow(fileLoc);
}

function uploadFiles() 
{
	var chooserNum = 1;
	//alert(desc);
	document.getElementById("test").value=desc;
	for(var i = 0; i < document.getElementById("mainUploadDiv").childNodes.length; i++) 
	{
		if(document.getElementById("mainUploadDiv").childNodes[i].chooser) 
		{
			document.getElementById("mainUploadDiv").childNodes[i].chooser.name = "file" + chooserNum;
			document.getElementById("mainUploadDiv").childNodes[i].chooser.style.visibility = "hidden";
			chooserNum++;
			document.getElementById("uploadForm").appendChild(document.getElementById("mainUploadDiv").childNodes[i].chooser);
		}
	}
	
	//if(chooserNum == 1) //dont upload, nothing was selected
	//	return;
		
	//disable the upload button
	//document.getElementById("uploadFilesButton").disabled = true;
	
	//set the action of the form for a random session id
	randSession = Math.round(Math.random() * Math.pow(10, 10));
	while(randSession > 4294967296)
	 {
		randSession = Math.round(Math.random() * Math.pow(10, 10));
	}
	
	
	document.getElementById("uploadForm").action ="../a28";
	
	//open up status popup unless checkbox is checked
	document.getElementById("noPopup").checked == false
		popUpStatus();
	
	document.getElementById("uploadForm").submit();
}

function uploadFiles1() 
{
	var chooserNum = 1;
	//alert(desc);
	document.getElementById("test").value=desc;
	for(var i = 0; i < document.getElementById("mainUploadDiv").childNodes.length; i++) 
	{
		if(document.getElementById("mainUploadDiv").childNodes[i].chooser) 
		{
			document.getElementById("mainUploadDiv").childNodes[i].chooser.name = "file" + chooserNum;
			//alert("3");
			alert(document.getElementById("mainUploadDiv").childNodes[i].chooser.name = "file" + chooserNum);
			document.getElementById("mainUploadDiv").childNodes[i].chooser.style.visibility = "hidden";
			chooserNum++;
			alert(chooserNum);
			document.getElementById("uploadForm").appendChild(document.getElementById("mainUploadDiv").childNodes[i].chooser);
		}
	}
	
	//if(chooserNum == 1) //dont upload, nothing was selected
	//	return;
		
	//disable the upload button
	//document.getElementById("uploadFilesButton").disabled = true;
	
	//set the action of the form for a random session id
	randSession = Math.round(Math.random() * Math.pow(10, 10));
	while(randSession > 4294967296)
	 {
		randSession = Math.round(Math.random() * Math.pow(10, 10));
		alert("randSession  "+randSession);
	}
	
	
	document.getElementById("uploadForm").action ="mystore";
	
	//open up status popup unless checkbox is checked
	document.getElementById("noPopup").checked == false
		popUpStatus();
	
	document.getElementById("uploadForm").submit();
}
function uploadFiles2() 
{   	//alert("p111");
	var chooserNum = 1;
	//alert(desc);
	document.getElementById("test").value=desc;
	for(var i = 0; i < document.getElementById("mainUploadDiv").childNodes.length; i++) 
	{
		if(document.getElementById("mainUploadDiv").childNodes[i].chooser) 
		{
			document.getElementById("mainUploadDiv").childNodes[i].chooser.name = "file" + chooserNum;
			document.getElementById("mainUploadDiv").childNodes[i].chooser.style.visibility = "hidden";
			chooserNum++;
			document.getElementById("uploadForm").appendChild(document.getElementById("mainUploadDiv").childNodes[i].chooser);
		}
	}
	
	//if(chooserNum == 1) //dont upload, nothing was selected
	//	return;
		
	//disable the upload button
	//document.getElementById("uploadFilesButton").disabled = true;
	
	//set the action of the form for a random session id
	randSession = Math.round(Math.random() * Math.pow(10, 10));
	while(randSession > 4294967296)
	 {
		randSession = Math.round(Math.random() * Math.pow(10, 10));
	}
	
	document.getElementById("uploadForm").action ="mystore";
	
//	if(document.getElementById("uploadForm").action ==""){
//	window.parent.returnValue=document.getElementById("uploadForm").value; 
////			window.parent.close();
//	}
	//open up status popup unless checkbox is checked
	document.getElementById("noPopup").checked == false
		popUpStatus();
	
	document.getElementById("uploadForm").submit();

	//checkAnal();

}


function isDuplicate(path) {
	for(var i = 0; i < document.getElementById("mainUploadDiv").childNodes.length; i++) {
		if(document.getElementById("mainUploadDiv").childNodes[i].innerHTML == path) {
			return true;
		}
	}
	
	return false;
}

function isExtensionAllowed(path) {
	var lastDot = path.lastIndexOf("."); //index of last dot, the extension will follow this dot
	if(lastDot != 1) { //if we found a dot, that means we have an extension
		var fileExtension = path.substring(lastDot + 1, path.length).toLowerCase();
		//loop through array of allowed extensions and check if this one is allowed
		for(var i = 0; i < allowedExtensions.length; i++) {
			if(fileExtension == allowedExtensions[i]) //if the extension is in the list of allowed
				return true;
		}
	}
	
	return false;
}

function insertUploadRow(path) {
	//clear chooser
	var oldChooser = document.getElementById("fileInput");
	document.getElementById("chooserSpan").innerHTML = "<input type=\"file\" id=\"fileInput\" name=\"fileInput\" onChange=\"javascript:fileChange();\">";

	if(isDuplicate(path)) { //check if user already selected the file
		alert("You are already uploading this file.");
		return;
	}
	
	/*if(!isExtensionAllowed(path)) {
		////alert("Sorry, you can only upload files that are jpg, jpeg, gif, bmp, tif, tiff or png.");
		return;
	}*/

	curUploads++;
	divCount++;
	//create the path div
	var newPathDiv = document.createElement("span");
	newPathDiv.className = "uploadPathDiv";
	newPathDiv.style.width = ie ? "450px" : "500px";
	newPathDiv.style.height = ie ? "50px" : "30px";
	newPathDiv.style.whiteSpace = "pre";
	newPathDiv.verticalAlign = "middle";
	newPathDiv.align = "center";
	newPathDiv.id = "pathDiv" + divCount;
	newPathDiv.innerHTML = path;
	newPathDiv.chooser = oldChooser;
	//create the preview div
	var newPreviewDiv;
	var newWidth;
	var newHeight;
	if(ie) {
		newPreviewDiv = document.createElement("span");
		newPreviewDiv.style.width = "50px";
		newPreviewDiv.style.height = ie ? "50px" : "20px";
		newPreviewDiv.className = "uploadPathDiv";
		newPreviewDiv.id = "previewDiv" + divCount;
		newPreviewDiv.align = "center";
		
		//figure out preview image dimensions
		var tempimg = new Image();
		tempimg.src = "file://" + path;
		var horRatio = 48 / tempimg.width;
		var vertRatio = 48 / tempimg.height;
		var newRatio = Math.min(horRatio, vertRatio);
		if(newRatio > 1) newRatio = 1;
		newWidth = tempimg.width * newRatio;
		newHeight = tempimg.height * newRatio;
		newWidth = Math.round(newWidth);
		newHeight = Math.round(newHeight);
		tempimg = null;
		//tempimg.style.height = newHeight;
		//tempimg.style.width = newWidth;
		//newPreviewDiv.appendChild(img);
		//newPreviewDiv.innerHTML = "<img src='file://" + path + "' width='" + newWidth + "' height='" + newHeight + "'>";
		//var IEFix = newPreviewDiv.innerHTML;
		
		//add image to preview div
		var newImg = document.createElement("img");
		newPreviewDiv.appendChild(newImg);
		newImg.src = "file:///" + path;
		newImg.width = newWidth;
		newImg.height = newHeight;
	}
	
	//create the delete div
	var newDeleteDiv = document.createElement("span");
	newDeleteDiv.className = "uploadPathDiv";
	newDeleteDiv.id = "deleteDiv" + divCount;
	newDeleteDiv.style.width = "100px";
	newDeleteDiv.align = "center";
	//create delete button
	var newDeleteButton = document.createElement("input");
	newDeleteButton.type = "button";
	newDeleteButton.rowNum = divCount;
	newDeleteButton.value = "Remove";
	newDeleteButton.onclick = removeUploadRow;
	//add delete button
	newDeleteDiv.appendChild(newDeleteButton);
	

	
	//add the divs to the page
	//document.getElementById("mainUploadDiv").appendChild(newPathDiv);
	//if(ie) document.getElementById("mainUploadDiv").appendChild(newPreviewDiv);
	//document.getElementById("mainUploadDiv").appendChild(newDeleteDiv);
	document.getElementById("mainUploadDiv").insertBefore(newDeleteDiv, document.getElementById("uploadPathTitleDiv"));
	if(ie) document.getElementById("mainUploadDiv").insertBefore(newPreviewDiv, document.getElementById("uploadPathTitleDiv"));
	document.getElementById("mainUploadDiv").insertBefore(newPathDiv, document.getElementById("uploadPathTitleDiv"));
	oldPathTitle = document.getElementById("mainUploadDiv").removeChild(document.getElementById("uploadPathTitleDiv"));
	document.getElementById("mainUploadDiv").insertBefore(oldPathTitle, newDeleteDiv);
	window.status = "Done";
	//document.getElementById("temp").innerHTML += "refreshing";
	////alert("bad server! stop crashing!");
	//disable chooser if needed
	if(curUploads == maxUploads) { //if we've reached max uploads, disable the file chooser
		document.getElementById("fileInput").disabled = true;
	}
}

function removeUploadRow(e) {
	var selObj = ie ? event.srcElement : e.target;
	var rowNum = selObj.rowNum;
	//remove the 3 divs from the row
	var test=document.getElementById("pathDiv"+rowNum).innerHTML;
	//alert(test);
	document.getElementById("mainUploadDiv").removeChild(document.getElementById("pathDiv"+rowNum));
	if(ie) document.getElementById("mainUploadDiv").removeChild(document.getElementById("previewDiv"+rowNum));
	document.getElementById("mainUploadDiv").removeChild(document.getElementById("deleteDiv"+rowNum));
	curUploads--;
	
	if(curUploads == maxUploads - 1) { //that means we had the maximum and deleted one
		document.getElementById("fileInput").disabled = false;
	}
}

function fileUpload() {
	//if ie, add preview functionality
	if(ie) {
	//alert("yyy");
		document.getElementById("uploadPathTitleDiv").style.width = "450px";
		document.getElementById("uploadPreviewTitleDiv").style.width = "50px";
	}
}