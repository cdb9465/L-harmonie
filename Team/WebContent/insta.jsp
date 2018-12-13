<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="js/instafeed.min.js"></script> <!-- js 파일 로드 -->
<script type="text/javascript">    
var userFeed = new Instafeed({
    get: 'user',
    userId: 9538569120,
    sortBy: "most-recent",
    limit: 4,
    template: '<a href="{{link}}" target="_blank"><img src="{{image}}" class="instaimg"/></a>', 
    // {{link}} : 게시물 링크, {{image}} : 사진 url, {{caption}} : 게시물 텍스트
    accessToken: '9538569120.7c9af27.fb5cb2144b3f48b69326dd11fd3b38ed'        
});
 
userFeed.run();
</script>
<div id="instafeed"></div>
