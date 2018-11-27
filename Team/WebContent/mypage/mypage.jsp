<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Locale"%>
<%@page import="net.book.db.BookBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="net.member.db.MemberDAO"%>
<%@page import="net.review.db.ReviewBean"%>
<%@page import="java.util.List"%>
<%@page import="net.member.db.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="./css/mypage.css" rel="stylesheet">
<link href="./css/default.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.4.2/css/all.css' integrity='sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns' crossorigin='anonymous'>
 --><link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
<script src="./js/jquery-3.3.1.js"></script>
<script src="./js/httpRequest.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- datepicker 한국어로 -->
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
    <script type="text/javascript">
    /* 마우스 휠로 화면이동할때 효과 */
        window.onload = function () {
            $(".mpbox").each(function () {
                // 개별적으로 Wheel 이벤트 적용
                $(this).on("mousewheel DOMMouseScroll", function (e) {
                    e.preventDefault();
                    var delta = 0;
                    if (!event) event = window.event;
                    if (event.wheelDelta) {
                        delta = event.wheelDelta / 120;
                        if (window.opera) delta = -delta;
                    } else if (event.detail) delta = -event.detail / 3;
                    var moveTop = null;
                    // 마우스휠을 위에서 아래로
                    if (delta < 0) {
                        if ($(this).next() != undefined) {
                            moveTop = $(this).next().offset().top;
                        }
                    // 마우스휠을 아래에서 위로
                    } else {
                        if ($(this).prev() != undefined) {
                            moveTop = $(this).prev().offset().top;
                        }
                    }
                    // 화면 이동 0.8초(800)
                    $("html,body").stop().animate({
                        scrollTop: moveTop + 'px'
                    }, {
                        duration: 800, complete: function () {
                        }
                    });
                });
            });
        }

