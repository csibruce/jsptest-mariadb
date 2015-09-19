var baseColor = "white";
var hitColor = "black"
var garo = 0;
var sero = 0;
var clearCount = 0;
var makeCount = 0;
var getCodeCount = 0;
var anicount = 0;
var slidingCount = 0;
var id;
var fspd = 100;
var Realrecord = new Array();
var recodeArr = new Array();
var pixels = new Array();
function changeBG(val) {
	if (window.event.which == 1) {
		if (document.getElementById("test" + val).style.backgroundColor == hitColor) {
			//document.getElementById("test" + val).style.backgroundColor = baseColor;
			$('#test'+val).css('background-color',baseColor);
		} else {
			//document.getElementById("test" + val).style.backgroundColor = hitColor;
			$('#test'+val).css('background-color',hitColor);
		}
	}
}
function changeBG1(val) {
	if (document.getElementById("test" + val).style.backgroundColor == hitColor) {
		document.getElementById("test" + val).style.backgroundColor = baseColor;
	} else {
		//document.getElementById("test" + val).style.backgroundColor = hitColor;
		$('#test'+val).css('background-color',hitColor);
	}
}
function changeBack(val) {
	//document.getElementById("test" + val).style.backgroundColor = baseColor;
	$('#test'+val).css('background-color',baseColor);
}
function Clear() {
	if (clearCount == 0) {
		alert("make a matrix first!!");
		return;
	}
	clearCount++;
	for ( var i = 0; i < pixels.length; i++) {
		//document.getElementById("test" + i).style.backgroundColor = baseColor;
		$('#test'+i).css('background-color',baseColor);
	}
	;
}
function makeTable(col, row) {
	var colsize = 10;
	var rowsize = 10;
	var num = col * row;
	var colposition = 0;
	var rowposition = 0;
	for ( var i = 0; i < num; i++) {
		pixels[i] = i;
		document.getElementById("make").innerHTML += "<div class='test' id='test"
				+ i
				+ "'' onmouseover='changeBG("
				+ i
				+ ")' onclick='changeBG1("
				+ i
				+ ")'  ondragstart = 'return false'></div>";
	}
}
function positoning(col, row) {
	var colsize = 10;
	var rowsize = 10;
	var num = col * row;
	var colposition = 0;
	var rowposition = 0;
	for ( var i = 0; i < num; i++) {
		if (i % col == 0) {
			colposition = 0;
			rowposition += rowsize;
		}
		document.getElementById("test" + i).style.left = colposition + "px";
		colposition += colsize;
		document.getElementById("test" + i).style.top = rowposition + "px";
	}
}
function building() {
	var col = document.F1.dotcol.value;
	var row = document.F1.dotrow.value;
	clearCount++;
	garo = col;
	sero = row;
	if (makeCount > 0) {
		alert("push 'refresh' then make new matrix");
		return;
	}
	if (isNaN(col + row) || col == "" || row == "") {
		alert("fill nums in Cols and Rows.");
		return;
	}
	var total = col * row;
	makeTable(col, row);
	positoning(col, row);
	Clear();
	document.getElementById("content").innerHTML = "";
	makeCount++;
}
function exBgc() {
	baseColor = document.F1.exBg.value;
	Clear();
}
function exHitc() {
	var index = document.F1.exHit.selectedIndex;
	hitColor = document.F1.exHit.options[index].value;
}
function exHitc2() {
	hitColor = document.F1.colors.value;
}
function removeLine() {
	if (pixels[0] == null) {
		alert("make a matrix first!!");
		return;
	}
	for ( var i = 0; i < pixels.length; i++) {
		document.getElementById("test" + i).style.border = "0px";
	}
	;
}
function refresh() {
	location.reload();
}
function getCode() {
	// 2진데이터배열만들기
	if (pixels[0] == null) {
		alert("make a matrix first!!");
		return;
	}
	var arrData = new Array();
	var temp = "";
	var count = 0;
	var count1 = 0;
	var one = "1";
	var zero = "0";
	for ( var i = 0; i < garo; i++) {
		for ( var j = 0; j < sero; j++) {
			var num = i + garo * j;
			if (document.getElementById("test" + num).style.backgroundColor == "white") {
				temp = temp.concat(zero);
			} else {
				temp = temp.concat(one);
			}
			count1++;
			if (temp.length == sero) {
				console.log(temp);
				arrData[count] = temp;
				count++;
				temp = "";
			}
		}
		;
	}
	;
	document.getElementById("result").innerHTML += "<hr>";
	document.getElementById("result").innerHTML += "<input type='button' name='showBack' value='showBack("
			+ Number(getCodeCount)
			+ ")' onclick='showback("
			+ Number(getCodeCount)
			+ ")'><input type='button' name='sliding' value='Left("
			+ Number(getCodeCount)
			+ ") 1step' onclick='slidingLeft("
			+ Number(getCodeCount)
			+ ")'><input type='button' name='' value='play/stop to Left' onclick='Leftplay("
			+ Number(getCodeCount)
			+ ")'><input type='button' name='sliding' value='Right("
			+ Number(getCodeCount)
			+ ") 1step' onclick='slidingRight("
			+ Number(getCodeCount)
			+ ")'><input type='button' name='' value='play/stop to Right' onclick='Rightplay("
			+ Number(getCodeCount) + ")'><br>" + arrData.join(", ");
	recodeArr[Number(getCodeCount)] = arrData.join(",");

	document.getElementById("result").style.top = sero * 12 + "px";
	Realrecord[Number(getCodeCount)] = recodeArr[Number(getCodeCount)]
			.split(",");
	getCodeCount++;
	var resultHeight = document.getElementById("result").offsetHeight;
	resultHeight = resultHeight + sero * 12;
	document.getElementById("Tbox").style.top = resultHeight + "px";
	document.getElementById("Tbox").innerHTML = "<h2>input/output Data</h2><input type='button' name='' value='decode' onclick='decode()'>Make sure Array below fits matrix above and no space around Array.<br>if you want to remove middle of animation, delet the whole line for it.<br><textarea name='inputCode' id='inputCode' cols='60' rows='10'></textarea>";
}
function changeSize() {
	var Size = document.getElementById("range").value;
	for ( var i = 0; i < pixels.length; i++) {

		document.getElementById("test" + i).style.width = Size + "px";
		document.getElementById("test" + i).style.height = Size + "px";
	}
	;
	repositoning(Size);
}
function repositoning(Size) {
	var num = pixels.length;
	var colposition = 0;
	var rowposition = 0;
	for ( var i = 0; i < num; i++) {
		if (i % garo == 0) {
			colposition = 0;
			rowposition += Number(Size);
		}
		document.getElementById("test" + i).style.left = colposition + "px";
		colposition += Number(Size);
		document.getElementById("test" + i).style.top = rowposition + "px";
	}
}
function showback(num) {
	slidingCount = 0;
	var sbcount = 0;
	for ( var i = 0; i < garo; i++) {
		var insidei = i;
		for ( var j = 0; j < sero; j++) {
			if (Realrecord[num][i].charAt(j) == 0) {
				document.getElementById("test" + insidei).style.backgroundColor = baseColor;
			} else {
				document.getElementById("test" + insidei).style.backgroundColor = hitColor;
			}
			insidei += Number(garo);
		}
	}
	;
	sbcount++;
}
var swi = false;
function animation() {
	if (swi == false) {
		if (Realrecord.length == 0) {
			alert("getCode first!!");
			return;
		}
		id = setInterval(nothing, fspd);
	}
}
function nothing() {
	Realrecord.length;
	showback(anicount);
	anicount++;
	swi = true;
	if (anicount == Realrecord.length) {
		clearInterval(id);
		anicount = 0;
		swi = false;
	}
}
function frameSpeed() {
	fspd = document.F1.speedNo.value;
	alert("frame speed changed..")
}
function test() {
	document.getElementById("inputCode").value = "";
	document.getElementById("inputCode").value = Realrecord.join("\n");

}
function checkheight() {
	alert(document.getElementById("result").offsetHeight);
}
var ArrForDecod = new Array();
function decode() {
	if (document.getElementById("inputCode").value == "") {
		alert("do encode or fill Array in textarea.");
		return;
	}
	var TempArr01 = new Array();
	var TempArr02 = new Array();
	var val = document.getElementById("inputCode").value;
	TempArr01 = val.split("\n");
	for ( var i = 0; i < TempArr01.length; i++) {
		TempArr02[i] = TempArr01[i].split(",");
	}
	;
	Realrecord = new Array();
	document.getElementById("result").innerHTML = "";
	for ( var i = 0; i < TempArr02.length; i++) {
		ArrForDecod[i] = TempArr02[i];
		Realrecord[i] = ArrForDecod[i];
		document.getElementById("result").innerHTML += "<hr><input type='button' name='' value='decode to matrix("
				+ i
				+ ")' onclick='decTomatrix("
				+ i
				+ ")'>&nbsp; &nbsp; &nbsp; " + TempArr02[i].join(",");
	}
	;

	var resultHeight = document.getElementById("result").offsetHeight;
	resultHeight = resultHeight + sero * 12;
	document.getElementById("Tbox").style.top = resultHeight + "px";
}
function decTomatrix(num) {
	var sbcount = 0;
	for ( var i = 0; i < garo; i++) {
		var insidei = i;
		for ( var j = 0; j < sero; j++) {
			if (ArrForDecod[num][i].charAt(j) == 0) {
				document.getElementById("test" + insidei).style.backgroundColor = baseColor;
			} else {
				document.getElementById("test" + insidei).style.backgroundColor = hitColor;
			}
			insidei += Number(garo);
		}
	}
	;
	sbcount++;
}
var slidingArr01 = new Array();
var slidingArr02 = new Array();
function slidingLeft(num) {

	if (slidingCount == garo * 2 + 1) {
		slidingCount = 0;
	}
	var newSero = "";
	for ( var i = 0; i < sero; i++) {
		newSero += "0";
	}
	;
	slidingArr02 = Realrecord[num].slice();
	for ( var i = 0; i < garo; i++) {
		slidingArr01[i] = newSero;
	}
	;

	if (slidingCount < Number(garo) + 1) {
		slidingArr01 = slidingArr01.slice(0, garo - slidingCount);
		slidingArr02 = slidingArr02.slice(0, slidingCount);
		slidingArr01 = slidingArr01.concat(slidingArr02);
	} else {
		slidingArr02 = slidingArr02.slice((slidingCount - garo), garo);
		slidingArr01 = slidingArr01.slice(0, (slidingCount - garo));
		slidingArr01 = slidingArr02.concat(slidingArr01);
	}
	slidingCount++;
	for ( var i = 0; i < garo; i++) {
		var insidei = i;
		for ( var j = 0; j < sero; j++) {
			if (slidingArr01[i].charAt(j) == 0) {
				document.getElementById("test" + insidei).style.backgroundColor = baseColor;
			} else {
				document.getElementById("test" + insidei).style.backgroundColor = hitColor;
			}
			insidei += Number(garo);
		}
	}
	;
}
var slidingArr03 = new Array();
var slidingArr04 = new Array();
function slidingRight(num) {

	if (slidingCount == garo * 2 + 1) {
		slidingCount = 0;
	}
	var newSero = "";
	for ( var i = 0; i < sero; i++) {
		newSero += "0";
	}
	;
	slidingArr04 = Realrecord[num].slice();
	for ( var i = 0; i < garo; i++) {
		slidingArr03[i] = newSero;
	}
	;
	if (slidingCount < Number(garo) + 1) {
		slidingArr03 = slidingArr03.slice(0, slidingCount);
		slidingArr04 = slidingArr04.slice(0, garo - slidingCount);
		slidingArr03 = slidingArr03.concat(slidingArr04);
	} else {
		slidingArr04 = slidingArr04.slice(garo - (slidingCount - garo), garo);
		slidingArr03 = slidingArr03.slice(0, garo - (slidingCount - garo));
		slidingArr03 = slidingArr04.concat(slidingArr03);
	}
	slidingCount++;

	for ( var i = 0; i < garo; i++) {
		var insidei = i;
		for ( var j = 0; j < sero; j++) {
			if (slidingArr03[i].charAt(j) == 0) {
				document.getElementById("test" + insidei).style.backgroundColor = baseColor;
			} else {
				document.getElementById("test" + insidei).style.backgroundColor = hitColor;
			}
			insidei += Number(garo);
		}
	}
	;
}
var Leftstate = true;
var Rightstate = true;
function Leftplay(num) {
	if (Leftstate == true) {
		id = setInterval('slidingLeft(' + num + ')', fspd);
		Leftstate = false;
	} else {
		clearInterval(id);
		Leftstate = true;
	}
}
function Rightplay(num) {
	if (Rightstate == true) {
		id2 = setInterval('slidingRight(' + num + ')', fspd);
		Rightstate = false;
	} else {
		clearInterval(id2);
		Rightstate = true;
	}
}
