<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="vo.tbVO"%>
<%@page import="service.TbserviceImpl"%>
<%@page import="service.Tbservice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	tbVO tbinfo = new tbVO();
	try{
		BeanUtils.populate(tbinfo, request.getParameterMap());
	}catch(IllegalArgumentException e){
		e.printStackTrace();
	}
	tbinfo.setTb_content(tbinfo.getTb_content().replace("\r\n", "<br>"));
	Tbservice service = TbserviceImpl.getInstance();
	String comentName = service.insertComent(tbinfo);
	//String updateCnt = service.updateCnt
	//String totalCnt = service.countTotal();

	//RequestDispatcher rd = request.getRequestDispatcher("/01/tblist.jsp?open="+tbinfo.getTb_seq());
	//rd.forward(request, response);
	response.sendRedirect("/jsptest/01/tblist.jsp?open="+tbinfo.getTb_seq()+"&start="+request.getParameter("start")+"&end="+request.getParameter("end"));
%>