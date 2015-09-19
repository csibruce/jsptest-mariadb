<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title></title>
	<link rel="stylesheet" href="">
	<style type="text/css" media="screen">
	
		#tb_writer{
			width: 100px;
			height: 19px;
			font-size: 15px;
			font-weight: bold;
			background-color: lightgray;
		}
		#tb_writerinput{
			width: 170px;
			height: 19px;
			font-size: 15px;	
		}
		#tb_pass{
			width: 100px;
			height: 19px;
			font-size: 15px;
			font-weight: bold;
			background-color: lightgray;
		}
		#tb_passinput{
			width: 170px;
			height: 19px;
			font-size: 15px;
		}
		#tb_content{
			width: 100px;
			font-size: 15px;
			font-weight: bold;
			background-color: lightgray;
		}
		#tb_contentinput{
			width: 500px;
			font-size: 12px;			
		}
		#tb_title{
			width: 100px;
			font-size: 15px;
			font-weight: bold;
			background-color: lightgray;
		}
		#tb_titleinput{
			width: 500px;
			font-size: 12px;	
		}
		#tb_btnarea{
			text-align: right;
		}
	</style>
	<script type="text/javascript">
	$(function(){
		$('input[name=tb_title]').width(500);
		$('textarea').width(500).height(300);
	})
	function checkform(elem){
		

		var str = $('textarea').val();
		//alert(str);
		
		if(elem.tb_writer.value == null || elem.tb_writer.value == ""){
			alert("작성자를 입력하세요.");
			return false;
		}
		if(elem.tb_pass.value == null || elem.tb_pass.value == ""){
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if(elem.tb_title.value == null || elem.tb_title.value == ""){
			alert("제목을 입력하세요.");
			return false;
		}
		if(elem.tb_content.value == null || elem.tb_content.value == ""){
			alert("내용을 입력하세요.");
			return false;
		}
		return true;
	}
	</script>

</head>
<body>
<form action="/jsptest/01/insertTb.jsp" method="post" accept-charset="utf-8" onsubmit="return checkform(this)">
<table>
	<caption>testboard</caption>
	<thead>
		<tr>
			<td id="tb_writer">작성자</td>
			<td id="tb_writerinput"><input type="text" name="tb_writer" value="" placeholder=""></td>
			<td id="tb_pass">비밀번호</td>
			<td id="tb_passinput"><input type="password" name="tb_pass" value="" placeholder=""></td>
		</tr>
		<tr>
			<td id="tb_title" colspan="1">제목</td>
			<td id="tb_titleinput" colspan="3"><input type="text" name="tb_title" value="" placeholder=""></td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td id="tb_content">내용</td>
			<td id="tb_contentinput" colspan="3"><textarea name="tb_content"></textarea></td>			
		</tr>
		<tr>
			<td id="tb_btnarea" colspan="4" rowspan="" headers="">
				<input type="submit" name="" value="작성">
				<input type="button" name="" value="목록" onclick="javascript:location.href='/jsptest/01/tblist.jsp'">
			</td>
		</tr>
	</tbody>
</table>
</form>	
</body>
</html>