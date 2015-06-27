<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" language="java" import="java.sql.*"%>
<%@ page import="com.web.www.*"%>
<%@ page import="com.web.util.DealString"%>
<%     
	   String act = request.getParameter("act"); 
	   DealString ds = new DealString();
	   Order or = new Order();
	   ProcessOrder po = new ProcessOrder();
		if("add".equals(act))
	    {
	    	String order_name = ds.toString(request.getParameter("name"));
	    	String order_email= ds.toString(request.getParameter("email"));
	    	String order_corpo= ds.toString(request.getParameter("enterprise"));
	    	String order_addr = ds.toString(request.getParameter("addr"));
	    	String order_tel  = ds.toString(request.getParameter("tel"));
	    	String order_fax  = ds.toString(request.getParameter("fax"));
	    	String order_post = ds.toString(request.getParameter("zip"));
	    	String order_prod = ds.toString(request.getParameter("model")); 
	    	String order_num  = ds.toString(request.getParameter("number"));
	    	String order_date = ds.toString(request.getParameter("period"));
	    	String order_q    = ds.toString(request.getParameter("Q"))+" "+ds.toString(request.getParameter("QUnit"));
	    	String order_p    = ds.toString(request.getParameter("P"))+" "+ds.toString(request.getParameter("PUnit"));
	    	String order_speed= ds.toString(request.getParameter("Rpm"))+" "+ds.toString(request.getParameter("RpmType"));
	    	String order_dia  = ds.toString(request.getParameter("JhMax"))+" "+ds.toString(request.getParameter("JhUnit"));
	    	String order_pin  = ds.toString(request.getParameter("Pin"))+" "+ds.toString(request.getParameter("PinUnit"));
	    	String order_tin  = ds.toString(request.getParameter("Tin"))+" "+ds.toString(request.getParameter("TinUnit"));
	    	String order_p2   = ds.toString(request.getParameter("JhMax2"));
	    	String order_air  = ds.toString(request.getParameter("JhMax3"));
	    	String order_dens = ds.toString(request.getParameter("Dens"))+" "+ds.toString(request.getParameter("DensUse"));
	    	String order_detail=ds.toString(request.getParameter("detail"));
	    	
	    	or.setOrder_addr(order_addr);
	    	or.setOrder_air(order_air);
	    	or.setOrder_corpor(order_corpo);
	    	or.setOrder_date(order_date);
	    	or.setOrder_dens(order_dens);
	    	or.setOrder_detail(order_detail);
	    	or.setOrder_dia(order_dia);
	    	or.setOrder_email(order_email);
	    	or.setOrder_fax(order_fax);
	    	or.setOrder_name(order_name);
	    	or.setOrder_num(order_num);
	    	or.setOrder_p(order_p);
	    	or.setOrder_p2(order_p2);
	    	or.setOrder_pin(order_pin);
	    	or.setOrder_post(order_post);
	    	or.setOrder_prod(order_prod);
	    	or.setOrder_q(order_q);
	    	or.setOrder_speed(order_speed);
	    	or.setOrder_tel(order_tel);
	    	or.setOrder_tin(order_tin);
	    	
	    	po.setOrder(or);
	    	po.addOrder();
	    	
	    	if(!po.isStatus())
	    	{
	    		out.write("<script>");
	    		out.write("alert("+po.getMsg()+");");
	    		out.write("history.go(-1);");
	    		out.write("</script>");
	    		return;
	    	}
	    	else
	    	{
	    		out.write("<script>");
	    		out.write("alert('提交成功﹗');");
	    		out.write("location.href='../index.jsp';");
	    		out.write("</script>");
	    	}
	    }



%>