// ------------------------------------------마이페이지 제어창(info)-------------
   	var passck = false;
   	var repassck = false;
   	var nameck = true;
   	var phoneck = true;
   	var birthck = true;
   	
 // 수정, 탈퇴 버튼 활성화조건
   	function checkInfo(){
 		
		//조건에 맞으면
		if(passck == true && repassck == true && nameck == true && phoneck == true && birthck == true){
			
			// 버튼 활성화
			$(".mem_update").prop("disabled", false);
	        $(".mem_update").css("background-color", "#000");
	        $(".mem_update").css("color", "#eee");
	        $(".mem_delete").prop("disabled", false);
	        $(".mem_delete").css("background-color", "#000");
	        $(".mem_delete").css("color", "#eee");
		}else{
		
			// 버튼 비활성화
			$(".mem_update").prop("disabled", true);
			$(".mem_update").css("background-color", "rgb(240,240,240)");
		    $(".mem_update").css("color", "rgb(188,188,188)");
		    $(".mem_delete").prop("disabled", true);
			$(".mem_delete").css("background-color", "rgb(240,240,240)");
		    $(".mem_delete").css("color", "rgb(188,188,188)");
		}
	}
   	

   	/* 패스워드확인 자리수 4자리 이상 */
   		function checkPwd() {
   			var pw1 = fr1.pass.value;
   			var pw2 = fr1.repass.value;
   			
   			if(pw1.length>=4){	
   				document.getElementById('checkPwd1').innerHTML = "<p></p>";
   				passck = true;
   				checkInfo();
   					//비밀번호 재확인
   				if (pw1 != pw2) {
   					document.getElementById('checkPwd2').style.color = "#800000";
   					document.getElementById('checkPwd2').innerHTML = "<p>비밀번호가 일치하지 않습니다.</p>";
   					repassck = false;
   					checkInfo();
   						//모든조건이 맞을 때 repassck=ture 반환
   				} else {
   					document.getElementById('checkPwd2').innerHTML = "<p></p>";
   					repassck = true;
   					checkInfo();
   				}
   			}else {
   				document.getElementById('checkPwd1').style.color = "#800000";
   				document.getElementById('checkPwd1').innerHTML = "<p>비밀번호를 4자리 이상 입력하세요</p>";
   				document.getElementById('checkPwd2').innerHTML = "<p></p>";
   				passck = false;
   				checkInfo();
   				}
   		}
   	/* 이름 필수입력 */
   		function checkName(){
   			if(document.fr1.name.value.length==0){
   				document.getElementById('checkName').style.color = "#800000";
   				document.getElementById('checkName').innerHTML = "<p>이름을 입력하세요</p>";
   				nameck = false;
   				checkInfo();
   			}else {
   				document.getElementById('checkName').innerHTML = "<p></p>";
   				nameck = true;
   				checkInfo();
   			}
   		}
   	/* 휴대폰번호 필수입력 */
   		function checkPhone(){
   				if(document.fr1.phone.value.length!=11){
   					document.getElementById('checkPhone').style.color = "#800000";
   					document.getElementById('checkPhone').innerHTML = "<p>휴대폰번호 11자리를 입력해주세요.</p>";
   					phoneck = false;
   					checkInfo();
   		
   				}else {
   					document.getElementById('checkPhone').innerHTML = "<p></p>";
   					phoneck = true;
   					checkInfo();
   				}
   		    	
   		}

   	/* 폰,생일에 숫자만 입력되도록 제어 */
	function digit_check(evt){
	    var code = evt.which?evt.which:event.keyCode;
	    if(code < 48 || code > 57){
	        return false;
	    }
	}

   	/* 다중 submit 제어 */
   	function Action(index){
   		if(index==1){
   			if (confirm("회원정보를 수정하시겠습니까?")==true){    //확인
   				document.fr1.action="./MemberUpdate.me";
   			}else{   //취소
   			    return false;
   			}
   		}else if(index==2){
   			if (confirm("정말 탈퇴하시겠습니까?")==true){   
   				document.fr1.action="./MemberDelete.me";
   			}else{   //취소
			    return false;
			}
   		}
   		document.fr1.submit();
   	}
   	
   	
 /* ---------------------------------------------------------------------------------------- */
	 $(document).ready(function() {

            //datepicker 한국어로 사용하기 위한 언어설정
            $.datepicker.setDefaults($.datepicker.regional['ko']);     

            // Datepicker            
            $(".datepicker").datepicker({
                
                dateFormat: "yy-mm-dd",
                onClose : function ( selectedDate ) {
                
                    var eleId = $(this).attr("id");
                    var optionName = "";

                    if(eleId.indexOf("StartDate") > 0) {
                        eleId = eleId.replace("StartDate", "EndDate");
                        optionName = "minDate";
                    } else {
                        eleId = eleId.replace("EndDate", "StartDate");
                        optionName = "maxDate";
                    }

                    $("#"+eleId).datepicker( "option", optionName, selectedDate );        
                    $(".searchDate").find(".chkbox2").removeClass("on"); 
                }
            }); 

            //시작일.
            /*$('#searchStartDate').datepicker("option","onClose", function( selectedDate ) {    
                // 시작일 datepicker가 닫힐때
                // 종료일의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                $("#searchEndDate").datepicker( "option", "minDate", selectedDate );
                $(".searchDate").find(".chkbox2").removeClass("on");
            });
            */

            //종료일.
            /*$('#searchEndDate').datepicker("option","onClose", function( selectedDate ) {    
                // 종료일 datepicker가 닫힐때
                // 시작일의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                $("#searchStartDate").datepicker( "option", "maxDate", selectedDate );
                $(".searchDate").find(".chkbox2").removeClass("on");
            });
            */

            $(".dateclick").dateclick();    // DateClick
            $(".searchDate").schDate();        // searchDate
            
        });

        // Search Date
        jQuery.fn.schDate = function(){
            var $obj = $(this);
            var $chk = $obj.find("input[type=radio]");
            $chk.click(function(){                
                $('input:not(:checked)').parent(".chkbox2").removeClass("on");
                $('input:checked').parent(".chkbox2").addClass("on");                    
            });
        };

        // DateClick
        jQuery.fn.dateclick = function(){
            var $obj = $(this);
            $obj.click(function(){
                $(this).parent().find("input").focus();
            });
        }    

        
        function setSearchDate(start){

            var num = start.substring(0,1);
            var str = start.substring(1,2);

            var today = new Date();

            //var year = today.getFullYear();
            //var month = today.getMonth() + 1;
            //var day = today.getDate();
            
            var endDate = $.datepicker.formatDate('yy-mm-dd', today);
            $('#searchEndDate').val(endDate);
            
            if(str == 'd'){
                today.setDate(today.getDate() - num);
            }else if (str == 'w'){
                today.setDate(today.getDate() - (num*7));
            }else if (str == 'm'){
                today.setMonth(today.getMonth() - num);
                today.setDate(today.getDate() + 1);
            }

            var startDate = $.datepicker.formatDate('yy-mm-dd', today);
            $('#searchStartDate').val(startDate);
                    
            // 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
            $("#searchEndDate").datepicker( "option", "minDate", startDate );
            
            // 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
            $("#searchStartDate").datepicker( "option", "maxDate", endDate );

        }

            
    </script>

