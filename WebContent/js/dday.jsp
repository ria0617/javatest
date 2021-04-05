<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.1/css/all.min.css'>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%-- 달력만드는 자바스크립트를 불러온다 --%>
<script src="carlandar.js"></script>
<%-- form값을 받아오는 곳 --%>
<%
request.setCharacterEncoding("UTF-8");
String username = request.getParameter("username");
String userdday = request.getParameter("userdday");
%>
<script>
	//받아온 값을 자바스크립트 변수처리 해준다
	var j_username = "<%= username%>";
	var j_userdday = "<%= userdday%>";

	// yyyy-mm-dd 문자열을 일정한 구분자로 잘라서 배열로 저장하기
	// .split('-')는 '-' 문자열마다 자르라는 의미이다
	// ["yyyy", "mm", "dd"] 배열로 만들어진다
	var jdayArr = j_userdday.split('-');
	
	// 그리고 배열을 불러서 date에 넣는다
	// 0 = 1월이라 '-1'을 꼭 해줘야한다
	// input 문자열 값 날짜로 today를 출력가능하게 되었다
	var day = new Date(jdayArr[0], jdayArr[1]-1, jdayArr[2]);
	
	yy = day.getFullYear(); //yyyy 값만 출력
	mm = day.getMonth()+1; //mm 값만 출력
	today =day.getDay(); //dd 값만 출력
	
	// 함수에 값을 넣어준다
	t = getCalendar(yy,mm);
</script>
<script>
	//데뷔한지 며칠이 지났는지 알려준다
	var now = new Date(); //오늘 날짜
	var tday = now.getTime() - day.getTime(); //오늘날짜-데뷔한 날짜
	tday = Math.floor(tday / (1000 * 60 * 60 * 24)); 
	
	//데뷔하고 n일 뒤 년-월-일 계산하는 함수
	//변수 xday = 기준날짜
	var xday = new Date(jdayArr[0], jdayArr[1]-1, jdayArr[2]);
	function nDay(x_num){
		xday.setDate(xday.getDate() + x_num); //x_num의 숫자 만큼 일자를 더해라
		// 나온 날짜를 yy-mm-dd로 정리해준다
		xyy = xday.getFullYear();
		xmm = xday.getMonth()+1;
		xdd = xday.getDay();
		return xyy +'년 ' +xmm+'월 ' +xdd+'일';
	} 
	day100 = nDay(100); //데뷔 후 100일 
	day500 = nDay(500); //데뷔 후 500일
	
	
	//100주년까지 며칠이 남았을까?
	var dayh = new Date('2099-11-03'); // 도달해야하는 날짜
	var year100 = dayh.getTime() - now.getTime(); //도달날짜 - 오늘날짜
	year100 = Math.floor(year100 / (1000 * 60 * 60 * 24));
	
</script>
<meta charset="UTF-8">
<title>1차과제 제작자 황유나</title>
</head>
<body>
	<div id="wrap">
		<div class="main_wrap pdb50">
			<h1 id="main_logo">
				<img src="../img/logo.png" alt="로고" />
			</h1>
			<div class="sub_title">자바스크립트를 이용해 D-day를 알아보자</div>

			<div id="calendar_wrap">
				
				<table class="calendar">
					<thead>
						<tr>
							<th colspan="7">
								<span id="j_yy"></span>년 
								<span id="j_mm"></span>월
							</th>
						</tr>
					</thead>
					
					<script type="text/javascript">
						//달력 함수를 호출한다
						document.write(t);
					</script>
				</table>
			</div>
			<p class="result_text">
				<span id="j_name"></span>님은 데뷔한지 
				<span id="total_day"></span>일 입니다.<br /> 
				데뷔 100일 기념일: <span id="day100"></span><br />
				데뷔 500일 기념일: <span id="day500"></span><br /><br />
				
				데뷔 100주년까지 앞으로 <span id="year100"></span>일 남았습니다
			</p>
			<script>
				//대입하는 ID 위치보다 뒤에 나와야 오류가 안난다.
				document.getElementById('j_name').innerHTML= j_username;
				document.getElementById('j_yy').innerHTML= yy;
				document.getElementById('j_mm').innerHTML= mm;
				document.getElementById('total_day').innerHTML= tday;
				document.getElementById('day100').innerHTML= day100;
				document.getElementById('day500').innerHTML= day500;
				document.getElementById('year100').innerHTML= year100;
			</script>
			<button class="search2" onClick="location.href='../main.html'">
				다시 검색하기 <i class="fas fa-angle-double-right"></i>
			</button>
		</div>
	</div>
</body>
</html>