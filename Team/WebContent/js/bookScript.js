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
	
	var div = document.getElementById("location");
	var location = div.getElementsByClassName("slot");
	
	for(i = 0; i < location.length; i++){
		location[i].style.background = "#d3e0f1";
		location[i].style.color = "#424a52";
	}
	
	location[n].style.background = "#424a52";
	location[n].style.color = "#d3e0f1"
	
	if(n == 0)
		document.bf.location.value = "서울강남점";
	else if(n == 1)
		document.bf.location.value = "부산서면점"; 
}

//인원수선택
function selectGuest(n){
	
	var div = document.getElementById("guest");
	var guest =div.getElementsByClassName("slot");
	
	for(i = 0; i < guest.length; i++){
		guest[i].style.background = "#d3e0f1";
		guest[i].style.color = "#424a52";
	}
	
	guest[n].style.background = "#424a52";
	guest[n].style.color = "#d3e0f1"
		
	if(n == 0)
		document.bf.guest.value = "1";
	else if(n == 1)
		document.bf.guest.value = "2";
	else if(n == 2)
		document.bf.guest.value = "3";
	else if(n == 3)
		document.bf.guest.value = "4";	
}

//시간선택
function selectTime(n){
	var div = document.getElementById("time");
	var time =div.getElementsByClassName("slot");
	
	for(i = 0; i < time.length; i++){
		time[i].style.background = "#d3e0f1";
		time[i].style.color = "#424a52";
	}
	
	time[n].style.background = "#424a52";
	time[n].style.color = "#d3e0f1"
		
	if(n == 0)
		document.bf.time.value = "11:00";
	else if(n == 1)
		document.bf.time.value = "13:00";
	else if(n == 2)
		document.bf.time.value = "17:00";
	else if(n == 3)
		document.bf.time.value = "19:00";	
}

//테이블선택
function selectTable(n){
	var div = document.getElementById("table");
	var table =div.getElementsByClassName("tabl");
	
	for(i = 0; i < table.length; i++){
		if(i<=3){
			table[i].style.backgroundImage = "url('../images/book/table2.png')";
		}
		else
			table[i].style.backgroundImage = "url('../images/book/table4.png')";
	}
	
	if(n<=3){
		table[n].style.backgroundImage = "url('../images/book/table2_g.png')";
		alert("gg");
	}
	else{
		table[n].style.backgroundImage = "url('../images/book/table4_g.png')";
		alert("gg");
	}

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

	//기존 td삭제
	for(i = 0; i < 7; i++)
	{	
		if(tr[i].cells.length > 1)
		{
			var lastcol = tr[i].cells(1);
			tr[i].removeChild(lastcol);
		}
	}
	
	//td생성
	var newtd = new Array(7);
	var text = new Array(7);
	text[0] = document.createTextNode(document.bf.location.value);
	text[1] = document.createTextNode(document.bf.guest.value);
	text[2] = document.createTextNode(document.bf.date.value);
	text[3] = document.createTextNode(document.bf.time.value);
	text[4] = document.createTextNode(document.bf.tablenum.value);
	
	if(document.bf.alergy[1].checked)
		text[5] = document.createTextNode("있음");
	else if(document.bf.alergy[0].checked)
		text[5] = document.createTextNode("없음");

	text[6] = document.createTextNode(document.bf.request.value);
	
	for(i = 0; i < 7; i++)
	{
		newtd[i] = document.createElement("td"); 
		tr[i].appendChild(newtd[i]);
		newtd[i].appendChild(text[i]);
	}
	
}

































