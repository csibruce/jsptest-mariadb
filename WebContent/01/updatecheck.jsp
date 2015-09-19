<%@page import="service.TbserviceImpl"%>
<%@page import="service.Tbservice"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

		Map<String, String> updateinfo = new HashMap<String, String>();
		String tb_pass = request.getParameter("tb_pass");
		String tb_seq = request.getParameter("tb_seq");
		updateinfo.put("tb_seq", tb_seq);
		updateinfo.put("tb_pass", tb_pass);
		
		Tbservice service = TbserviceImpl.getInstance();
		String checkpass = service.checkpass(updateinfo);
		
		if(checkpass == null){
			String message = "wrong";
			response.sendRedirect("/jsptest/01/tblist.jsp?message="+message);
		}else{
			response.sendRedirect("/jsptest/01/updateform.jsp?tb_seq="+tb_seq);
		}

%>