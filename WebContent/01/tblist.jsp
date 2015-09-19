<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.TbserviceImpl"%>
<%@page import="service.Tbservice"%>
<%@page import="vo.tbVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%		
 		//가져올 게시글 범위를 정해주는 맵
 		Map<String, String> num = new HashMap<String, String>();

        
 		//가져올 게시글이 담길 리스트
 		 List<tbVO> tblist = new ArrayList<tbVO>();
		 Tbservice service = TbserviceImpl.getInstance();
		//검색값 초기화
			String search_val = "";
	 		if(request.getParameter("search_val")!=null){
	 			search_val = request.getParameter("search_val");
	 			
	 		}
	 	//총 게시글 카운트
		 	String totalCnt = service.countTotal();
		 	int tbCnt = Integer.parseInt(totalCnt)+1;
 	     
	   //탭이동시 가져올 게시글 범위설정	
       if(request.getParameter("start")!=null){
    	num.clear();
    	num.put("start", request.getParameter("start"));
    	num.put("end", request.getParameter("end"));
       }else{
    	   //초기 게시판리스트 범위설정
    	   //오라클에선 start, end사용.
    	   //MariaDB에선 end만 사용함.
		 	num.put("start", Integer.toString(tbCnt));
    	    num.put("end", Integer.toString(tbCnt-11));
    	    request.setAttribute("start", Integer.toString(tbCnt));
    	    request.setAttribute("end", Integer.toString(tbCnt-11));
    	    
       }
	   		//리스트에 검색결과값을 뿌려줄지 or 순차적으로 뿌려줄지..
		 	if(search_val.equals("")){
				  tblist = service.selectAllTb(num);	
			}else{ 
			      //쿼리전 검색값 설정
				  search_val = "%".concat(search_val).concat("%");
			      
			      //검색일치값 카운트 쿼리전송
			      String findCnt = service.findquery(search_val);
			      if(Integer.parseInt(findCnt)<10){			      
				  	tblist = service.selectSearch(search_val);
			      }else{
			    	  tblist = service.selectAllTb(num);	
			      }
			      findCnt = "0";
			}
		 //Tbservice service = TbserviceImpl.getInstance();
 
 %>   
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
	font-size:15px;
}
.tb_seq{
	width: 49px;
	height: 19px;
	text-align: center;
}
.tb_writer{
	width: 97px;
	height: 19px;
	text-align: center;
	font-size: 12px;
	font-weight: bold;
}
.tb_title{
	width: 493px;
	height: 19px;
	font-weight: bold;
}
.tb_title:hover{
	width: 493px;
	height: 19px;
	font-weight: bold;
	text-decoration: underline;
}
.tb_date{
	width: 121px;
	height: 19px;
	font-size: 12px;
}
.tb_btnarea{
	text-align: right;
	background-color: white;
}

