<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.sql.*"%>
<%@ page import="com.web.www.*"%>
<%@ page import="com.web.util.DealString"%>
<%     
	   String act = request.getParameter("act"); 
	   DealString ds = new DealString();
	   Commander comm = new Commander();
	   ProcessCommander pc= new ProcessCommander();
		if("add".equals(act))
	    {
	    	String com_name = ds.toString(request.getParameter("u_name"));
	    	String com_sex= ds.toString(request.getParameter("u_sex"));
	    	String com_birth= ds.toString(request.getParameter("u_age"));
	    	String com_cid = ds.toString(request.getParameter("u_ic"));
	    	String com_people  = ds.toString(request.getParameter("u_pepole"));
	    	String com_marri  = ds.toString(request.getParameter("u_marriage"));
	    	String com_study = ds.toString(request.getParameter("u_sch_age"));
	    	String com_speci = ds.toString(request.getParameter("u_speciality")); 
	    	String com_school  = ds.toString(request.getParameter("u_school"));
	    	String com_expe = ds.toString(request.getParameter("u_exper"));
	    	String com_story   = ds.toString(request.getParameter("u_story"));
	    	String com_linker    = ds.toString(request.getParameter("u_relation"));
	    	String com_tel= ds.toString(request.getParameter("u_tel"));
	    	String com_mobile   = ds.toString(request.getParameter("u_mobile"));
	    	String com_index  = ds.toString(request.getParameter("u_index"));
	    	String com_oicq = ds.toString(request.getParameter("u_oicq"));
	    	String com_addr=ds.toString(request.getParameter("u_addr"));
	    	
	    	comm.setCom_addr(com_addr);
	    	comm.setCom_birth(com_birth);
	    	comm.setCom_cid(com_cid);
	    	comm.setCom_exp(com_expe);
	    	comm.setCom_index(com_index);
	    	comm.setCom_linker(com_linker);
	    	comm.setCom_marri(com_marri);
	    	comm.setCom_mobile(com_mobile);
	    	comm.setCom_name(com_name);
	    	comm.setCom_oicq(com_oicq);
	    	comm.setCom_people(com_people);
	    	comm.setCom_school(com_school);
	    	comm.setCom_sex(com_sex);
	    	comm.setCom_spe(com_speci);
	    	comm.setCom_story(com_story);
	    	comm.setCom_study(com_study);
	    	comm.setCom_tel(com_tel);
	    	
	    	pc.setCom(comm);
	    	pc.addCommander();
	    	
	    	if(!pc.isStatus())
	    	{
	    		out.write("<script>");
	    		out.write("alert("+pc.getMsg()+");");
	    		out.write("history.go(-1);");
	    		out.write("</script>");
	    		return;
	    	}
	    	else
	    	{
	    		out.write("<script>");
	    		out.write("alert('訊息提交成功﹗');");
	    		out.write("location.href='../index.jsp';");
	    		out.write("</script>");
	    	}
	    }



%>
