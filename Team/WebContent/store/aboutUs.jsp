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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" 
integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

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

<!-- 서브메뉴 들어가는 곳 -->
<jsp:include page="../inc/submenu.jsp"></jsp:include>
	<!-- 서브메뉴 후버시 나타나는 메뉴 -->
	<div id="subon">Find Us</div>  
<!-- 서브메뉴 들어가는 곳 -->

<!-- 본문 -->
<div class="main_box" id="main0">
 <div class="main0_txt">
  더하고, 채우고, 나누는
  <br>
   맛있는 열정을 만나다
 </div>
 
 <a href="#main1" class="arrow">
   <img src="./images/arrow.png">
   <img src="./images/dot.png" class="dot">
</a>

</div>
<!-- 첫번째 메인 끝 -->


<!-- 2번째 메인 -->
<div class="main_box" id="main1">
<div class="text_area left_area">
 <div class="tit">EXPERIENCE</div>
 <div class="st_tx1">
  경험의<br>
  레시피 <br>
  전하다
 </div>
 <div class="st_tx2">
  순간적인 생각이 아닌 경험과 노하우를<br>
  바탕으로 차곡차곡 쌓아올린<br>
  맛있는 음식과 다양한 문화를 전합니다.
 </div>
</div>
</div>

<!-- 3번째 메인 -->
<div class="main_box" id="main2">
<div class="text_area right_area">
 <div class="tit">PASSION</div>
 <div class="st_tx1">
  열정의<br>
  한그릇 <br>
  채우다
 </div>
 <div class="st_tx2">
  더 나은 서비스를 위해<br>
  더 편안하고 행복한 시간을 위해<br>
  한 곳에 머물지 않고 끊임없이 도전합니다.
 </div>
</div>
</div>

<!-- 4번째 메인 -->
<div class="main_box" id="main3">
 <h1 id="title">FIND US</h1>
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
 
 <div class="mapInfo">
  <div class="info-data" onclick="selectStore(0)">
	<img src="./images/menu/about01.jpg">
	<div class="infoTxt">
	 <div id="itxt1">서울강남점</div>
	 <div id="itxt2">전화 02-123-1234</div>
	 <div id="itxt2">주소 서울시 강남구</div>
	</div>
  </div>
  
  <div class="info-data" onclick="selectStore(1)">
	<img src="./images/menu/about03.jpg">
	<div class="infoTxt">
	 <div id="itxt1">부산서면점</div>
	 <div id="itxt2">전화 051-803-0909</div>
	 <div id="itxt2">주소 부산시 부산진구 동천로 109</div>
	</div>
  </div> 
  
  <div class="info-data">
	<img src="./images/book/coming-soon.png">
	<div class="infoTxt">
	 <div id="itxt1">제주 중문점 (오픈예정)</div>
	 <div id="itxt2">전화 - </div>
	 <div id="itxt2">주소 - </div>
	</div>
  </div> 
 </div>

  <div class="storeInfo">
   <div class="backMap" onclick="backMap()"><i class='fas fa-angle-left'> back</i></div>
   
   <div class="store">
    <img src="./images/menu/about01.jpg">
    <table>
     <tr>
      <th colspan="2" id="title">서울강남점</th>
     </tr>
     <tr>
      <th>주소</th>
      <td>서울시 강남구 논현동 </td>
     </tr>
     <tr>
      <th>전화번호</th>
      <td>02-123-1234</td>
     </tr>
     <tr>
      <th>영업시간</th>
      <td>11:00 - 21:00</td>
     </tr>
     <tr>
      <th>BREAK TIME</th>
      <td>15:00 - 17:00</td>
     </tr>
    </table>
   </div>
   
   <div class="store">
    <img src="./images/menu/about03.jpg">
    <table>
     <tr>
      <th colspan="2" id="title">부산서면점</th>
     </tr>
     <tr>
      <th>주소</th>
      <td>부산시 부산진구 동천로 109</td>
     </tr>
     <tr>
      <th>전화번호</th>
      <td>051-803-0909</td>
     </tr>
     <tr>
      <th>영업시간</th>
      <td>11:00 - 21:00</td>
     </tr>
     <tr>
      <th>BREAK TIME</th>
      <td>15:00 - 17:00</td>
     </tr>
    </table>
   </div>
   
  </div>

</div>

</div>

<!-- 본문 -->

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->

<script>
var map = new Array(3);
var mapIndex;
var markers = [];

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
		
		markers.push(marker);

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
		
		//마커에 클릭이벤트 등록
		(function(marker, i){
			daum.maps.event.addListener(marker, 'click', function(){ 
				selectStore(i);
			});
		})(marker, i);
	}
	
}

//지점정보 선택
function selectStore(n)
{
	var mapInfo = document.getElementsByClassName("mapInfo");
	var storeInfo = document.getElementsByClassName("storeInfo");
	var storediv = document.getElementsByClassName("store");
	
	//해당지점으로 맵 이동
	var moveLocation = markers[n].getPosition();	//클릭한 마커의 중심좌표 얻기
	map[0].setLevel(3);	//레벨 변경
	map[0].panTo(moveLocation); //부드럽게 중심좌표 이동시키기

	//지점정보 없애고 지점상세정보 보이게
	mapInfo[0].style.display = "none";
	storeInfo[0].style.display = "block";
	
	//선택한 지점 상세정보만 보이게
	if(n==0)
	{
		storediv[0].style.display = "block";
		storediv[1].style.display = "none";
	}
	else
	{
		storediv[0].style.display = "none";
		storediv[1].style.display = "block";	
	}
}

//지점정보로 돌아가기
function backMap()
{
	var mapInfo = document.getElementsByClassName("mapInfo");
	var storeInfo = document.getElementsByClassName("storeInfo");
	
	//전체지점으로 맵 이동
	var moveLocation = new daum.maps.LatLng(38.060417, 128.034028);
	map[0].setLevel(14);	//레벨 변경
	map[0].panTo(moveLocation); //부드럽게 중심좌표 이동시키기
	
	//지점상제정보 없애고 지점정보 보이게
	mapInfo[0].style.display = "block";
	storeInfo[0].style.display = "none";
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

//서브메뉴 나타내기
function subOn(){
	document.getElementById('subon').style.display = "block";
}
function subOff(){
	document.getElementById('subon').style.display = "none";
}

</script>

</body>
</html>