#contentarea{
	padding : 10px;
	font-size:12px;
}
#delete{
	text-align:center;
	font-size:15px;
	font-weight:bold;
	background-color: lightyellow;
}
#passinput{
	width: 60px;
}
.contentarea td{
	border: 1px solid black;
}
.coment{
	font-size: 10px;
	color: blue;
	font-weight: bold;
}
.coment span{
	color : gray;
	font-weight: bold;
	font-size: 11px;
	
}
.coment input{
	font-size: 10px;
	border : none;
	height: 12px;
}
tbody #titlerow:nth-child{
	background-color: lightgray;
}
.red {
	color: red;
}
.blackandwhite{
	background-color: black;
	color: white;
}
hr{
	border :0;
	background-color : black;
	height: 3px;
	
}
.center{
	text-align: center;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">

	$(function(){
		$('thead td').css('background', 'black').css('color', 'white');
		$('table').width(800);
		//$('tbody #titlerow:nth-child(odd)').css('background', 'lightgray');
		$('.white').css('background','white').css('text-align','right');
	})
	var precontent = 0;
	function showcontent(no){
		var textno = "tbody #textno"+no;
		//alert(textno);
		if(precontent != 0 ){
		var txtnopre = "#textno"+precontent;
		//$(txtnopre).css('display','none');
		}
		if(precontent == no){
			$(textno).css('display','none');
			precontent = precontent-1;
		}else{
			$(textno).css('display','');
			precontent = no;	
		}
		
	}
	function checkpass(seq){
		var ff = "#"+seq;
		if($(ff).attr('action')=="/jsptest/01/delete.jsp"){
			var c = confirm('정말 삭제하시겠습니까?');
			if(c==true){
				
			}else{
				return false;
			}
		};
		var elem = "#"+seq+" #passinput";
		if($(elem).val()==null ||$(elem).val()==""){
			alert("비밀번호를 입력하세요");
			return false;
		}
		return true;
	}
	function checkmessage(){

		if('<%=request.getParameter("open")%>'!='null'){
			//alert('<%=request.getParameter("open")%>');
			var openrow = '<%=request.getParameter("open")%>';
			//alert(openrow);
			var row = "tbody #textno"+openrow;
			//alert(row);
			$(row).show();
		}
		if('<%=request.getParameter("message")%>'=='wrong'){
			alert("잘못된 비밀번호입니다");
		}
		if('<%=request.getParameter("message")%>'=='done'){
			alert("삭제가 완료되었습니다.");
		}
	}
	function delecteQ(){
		var r = confirm("정말 삭제하시겠습니까?");
	    if (r == true) {
	       location.href = "/jsptest/01/delete.jsp";
	    } else {
	    }
	}
	function linechanger(get){
		get.tb_content;
	}
</script>
</head>
<body onload="checkmessage()">

<table>
<thead>
	<tr>
		<td class="white" colspan="4">
		<form action="<%=request.getContextPath()%>/01/tblist.jsp">
		<input type="text" name="search_val" placeholder="search">
		<input class="" type="submit" value="search">
		</form>
		</td>
	</tr>
	<tr>
		<td class="tb_seq">글번호</td>
		<td class="tb_writer">글쓴이</td>
		<td class="tb_title">제목</td>
		<td class="tb_date">날짜</td>
		<td style="display: none">비번</td>
		<td class="tb_check" style="display:none">체크</td>
	</tr>
</thead>
<tbody>
	<!-- 글 제목리스트 -->
	<% for (tbVO tvo : tblist) { 
	if(Double.parseDouble(tvo.getTb_seq())%1==0){
		int seq = (int)Double.parseDouble(tvo.getTb_seq());
	%>
	<tr id="titlerow">
		<td class="tb_seq"><%=seq%></td>
		<td class="tb_writer"><%=tvo.getTb_writer()%></td>
		<td class="tb_title" id="titlecoment<%=seq%>" onclick="showcontent(<%=seq%>)" style="cursor:pointer"><%=tvo.getTb_title() %></td>
		<td class="tb_date"><%=tvo.getTb_date() %></td>
		<td style="display: none"><%=tvo.getTb_pass()%></td>
		<td class="tb_check" style="display:none"><input type="checkbox" name="" value="<%=tvo.getTb_seq()%>" placeholder=""></td>
	</tr>
	<tr class="contentarea" id="textno<%=seq%>" style="display:none">
		<td colspan="2"></td>
		<td id="contentarea" colspan="1"><div id="content<%=seq%>"><%=tvo.getTb_content()%></div></td>
		<td id="delete">
			비밀번호입력<br>
			<form id="<%=seq%>" action="" method="post" onsubmit="return checkpass(<%=seq%>)">
			<input type="hidden" name="tb_seq" value="<%=seq%>">
			<input type="password" id="passinput" name="tb_pass" value="" placeholder="password"><br>
			<input type="submit" name="" value="삭제" onclick="javascript:form.action='/jsptest/01/delete.jsp'">
			<input type="submit" name="" value="수정" onclick="javascript:form.action='/jsptest/01/updatecheck.jsp'">
			</form>
		</td>
	</tr>
	<%
	int cnt = 0;
	for(tbVO tv : tblist){
		if(Double.parseDouble(tv.getTb_seq())>seq &&Double.parseDouble(tv.getTb_seq())<(seq+1)){
		cnt++;
			
	%>
	<!-- 댓글이 있으면 댓글이 달린다. -->
	<form action="/jsptest/01/deletecoment.jsp">
	<tr id="textno<%=seq%>" style="display: none">
		<td colspan="2"></td>
		<td class="coment"><%=cnt%>. <span>작성자:</span> <%=tv.getTb_writer()%>&nbsp; &nbsp;
		<input type="hidden" name="open" value="<%=seq%>">
		<input type="hidden" name="tb_seq" value="<%=seq%>">
		<input type="password" name="tb_pass" size="8" placeholder="password">
		<input class="blackandwhite" type="submit" value="삭제"><br>&nbsp; &nbsp; &nbsp; &nbsp;
		<span>내용:</span> <%=tv.getTb_content()%>  [<%=tv.getTb_date() %>]</td>
		<td></td>
	</tr>
	</form>
	<%}}%>
	<script>
		$('#titlecoment<%=seq%>').append('<%=cnt%>'=='0'?'':' <span class="red">[<%=cnt%>]</span>');
	</script>
	<%
	cnt = 0;
	%>
	<tr id="textno<%=seq%>" style="display: none"><td colspan="2"></td><td><hr></td><td></td></tr>
	<tr	class="coment" id="textno<%=seq%>" style="display: none">
		<td colspan="2"></td>
		<td>
		<form action="/jsptest/01/insertComent.jsp" onsubmit="linechager(this)">
			<input type="hidden" name="count" value="<%=tvo.getCount()%>">
			<input type="hidden" name="tb_seq" value="<%=seq%>">
			<input type="hidden" name="start" value="<%=request.getParameter("start")==null?request.getAttribute("start"):request.getParameter("start")%>">
			<input type="hidden" name="end" value="<%=request.getParameter("end")==null?request.getAttribute("end"):request.getParameter("end")%>">
			이름 <input type="text" name="tb_writer" value="" placeholder="name"> 
			비밀번호 <input type="password" name="tb_pass" value="" placeholder="password"><br>
			내용:<textarea rows="3" cols="45 " name="tb_content" placeholder="content"></textarea><input class="blackandwhite" type="submit" value="댓글달기">
		</form>
		</td>
		<td></td>
	</tr> 
	<%}else{ %>
	
	
	<%}} %>
	<tr>
		<td class="tb_btnarea" colspan="4"><input class="blackandwhite" type="button" value="write" onclick="javascript:location.href='/jsptest/01/testboard.jsp'"></td>
	</tr>
	<tr>
		<td class="center" colspan="4">
		<%
		int tabs = ((int)tbCnt/10)+1;
		int start = tbCnt;
		int end = start-11;
		for(int i=1; i<tabs+1;i++){
		%> 
			<a href="<%=request.getContextPath()%>/01/tblist.jsp?start=<%=start%>&end=<%=end%>"><%=i%></a>	
			
		<%start-=10;end-=10;if(end<0){end=0;}} %>	
		</td>
	</tr>
</tbody>
</table>


</body>
</html>