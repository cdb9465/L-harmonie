function loveClick(a,b){

		$.ajax({
	        data: {email:a,reNum:b},
	        type: 'POST',
	        url: "./LoveUserCheckAction.re", //이페이지에서 있는지 확인
	        success: function(data){
	        	alert(data);
	        	/*if(data==0){
	        		$("#heart").css("color","#ccc");
	        	}else{
	        		$("#heart").css("color","#800000");
	        	}*/
	        	$("#reCountOne").html(data);
	        }
	       	 
	     });
		
}
















