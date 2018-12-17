   
// ------------------------------------------1페이지 myinfo---------------------------------
   	var passck = false;
   	var repassck = false;
   	var nameck = true;
   	var phoneck = true;
   	var birthck = true;
   	
 // 수정, 탈퇴 버튼 활성화조건
   	function checkInfo(n){
 		
		//조건에 맞으면
		if(passck == true && repassck == true && nameck == true && phoneck == true && birthck == true){
			
			// 버튼 활성화
			$(".mem_update").prop("disabled", false);
	        $(".mem_update").css("background-color", "#000");
	        $(".mem_update").css("color", "#eee");
	        $(".mem_delete").prop("disabled", false);
	        $(".mem_delete").css("background-color", "#000");
	        $(".mem_delete").css("color", "#eee");
			      //정보수정 마우스올렸을 때
		        $(".mem_update").hover(function() {
		        	$(this).css("background-color", "#800000");
		        	$(this).css("color", "#000");
		        }, function(){
		        	$(this).css("background-color", "#000");
		 	        $(this).css("color", "#eee");
		        });
		      //회원탈퇴 마우스올렸을 때
		        $(".mem_delete").hover(function() {
		        	$(this).css("background-color", "#800000");
		        	$(this).css("color", "#000");
		        }, function(){
		        	$(this).css("background-color", "#000");
		 	        $(this).css("color", "#eee");
		        });
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
   	
   	
 /* -----------------------------------------2페이지 mybookList----------------------------------------------- */
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
            $('#searchStartDate').datepicker("option","onClose", function( selectedDate ) {    
                // 시작일 datepicker가 닫힐때
                // 종료일의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                $("#searchEndDate").datepicker( "option", "minDate", selectedDate );
                $(".searchDate").find(".chkbox2").removeClass("on");
            });
            

            //종료일.
            $('#searchEndDate').datepicker("option","onClose", function( selectedDate ) {    
                // 종료일 datepicker가 닫힐때
                // 시작일의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                $("#searchStartDate").datepicker( "option", "maxDate", selectedDate );
                $(".searchDate").find(".chkbox2").removeClass("on");
            });
            

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

            
 			/*	$('form').submit();*/
 			
        }
 
        function setSearchAll(){
        	$('#searchStartDate').val("");
        	$('#searchEndDate').val("");
        }
 //--------------------------3페이지
        
   	 $(document).ready(function() {

         // Datepicker            
         $(".datepicker2").datepicker({
             
             dateFormat: "yy-mm-dd",
             onClose : function ( selectedDate ) {
             
                 var eleId = $(this).attr("id");
                 var optionName = "";

                 if(eleId.indexOf("StartDate2") > 0) {
                     eleId = eleId.replace("StartDate2", "EndDate2");
                     optionName = "minDate";
                 } else {
                     eleId = eleId.replace("EndDate2", "StartDate2");
                     optionName = "maxDate";
                 }

                 $("#"+eleId).datepicker( "option", optionName, selectedDate );        
                 $(".searchDate2").find(".chkbox2").removeClass("on"); 
             }
         }); 

         //시작일.
         $('#searchStartDate2').datepicker("option","onClose", function( selectedDate ) {    
             // 시작일 datepicker가 닫힐때
             // 종료일의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
             $("#searchEndDate2").datepicker( "option", "minDate", selectedDate );
             $(".searchDate2").find(".chkbox2").removeClass("on");
         });
         

         //종료일.
         $('#searchEndDate2').datepicker("option","onClose", function( selectedDate ) {    
             // 종료일 datepicker가 닫힐때
             // 시작일의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
             $("#searchStartDate2").datepicker( "option", "maxDate", selectedDate );
             $(".searchDate2").find(".chkbox22").removeClass("on");
         });
         

         $(".dateclick2").dateclick2();    // DateClick
         $(".searchDate2").schDate2();        // searchDate
         
     });

     // Search Date
     jQuery.fn.schDate2 = function(){
         var $obj = $(this);
         var $chk = $obj.find("input[type=radio]");
         $chk.click(function(){                
             $('input:not(:checked)').parent(".chkbox22").removeClass("on");
             $('input:checked').parent(".chkbox22").addClass("on");                    
         });
     };

     // DateClick
     jQuery.fn.dateclick2 = function(){
         var $obj = $(this);
         $obj.click(function(){
             $(this).parent().find("input").focus();
         });
     }    

    
     function setSearchDate2(start){
         var num = start.substring(0,1);
         var str = start.substring(1,2);
         var today = new Date();
         
         //var year = today.getFullYear();
         //var month = today.getMonth() + 1;
         //var day = today.getDate();
         
         var endDate = $.datepicker.formatDate('yy-mm-dd', today);
         $('#searchEndDate2').val(endDate);
         
         if(str == 'd'){
             today.setDate(today.getDate() - num);
         }else if (str == 'w'){
             today.setDate(today.getDate() - (num*7));
         }else if (str == 'm'){
             today.setMonth(today.getMonth() - num);
             today.setDate(today.getDate() + 1);
         }

         var startDate = $.datepicker.formatDate('yy-mm-dd', today);
         $('#searchStartDate2').val(startDate);
                 
         // 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
         $("#searchEndDate2").datepicker( "option", "minDate2", startDate );
         
         // 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
         $("#searchStartDate2").datepicker( "option", "maxDate2", endDate );

         
			/*	$('form').submit();*/
     }
     
     function setSearchAll2(){
     	$('#searchStartDate2').val("");
     	$('#searchEndDate2').val("");
     }
       
     // MyBook 예약취소
     
     function BookDelete(num){
		var r = confirm("예약을 취소하시겠습니까?");
		if(r){
			location.href="./BookDelete.bk?num=" + num;
		}
     }
     
     