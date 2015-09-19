<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>도트메트릭스 코딩프로그램</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/matrix.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/matrixforjQuery.js"></script>
</head>
<body>
<h1>Dot matrix array maker</h1>
<form action="" name="F1">
	Cols: <input class="inp" type="text" name="dotcol" value="" placeholder="">
	Rows: <input class="inp" type="text" name="dotrow" value="" placeholder="">
	<input type="button" onclick="building()" name="" value="make">
	<input type="button" onclick="Clear()" name="" value="clear">
            <!--input class="colors" type="text" name="exBg" value="" placeholder="type color string in CSS">
            <input type="button" onclick="exBgc()" name="" value="bgcolor change"-->

              <!--input class="colors" type="text" name="exHit" value="" placeholder="type color string in CSS"-->
              <!--select name="exHit" id="" size="1" onchange="exHitc()">
                  <option value="black">black</option>
                  <option value="red">red</option>
                  <option value="green">green</option>
                  <option value="blue">blue</option>
                  <option value="pink">pink</option>
                  <option value="lightgreen">lightgreen</option>
                  <option value="lightblue">lightblue</option>
                  <option value="brown">brown</option>
              </select-->
            <input type="button" name="" value="removeLine" onclick="removeLine()">
            <br>
            <input type="button" name="" value="refresh" onclick="refresh()">
            <input type="button" name="" value="getCode" onclick="getCode()">
            <input type="button" name="" value="▶animation" onclick="animation()">
            <input class="inp" type="text" name="speedNo" value="100" placeholder="">
            <input type="button" name="" value="FrameSpeed" onclick="frameSpeed()">
            <br>
            <input type="range" name="" id="range" value="10" placeholder="size" min="10" max="30" step="2" onchange="changeSize()">
              <input type="color" name="colors" value="" placeholder="" onchange="exHitc2()">
             <input type="button" name="" value="encode" onclick="test()">(generate codeArray to textarea blow)
             <!--input type="button" name="" value="checkHeight" onclick="checkheight()"-->


	<div class="root" id="make">
                <div id="result"></div>
                <div id="Tbox">
                <!--textarea name="inputCode" id="inputCode" cols="30" rows="10"></textarea-->
                </div>
            </div>

	<!--textarea name="result" id="result" cols="50" rows="20"></textarea-->
</form>
<div id="content">
This app for making an array for 8*8 dotmatrix. it can make any size of dotmatrix as well. <br>
but it prefer to use less than 48*16. because of the memory size of browser.. <br>
you can change a color of pixels when you click it. but it(array) doen't offer for RGB-matrix. <br>
for RGB is comming soon...
</div>
<div id="ggg"></div>
</body>
</html>
