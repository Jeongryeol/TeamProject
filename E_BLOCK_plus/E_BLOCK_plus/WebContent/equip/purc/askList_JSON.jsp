<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList, java.util.HashMap" %>
<%@ page import="com.google.gson.Gson" %>
<%
       
	List<Map<String,Object>> list = (List<Map<String,Object>>)request.getAttribute("rList");
	Map<String,Object> pMap = new HashMap<String,Object>();
	pMap.put("data", list);
	Gson gs = new Gson();
	String json = gs.toJson(pMap);
	out.println(json);
%>