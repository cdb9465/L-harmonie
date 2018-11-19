<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  <link href="/css/default.css" rel="stylesheet">
<link href="/modal.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="container">
  <h2>Modal Example</h2>
  <!-- Button to Open the Modal -->
  
  <button type="button" class="mm" data-toggle="modal" data-target="#myModal">
   리뷰작성
  </button>

  <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">리뷰작성</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
<table border="1">

<form action="/ReviewAddAction.re" method="post" name="fr">
 <div class="write_location">
 <tr><th><div class="title">지점선택</div></th>
 <td colspan="3">
  <select name="sel_location">
   <option value="gangnam">서울강남점</option>
   <option value="seomyeon">부산서면점</option>
  </select></td></tr>
 </div>
 <div class="clear"></div>

 <div class="write_rating">
 <tr><th>  <div class="title">별점</div></th>
 <td colspan="3">
 <span class="star-input">
	<span class="input">
    	<input type="radio" name="star-input" value="1" id="p1">
    	<label for="p1">1</label>
    	<input type="radio" name="star-input" value="2" id="p2">
    	<label for="p2">2</label>
    	<input type="radio" name="star-input" value="3" id="p3">
    	<label for="p3">3</label>
    	<input type="radio" name="star-input" value="4" id="p4">
    	<label for="p4">4</label>
    	<input type="radio" name="star-input" value="5" id="p5">
    	<label for="p5">5</label>
    	</span>
    	<output for="star-input"><b>0</b>점</output>	
    				
</span></td></tr>


<script src="../js/jquery-1.11.3.min.js"></script>
<script src="../js/star.js"></script>
 </div> 
 <div class="clear"></div>
 <tr><th>사진선택</th><td colspan="3">
 <input type="file" name="file1"/>
 <input type="file" name="file2"/>
 <input type="file" name="file3"/></td></tr>
 <div class="write_content">
 <tr><th> <div class="title">리뷰</div></th><td> <textarea placeholder="리뷰를 작성해주세요"></textarea></td></tr>
 
  <div class="clear"></div>
 
 
 </div>



</table>
        
        
        <!-- Modal footer -->
        <div class="modal-footer">

         <button type="submit">리뷰등록</button>
         
          <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
        </div>
        </form>
        </div>
      </div>
    </div>
  </div>
  
</div>

</body>
</html>