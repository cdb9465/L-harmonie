function loveClick(email, review_num){
	alert(email, review_num);
	
	$.ajax({
        data: {email2:email, review_num2:review_num},
        type: 'POST',
        url: "./LoveCountAction.re", //이페이지에서 있는지 확인
        success: function(data){
                /* if(data==1){
                	 //있으면 = 1, 삭제하자

                	 alert("1234");
                }else if(data==0){
                	//없으면 = 0, 추가하자
                	
    				
               	 } */
       	 	}
        });
	
}