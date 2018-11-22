<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="./css/default.css" rel="stylesheet">
<link href="./css/aboutUs.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=30e4f19e3412a3a75d0669f0d77273ba"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
    window.onload = function () {
        $(".main_box").each(function () {
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
</script>

<title>L'harmonie</title>
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
<div class="clear"></div>

<!-- 본문 -->
<div class="main_box" id="main0">

</div>
<!-- 첫번째 메인 끝 -->


<!-- 2번째 메인 -->
<div class="main_box" id="main1">
</div>

<!-- 3번째 메인 -->
<!-- <div class="main_box" id="main2"> -->

<div class="map_wrap">
 <div id="map" style="width: 500px;height: 400px;position:relative;overflow:hidden;">
  <div class="custom_zoomcontrol radius_border"> 
   <span onclick="zoomIn()"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>  
   <span onclick="zoomOut()"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
  </div>
 </div>
  <div class="custom_zoomcontrol radius_border"> 
   <span onclick="zoomIn()"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>  
   <span onclick="zoomOut()"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
  </div>
</div>


<!-- </div> -->

<!-- 본문 -->

<!-- 서브메뉴 들어가는 곳 -->
<jsp:include page="../inc/submenu.jsp"></jsp:include>
<!-- 서브메뉴 들어가는 곳 -->

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->

<script>
var container = document.getElementById('map');	//지도 표시할 div
var options = {	//지도 생성할때 필요한 기본옵션
	//center: new daum.maps.LatLng(33.450701, 126.570667),	//지도 중심좌표
	center: new daum.maps.LatLng(35.158462, 129.062079),
	level: 3	//지도 레벨
};

var map = new daum.maps.Map(container, options);	//지도생성

//마커 생성
var markerPosition = new daum.maps.LatLng(35.158462, 129.062079);
var marker = new daum.maps.Marker({
	position: markerPosition
});

//마커 표시
marker.setMap(map);

//인포윈도우 설정
var iwContent = '<div style="width:150px;text-align:center;padding:6px 0;">부산서면점</div>',
			iwPosition = new daum.maps.LatLng(35.158462, 129.062079);

//인포윈도우 생성
var infowindow = new daum.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent
});

//마커에 인포윈도우 표시
infowindow.open(map, marker);

function zoomIn() {
    map.setLevel(map.getLevel() - 1);
}
function zoomOut() {
    map.setLevel(map.getLevel() + 1);
}



</script>

</body>
</html>