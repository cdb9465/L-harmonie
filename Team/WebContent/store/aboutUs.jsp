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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

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
<div class="main_box" id="main2">

<!-- 지도 -->
<div class="map_wrap">
 <div class="mapdiv" id="mapSeomyeon">
  <div class="custom_zoomcontrol radius_border"> 
   <span onclick="zoomIn(1)">
    <img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대">
   </span>  
   <span onclick="zoomOut(1)">
    <img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소">
   </span>
  </div>
 </div>

 <div class="mapdiv" id="mapKangnam">
  <div class="custom_zoomcontrol radius_border"> 
   <span onclick="zoomIn(2)">
    <img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대">
   </span>  
   <span onclick="zoomOut(2)">
    <img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소">
   </span>
  </div>
 </div>

 <div class="mapAlldiv" id="mapAll">
  <div class="custom_zoomcontrol radius_border"> 
   <span onclick="zoomIn(0)">
    <img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대">
   </span>  
   <span onclick="zoomOut(0)">
    <img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소">
   </span>
  </div>
 </div>

</div>


</div>

<!-- 본문 -->

<!-- 서브메뉴 들어가는 곳 -->
<jsp:include page="../inc/submenu.jsp"></jsp:include>
<!-- 서브메뉴 들어가는 곳 -->

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->

<script>
var map = new Array(3);
var mapIndex;

createMap("서울강남점");
createMap("부산서면점");
createMapAll();


function createMapAll()
{
	container = document.getElementById('mapAll');	//지도 표시할 div
	position = new daum.maps.LatLng(38.060417, 128.034028);
	
	//지도 생성할때 필요한 기본옵션
	options = {
			center: new daum.maps.LatLng(38.060417, 128.034028),	//지도 중심좌표
			level: 14	//지도 레벨
		};
	
	//확대축소할 지도index
	mapIndex = 0;
	
	//마커 위치들
	var positions = [
		{ title: '서울강남점', latlng: new daum.maps.LatLng(37.498, 127.028)},
		{ title: '부산서면점', latlng: new daum.maps.LatLng(35.158462, 129.062079)}
	];
	
	//지도생성
	map[mapIndex] = new daum.maps.Map(container, options);
	
	for(var i = 0; i < positions.length; i++)
	{
		//마커 생성
		var marker = new daum.maps.Marker({
			map: map[mapIndex],	//마커 표시할 지도
			position: positions[i].latlng,	//마커 표시 위치
			title : positions[i].title // 마커의 타이틀
		});

	
		//인포윈도우 설정
		var iwContent = '<div style="width:150px;text-align:center;padding:6px 0;">'+positions[i].title+'</div>',
			iwPosition = positions[i];

		//인포윈도우 생성
		var infowindow = new daum.maps.InfoWindow({
		    position : iwPosition, //인포윈도우 표시 위치
		    content : iwContent // 인포윈도우 내용
		});

		//마커에 인포윈도우 표시
		infowindow.open(map[mapIndex], marker);

	
	}

	
}

function createMap(location)
{
	var container, options, position;
	
	if(location == "서울강남점")
	{
		container = document.getElementById('mapKangnam');	//지도 표시할 div
		position = new daum.maps.LatLng(37.498, 127.028);
		
		options = {	//지도 생성할때 필요한 기본옵션
				center: position, //지도 중심좌표
				level: 3	//지도 레벨
			};
		
		mapIndex = 2;
	}
	else if(location == "부산서면점")
	{
		container = document.getElementById('mapSeomyeon');	//지도 표시할 div
		position = new daum.maps.LatLng(35.158462, 129.062079);
		
		options = {	//지도 생성할때 필요한 기본옵션
				center: position,	//지도 중심좌표
				level: 3	//지도 레벨
			};
		
		mapIndex = 1;
	}
/* 	else if(location == "전체")
	{
		container = document.getElementById('mapAll');	//지도 표시할 div
		position = new daum.maps.LatLng(38.060417, 128.034028);
		
		options = {	//지도 생성할때 필요한 기본옵션
				center: new daum.maps.LatLng(38.060417, 128.034028),	//지도 중심좌표
				level: 14	//지도 레벨
			};
		
		mapIndex = 0;
	} */
		
	map[mapIndex] = new daum.maps.Map(container, options);	//지도생성
	
	//마커 생성
	var markerPosition = position;
	var marker = new daum.maps.Marker({
		position: markerPosition	//마커 표시 위치
	});
	
	//마커 표시
	marker.setMap(map[mapIndex]);
	
	//인포윈도우 설정
	var iwContent = '<div style="width:150px;text-align:center;padding:6px 0;">'+location+'</div>',
		iwPosition = position;

	//인포윈도우 생성
	var infowindow = new daum.maps.InfoWindow({
	    position : iwPosition, //인포윈도우 표시 위치
	    content : iwContent // 인포윈도우 내용
	});

	//마커에 인포윈도우 표시
	infowindow.open(map[mapIndex], marker);
	
}

/* 
var container = document.getElementById('map');	//지도 표시할 div
var options = {	//지도 생성할때 필요한 기본옵션
	center: new daum.maps.LatLng(35.158462, 129.062079),	//지도 중심좌표
	level: 3	//지도 레벨
};

var map = new daum.maps.Map(container, options);	//지도생성

 //마커 이미지 생성
var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png',
	//imageSize = new daum.maps.Size(64, 69);
	imageSize = new daum.maps.Size(24, 35);
	//imageOption = { offset: new daum.maps.Point(27, 69)};
	
var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);

//마커 생성
var markerPosition = new daum.maps.LatLng(35.158462, 129.062079);	//마커 표시 위치
var marker = new daum.maps.Marker({
	position: markerPosition
//	image: markerImage
});

//마커 표시
marker.setMap(map);

//인포윈도우 설정
var iwContent = '<div style="width:150px;text-align:center;padding:6px 0;">부산서면점</div>', // 인포윈도우 내용
			iwPosition = new daum.maps.LatLng(35.158462, 129.062079); //인포윈도우 표시 위치

//인포윈도우 생성
var infowindow = new daum.maps.InfoWindow({
    position : iwPosition,
    content : iwContent
});

//마커에 인포윈도우 표시
infowindow.open(map, marker);

//확대축소 함수
function zoomIn() {
    map.setLevel(map.getLevel() - 1);
}
function zoomOut() {
    map.setLevel(map.getLevel() + 1);
}
*/
//확대축소 함수
function zoomIn(mapIndex) {
   	map[mapIndex].setLevel(map[mapIndex].getLevel() - 1);
}
function zoomOut(mapIndex) {
    map[mapIndex].setLevel(map[mapIndex].getLevel() + 1);
}

</script>

</body>
</html>