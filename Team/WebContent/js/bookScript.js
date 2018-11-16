
var currentTab = 0; // Current tab is set to be the first tab (0)
showTab(currentTab); // Display the current tab

//해당 페이지로 이동
function moveTab(n)
{
	nextPrev(n-currentTab);
}

function showTab(n) {
	alert("gggg");
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



































