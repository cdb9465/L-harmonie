function loveClick(a,b){
alert(a+","+b);



	$.ajax({
        data: {email:a,reNum:b},
        type: 'POST',
        url: "./LoveUserCheckAction.re", //이페이지에서 있는지 확인
        success: function(data){
 
        	$("#reCountOne").html(data);
        }
       	 
        });
			
}


