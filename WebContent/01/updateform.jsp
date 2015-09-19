<%@page import="vo.tbVO"%>
<%@page import="service.TbserviceImpl"%>
<%@page import="service.Tbservice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Tbservice service = TbserviceImpl.getInstance();
    tbVO tbinfo = service.selectone(request.getParameter("tb_seq"));
    String content = tbinfo.getTb_content().replace("<br>", "\r\n ");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<title>Insert title here</title>
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
		
		var str = elem.tb_content.value;
		elem.tb_content.value = str.replace(/(\n|\r\n)/g, "<br>");
		//alert(elem.tb_content.value);
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
<form action="/jsptest/01/updateTb.jsp" method="post" accept-charset="utf-8" onsubmit="return checkform(this)">
<table>
	<caption>Update testboard</caption>
	<thead>
		<tr>
			<td id="tb_writer">작성자</td>
			<td id="tb_writerinput"><input type="text" name="tb_writer" value="<%=tbinfo.getTb_writer() %>" placeholder=""></td>
			<td id="tb_pass">비밀번호</td>
			<td id="tb_passinput"><input type="password" name="tb_pass" value="<%=tbinfo.getTb_pass() %>" placeholder=""></td>
		</tr>
		<tr>
			<td id="tb_title" colspan="1">제목</td>
			<td id="tb_titleinput" colspan="3"><input type="text" name="tb_title" value="<%=tbinfo.getTb_title() %>" placeholder=""></td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td id="tb_content">내용</td>
			<td id="tb_contentinput" colspan="3"><textarea name="tb_content"><%=content%></textarea></td>			
		</tr>
		<tr>
			<td id="tb_btnarea" colspan="4" rowspan="" headers="">
				<input type="hidden" name="tb_seq" value="<%=tbinfo.getTb_seq()%>">
				<input type="reset" name="" value="취소">
				<input type="submit" name="" value="수정">
				<input type="button" name="" value="목록" onclick="javascript:location.href='/jsptest/01/tblist.jsp'">
				
			</td>
		</tr>
	</tbody>
</table>
</form>	
</body>
</html>