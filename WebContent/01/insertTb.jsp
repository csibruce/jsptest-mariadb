<%@page import="service.TbserviceImpl"%>
<%@page import="service.Tbservice"%>
<%@page import="vo.tbVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	request.setCharacterEncoding("UTF-8");

	String tb_writer = request.getParameter("tb_writer");
	String tb_title = request.getParameter("tb_title");
	String tb_content = request.getParameter("tb_content");
	String tb_pass = request.getParameter("tb_pass");
	tb_content = tb_content.replace("\r\n", "<br>");
	
	tbVO tbinfo = new tbVO();
	tbinfo.setTb_writer(tb_writer);
	tbinfo.setTb_title(tb_title);
	tbinfo.setTb_content(tb_content);
	tbinfo.setTb_pass(tb_pass);
	
	Tbservice service = TbserviceImpl.getInstance();
	String tb_write = service.insertTb(tbinfo);
	
	response.sendRedirect("/jsptest/01/tblist.jsp");

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	tb_writer = <%=tb_writer %><br>
	tb_pass = <%=tb_pass %><br>
	tb_title = <%=tb_title %><br>
	tb_content = <%=tb_content %><br>
</body>
</html>