<title>L'harmonie|My page</title>
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->

<div class="clear"></div>
<%
MemberBean mb = (MemberBean)request.getAttribute("mb");
%>
<div class="mpbox" id="sec1_mypage"><!-- 배경들어가는 영역 -->
 <h1>MODIFY</h1>
 	<div id="modify"> 	
 		<form id="info_update" method="post" name="fr1">
 		<input type="hidden" value="<%=mb.getMem_num() %>" name="mem_num"><!-- 회원번호 숨겨서 넘기기 -->
				<table >
				<tr>
						<td><i class='far fa-envelope' style='font-size:24px'></i></td>
						<th>아이디 : </th><td><input type="text" name="email" value="<%=mb.getEmail() %>" size="35" Readonly>
						</td>
				</tr>
				<tr>
						<td><i class='fas fa-lock' style='font-size:24px'></i></td>
						<th>새 비밀번호 : </th><td><input type="password" name="pass" id="pass" value="" size="35" onkeyup="checkPwd()">
											<span id="checkPwd1"></span>
											</td>
				</tr>
				<tr>
						<td><i class='fas fa-lock' style='font-size:24px'></i></td>
						<th>비밀번호 확인 : </th><td><input type="password" name="repass" id="repass" value="" size="35" onkeyup="checkPwd()">
											<span id="checkPwd2"></span>
											</td>
				</tr>
				<tr>
						<td><i class='fas fa-male' style='font-size:32px' id="name_icon"></i></td>
						<th>이름 : </th><td><input type="text" name="name" id="name" value="<%=mb.getName() %>" size="35" onkeyup="checkName()" >
										<span id="checkName"></span>
										</td>
				</tr>
				<tr>
						<td><i class="material-icons" style='font-size:28px'>phone_android</i></td>
						<th>휴대폰 : </th><td><input type="text" name="phone" id="phone" value="<%=mb.getPhone() %>" size="35" maxlength="11"
											style="ime-mode:disabled;" onkeyup="checkPhone()" onkeypress="return digit_check(event)">
										<span id="checkPhone"></span>	
										</td>
				</tr>

				<tr><td id="button_area"></td><td><input type="button" id="mem_update" class="mem_update" value="정보수정" disabled="disabled" onclick="Action(1)"></td>
					<td><input type="button" id="mem_delete" class="mem_delete" value="회원탈퇴" disabled="disabled" onclick="Action(2)">
					</td>
				</tr>
				
			</table>
		</form>
		
		
	 </div>
</div>

<!-- 2번째 메인 -->
<%
List myBookList = (List)request.getAttribute("myBookList");


%>
<div class="mpbox" id="sec2_mypage"><!-- 배경들어가는 영역 -->
 <h1>MY BOOK</h1>
<div id="mybook">
	<div class="term">
		 <ul class="searchDate">
            <li>
                <span class="chkbox2">
                    <input type="radio" name="dateType" id="dateType1" onclick="setSearchDate('0d')"/>
                    <label for="dateType1" id="leftBorder">오늘</label>
                </span>
            </li>
            <li>
                <span class="chkbox2">
                    <input type="radio" name="dateType" id="dateType3" onclick="setSearchDate('1w')"/>
                    <label for="dateType3">1주일</label>
                </span>
            </li>
            <li>
                <span class="chkbox2">
                    <input type="radio" name="dateType" id="dateType5" onclick="setSearchDate('1m')"/>
                    <label for="dateType5">1개월</label>
                </span>
            </li>
            <li>
                <span class="chkbox2">
                    <input type="radio" name="dateType" id="dateType6" onclick="setSearchDate('3m')"/>
                    <label for="dateType6">3개월</label>
                </span>
            </li>
            <li>
                <span class="chkbox2">
                    <input type="radio" name="dateType" id="dateType7" onclick="setSearchDate('6m')"/>
                    <label for="dateType7">6개월</label>
                </span>
            </li>
        </ul>
		 	 <!-- 시작일 -->
            <span class="dset">
                <input type="text" class="datepicker inpType" name="searchStartDate" id="searchStartDate" >
            	 <a href="#none" class="btncalendar dateclick">달력</a>
            </span>
            <span class="demi">~</span>
            <!-- 종료일 -->
            <span class="dset">
                <input type="text" class="datepicker inpType" name="searchEndDate" id="searchEndDate" >
            	<a href="#none" class="btncalendar dateclick">달력</a>
            </span>
            <input type="button" value="조회" id="bserch">
			
	</div>

