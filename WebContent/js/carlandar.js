function getCalendar(year, month) {

	//달력의 7줄
	var cals = new Array(7);
	//요일정보
	weekDay = new Date(year, month - 1, 1).getDay();
	//그달의 마지막 일자 
	endDay = new Date(year, month, 0).getDate();

	//요일 위치를 설정해준다
	cals[0] = new Array(7);
	cals[0][0] = "일요일";
	cals[0][1] = "월요일";
	cals[0][2] = "화요일";
	cals[0][3] = "수요일";
	cals[0][4] = "목요일";
	cals[0][5] = "금요일";
	cals[0][6] = "토요일";

	//일자를 표기하는 줄
	for (i = 1, cnt = 1; i < 7; i++) {
		cals[i] = new Array(7); //각 줄을 7칸씩 나눠준다 - 2차원배열이 된다.
		for (j = 0; j < 7; j++) {
			if (i == 1 && j < weekDay) {
				cals[i][j] = "&nbsp;";
			} else if (cnt <= endDay) {
				cals[i][j] = cnt++;
			} else {
				cals[i][j] = "&nbsp;";
			}
		}
	}

	//2차원배열을 달력으로 만들기
	//요일은 th라서 따로 while문을 돌림 
	var t = "<tbody>";
	t += "<tr>";
	y=0;
	while (y < 7) {
		t += "<th>" + cals[0][y] + "</th>";
		y++;
	}
	t += "</tr>";
	//today는 for ~ if문을 써서 다른 색상으로 표현
	for (x = 1; x < cals.length; x++) {
		t += "<tr>";
		for (y = 0; y < cals[x].length; y++) {
			if (cals[x][y] == today) {
				t += "<td class='d_today'>" + cals[x][y] + "</td>";
			} else {
				t += "<td>" + cals[x][y] + "</td>";
			}
		}
		t += "</tr>";
	}
	t += "</tbody>";
	return t;
}
