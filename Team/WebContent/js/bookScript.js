//해당 페이지로 이동
function moveTab(n)
{
	nextPrev(n-currentTab);
}

function showTab(n) {
	var x = document.getElementsByClassName("tab");
	
	x[n].style.display = "block";

	//fix the Previous/Next buttons:
	if (n == 0) {
	  document.getElementById("prevBtn").style.display = "none";
	} else {
	  document.getElementById("prevBtn").style.display = "inline";
	}
	if (n == (x.length - 1)) {
	  document.getElementById("nextBtn").innerHTML = "Submit";
	} else {
	  document.getElementById("nextBtn").innerHTML = "Next";
	}
	
	fixStepIndicator(n);
	
	if(n==4)
		confirmForm();
}

function nextPrev(n) {
	var x = document.getElementsByClassName("tab");
	
	//if (n == 1 && !validateForm()) return false;

	// Hide the current tab:
	x[currentTab].style.display = "none";
	 
	currentTab = currentTab + n;
	 
	if (currentTab >= x.length) {
		document.getElementById("book_form").submit();
		return false;
	 }
	 
	 //display the correct tab:
	 showTab(currentTab);
}

function validateForm() {
	var x, y, i, valid = true;
	x = document.getElementsByClassName("tab");
	y = x[currentTab].getElementsByTagName("input");

	for (i = 0; i < y.length; i++) {
		if (y[i].value == "") {
	    	// add an "invalid" class to the field:
	    	y[i].className += " invalid";
	    	valid = false;
	  	}
	}
	return valid;
}

function fixStepIndicator(n) {
	var i, x = document.getElementsByClassName("step2");

	for (i = 0; i < x.length; i++) {
		x[i].className = x[i].className.replace(" active", "");
	}
	x[n].className += " active";
}

//지점선택
function selectLocation(n){
	
	var loc = document.getElementById("location");
	var location = loc.getElementsByClassName("slot");
	
	for(i = 0; i < location.length; i++){
		location[i].style.background = "#d3e0f1";
		location[i].style.color = "#424a52";
	}
	
	location[n].style.background = "#424a52";
	location[n].style.color = "#d3e0f1"
		
	if(n == 0)
		div.getElementsByTagName("input").value = "서울강남점";
	else if(n == 1)
		div.getElementsByTagName("input").value = "부산서면점"; 
}

//show Request Detail input
function showDetail(chk) {
	var detail = document.getElementById("detail");
	if(chk)
		detail.style.display = "inline";
	else
		detail.style.display = "none";
}

//step5
function confirmForm() {
	var table, tr;
	table = document.getElementById("confirm");
	tr = table.getElementsByTagName("tr");

	var newtd = new Array(7);
	var textTd = new Array(7);
	textTd[0] = document.createTextNode(document.bf.location.value);
	textTd[1] = document.createTextNode(document.bf.guest.value);
	textTd[2] = document.createTextNode(document.bf.date.value);
	textTd[3] = document.createTextNode(document.bf.time.value);
	textTd[4] = document.createTextNode(document.bf.tablenum.value);
	if(document.bf.alergy.value == 'true')
		textTd[5] = document.createTextNode("있음");
	else
		textTd[5] = document.createTextNode("없음");
	//textTd[5] = document.createTextNode(document.bf.alergy.value);
	textTd[6] = document.createTextNode(document.bf.request.value);
	
	for(i = 0; i < 7; i++)
	{
		newtd[i] = document.createElement("td"); 
		tr[i].appendChild(newtd[i]);
		newtd[i].appendChild(textTd[i]);
	}
	
}

































