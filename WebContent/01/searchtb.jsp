<%@page import="vo.tbVO"%>
<%@page import="java.util.List"%>
<%@page import="service.TbserviceImpl"%>
<%@page import="service.Tbservice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String search_val = request.getParameter("search_val");
	if(search_val!=null){
	Tbservice service = TbserviceImpl.getInstance();
	List<tbVO> tblist = service.selectSearch(search_val);
	}

%>