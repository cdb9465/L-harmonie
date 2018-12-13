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
	
	//step5일때 테이블에 데이터 뿌려주기
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
		location[i].className = "slot";
	}
	
	location[n].className += " slotAct";
	
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
		guest[i].className = "slot";
	}
	
	guest[n].className += " slotAct";
	
	document.bf.guest.value= n+1;
	
}

//시간선택
function selectTime(n){
	var div = document.getElementById("time");
	var time =div.getElementsByClassName("slot");
	
	for(i = 0; i < time.length; i++){
		time[i].className = "slot";
	}
	
	time[n].className += " slotAct";
	
	var timeArr = ["11:00","13:00","17:00","19:00"];
	for(i=0; i<time.length; i++){
		if(n == i)
			document.bf.time.value = timeArr[i];
	}

	//var l = document.bf.location.value;
	//var t = document.bf.time.value;
	//var d = document.bf.date.value;
	
	//location.href="./BookTest.bk?location="+"ddd"+"&time="+t+"&date="+d;
}

//시간 선택 초기화
function initTime()
{
	var div = document.getElementById("time");
	var time =div.getElementsByClassName("slot");
	
	for(i = 0; i < time.length; i++)
	{
		time[i].className = "slot";
	}
}

//테이블선택
function selectTable(n){
	var div = document.getElementById("table");
	var table = div.getElementsByClassName("tabl");
	
/*	for(i = 0; i < table.length; i++){
		if(i<=3)
			table[i].className = "tabl tfor2";
		else
			table[i].className = "tabl tfor4";
	}*/
	
	//테이블선택 초기화
	var selected = parseInt(document.bf.tablenum.value)-1; //선택했던 테이블 받아오기

	if(!isNaN(selected)) //selected 있을때만 초기화
	{	
		if(selected<=3)
		{
			table[selected].className = "tabl tfor2";
		}
		else
		{
			table[selected].className = "tabl tfor4";
		}
	}
	
	//이미 예약된 테이블 선택시 알림
	if(table[n].className == "tabl tfor2Disable" 
		|| table[n].className == "tabl tfor4Disable")
	{
		alert("선택 불가능한 테이블입니다.\n다른 테이블을 선택해 주세요.");
		return;
	}
	
	//테이블선택
	if(n<=3){
		table[n].className = table[n].className.replace("tfor2","tfor2Act");
	}
	else{
		table[n].className = table[n].className.replace("tfor4","tfor4Act");
	}

	document.bf.tablenum.value= n+1;

}

//테이블선택 초기화
function initTable()
{
	var div = document.getElementById("table");
	var table = div.getElementsByClassName("tabl");

	//테이블 초기화
	for(i = 0; i < table.length; i++)
	{
		if(i<=3)
		{
			table[i].className = "tabl tfor2";
		}
		else
		{
			table[i].className = "tabl tfor4";
		}
	}

}

//예약된 테이블 표시
function disableTable(n)
{
	var div = document.getElementById("table");
	var table = div.getElementsByClassName("tabl");
	
	// 예약된 테이블 표시
	if(n <= 3)
	{
		table[n].className = table[n].className.replace("tfor2","tfor2Disable");
	}
	else
	{
		table[n].className = table[n].className.replace("tfor4","tfor4Disable");
	}
}

//show Request Detail input
function showDetail(chk) {
	var detail = document.getElementById("detail");
	if(chk)
		detail.style.display = "inline";
	else
	{
		document.bf.detail.value = "";
		detail.style.display = "none";
	}
}

//step5
function confirmForm() {
	var table, tr;
	table = document.getElementById("confirm");
	tr = table.getElementsByTagName("tr");

	//기존 td삭제
	for(i = 0; i < 6; i++)
	{	
		if(tr[i].cells.length > 1)
		{
			var lastcol = tr[i].cells(1);
			tr[i].removeChild(lastcol);
		}
	}
	
	//td생성
	var newtd = new Array(6);
	var text = new Array(6);
	text[0] = document.createTextNode(document.bf.location.value);
	text[1] = document.createTextNode(document.bf.guest.value);
	text[2] = document.createTextNode(document.bf.date.value);
	text[3] = document.createTextNode(document.bf.time.value);
	text[4] = document.createTextNode(document.bf.tablenum.value);
	
	setRequest();
	text[5] = document.createTextNode(document.bf.request.value);
	
	for(i = 0; i < 6; i++)
	{
		newtd[i] = document.createElement("td"); 
		tr[i].appendChild(newtd[i]);
		newtd[i].appendChild(text[i]);
	}
	
}

//request
function setRequest()
{
	var alergyVal, specialVal;
	if(document.bf.alergy[1].checked)
		alergyVal = "알레르기 있음 " + document.bf.detail.value;
	else if(document.bf.alergy[0].checked)
		alergyVal = "";
	
	if(document.bf.special.value=="")
		specialVal = "";
	else
		specialVal = " " + document.bf.special.value;
	
	var reqVal = alergyVal + specialVal;
	document.bf.request.value = reqVal;
}