<div class="mpcount">전체 2건</div>
	<div class="clear"></div>
<table class="mybook_tbl">
<tr class="ttl"><th>예약번호</th><th>지점</th><th>예약일자<br>[시간]</th><th>테이블번호</th><th class="guest">인원</th>
	<th class="ps">요청사항</th><th></th></tr>
<tbody>
<%	for(int i=0; i < myBookList.size(); i++){
		BookBean bb = (BookBean)myBookList.get(i);
		
		//오늘날짜구하기
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
		Date currentTime = new Date();
		String oTime = mSimpleDateFormat.format ( currentTime ); //현재시간 (String)
		
		//date형으로 바꾸기
		Date nowDate =  mSimpleDateFormat.parse( oTime );

		// Date로 변환된 두 날짜를 계산한 뒤 그 리턴값으로 long type 변수를 초기화
		// Date.getTime() 은 해당날짜를 기준으로 1970년 00:00:00 부터 몇 초가 흘렀는지를 반환
		// 24*60*60*1000(각 시간값에 따른 차이점) 을 나눠주면 일수가 나옴
		long bbResult = bb.getDate().getTime()/ ( 24*60*60*1000);
		long todayResult = nowDate.getTime()/ ( 24*60*60*1000);

		//예약일 - 오늘 값을 계산해준다 ( -1이상이면 예약취소가능)
		long Result = bbResult - todayResult;
		System.out.println(Result);//확인

%>
	
	<tr class="ttl"><td><%=bb.getBook_num() %></td><td><%=bb.getLocation() %></td>
	<td><%=bb.getDate() %><br><%=bb.getTime() %></td>
	<td><%=bb.getTablenum() %></td><td><%=bb.getGuest() %></td>
	<td><%=bb.getRequest() %></td><td>
	
		<%if ( Result >= 1 ){ // 예약일 이전 %>
			<input type="button" value="예약취소" class="bookcancel" id="bcancel" >
		<%} else if(Result == 0){ //예약당일 %>
			<span class="bookday">당일취소불가</span>
		<%} else{  // 예약일 이후  %> 
			<input type="button" value="리뷰작성" class="writeReview" id="wreview" >
<%} %>
	</td></tr>
<%} %>
</tbody>
</table>

	<div class="btnContent">
	
		<div class="pagination" id="pagination">페이지 영역</div>

	</div>

</div>
</div>

<!-- 3번째 메인 -->
<%
List myReviewList = (List)request.getAttribute("myReviewList");
%>
<div class="mpbox" id="sec3_mypage">
 <h1>MY REVIEW</h1>
<div id="myreview">
<div class="term">

<i class='far fa-calendar-alt' style='font-size:27px'></i>
<span>조회기간</span>
 <input type="button" value="일주일" class="termbtn"> <input type="button" value="1개월" class="termbtn">
 <input type="button" value="3개월" class="termbtn"> <input type="button" value="6개월" class="termbtn">
  <input type="button" value="6개월 이전" class="termbtn">
</div>

<div class="mpcount">전체 1건</div>
	<div class="clear"></div>
<table class="mybook_tbl">
	<tr class="ttl"><th>번호</th><th>평점</th><th>날짜</th>
	<th class="ps">내용</th><th>지점</th><th>첨부</th></tr>
	
	<%	for(int i=0; i < myReviewList.size(); i++){

		ReviewBean rb = (ReviewBean)myReviewList.get(i);
%>
	<tr class="ttl"><td><a href="#" class="reviewdetail"><%=rb.getReview_num() %></a></td>
	<td><%
		//평점 점수에 따라 ★로 표시함
		for(int j=0; j < rb.getRating(); j++){
			out.print("★");
		}
		%>
	</td>
	<td><%=rb.getDate() %></td><td class="ps"><%=rb.getContent() %></td><td><%=rb.getLocation() %></td><td><%=rb.getFile() %></td></tr>
<%	}

	 %>
	
</table>
</div>
</div>


   
   
<div class="clear"></div>

<!-- 서브메뉴 들어가는 곳 -->
<jsp:include page="../inc/submenu.jsp"></jsp:include>
<!-- 서브메뉴 들어가는 곳 -->
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->
</body>
</html>