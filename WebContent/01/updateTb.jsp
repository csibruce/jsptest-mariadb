<%@page import="service.TbserviceImpl"%>
<%@page import="service.Tbservice"%>
<%@page import="vo.tbVO"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	tbVO tbinfo = new tbVO();
	String tb_content = request.getParameter("tb_content");
	//tb_content = tb_content.replace("\r\n", "<br>");
	try{
		BeanUtils.populate(tbinfo, request.getParameterMap());
	}catch(IllegalArgumentException e){
		e.printStackTrace();
	}
	
	Tbservice service = TbserviceImpl.getInstance();
	int updateCnt = service.updatetb(tbinfo);
	
	response.sendRedirect("/jsptest/01/tblist.jsp");
	
%>