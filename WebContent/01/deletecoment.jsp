<%@page import="service.TbserviceImpl"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="service.Tbservice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Map<String, String> deleteinfo = new HashMap<String, String>();
	String tb_pass = request.getParameter("tb_pass");
	String tb_seq = request.getParameter("tb_seq");
	deleteinfo.put("tb_seq", tb_seq);
	deleteinfo.put("tb_pass", tb_pass);
	
	Tbservice service = TbserviceImpl.getInstance();
	String checkpass = service.checkpass(deleteinfo);
	
	if(checkpass == null){
		String message = "wrong";
		response.sendRedirect("/jsptest/01/tblist.jsp?message="+message);
	}else{
		service.deletecoment(deleteinfo);
		String message="done";
		response.sendRedirect("/jsptest/01/tblist.jsp?message="+message+"&open="+request.getParameter("open"));
	}
	//int deleteCnt = service.deletetb(deleteinfo);
	
%>

 