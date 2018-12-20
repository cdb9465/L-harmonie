function loveClick(a,b, iReview){

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
//	        	if(data==0){
//	        		$("#heart").css("color","#ccc");
//	        	}else{
//	        		$("#heart").css("color","#800000");
//	        	}
	        	//alert(data+" "+iReview);
	        	$("#reCountOne").html(data);
	        	//setLove(data, iReview);
	        	
//	        	$("#reCountOne").each(function(iReview){
//	        		//alert(iReview);
//	        		$(this).html(data);
//	        	});
      	
//	        	if(data==0){
//	        		$("#heart").css("color","#ccc");
//	        	}else{
//	        		$("#heart").css("color","#800000");
//	        	}
	        	//alert(data+" "+iReview);
	        	$("#reCountOne").html(data);
	        	//setLove(data, iReview);
	        	
//	        	$("#reCountOne").each(function(iReview){
//	        		//alert(iReview);
//	        		$(this).html(data);
//	        	});
      	
	        }
	       	 
	     });
		
}
















