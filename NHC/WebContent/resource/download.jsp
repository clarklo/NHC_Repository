<%@page import="www.DocDown"%>
<%@page import="www.ProcessDocDown"%>
<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ page import ="com.jspsmart.upload.SmartUpload"%>
<%@ page import="com.web.www.*" %>
<%

		                  HttpSession Session = request.getSession(true);
		                  String loginname=(String)Session.getAttribute("loginname");
		                  String password =(String)Session.getAttribute("password");
		                  String cid =request.getParameter("cid");
		                  ProcessUserMan  pum = new ProcessUserMan();
		                  
		                  //if("166".equals(cid))
						   if(false)
		                  {   
                              if("".equals(loginname)||loginname==null||loginname.length()<0)
                                 out.println("<script language=javascript> alert('您還未登入，請先登入!'); location.href='../user/login.jsp';</script>");
		                   //   else if(!pum.ischeck(loginname,password))
		                   //      out.println("<script language=javascript> alert('您還未經過審核，請耐心等候!'); history.go(-1);</script>");
		                      else
		                      {
		                         try
		   			        {
			   			      SmartUpload su=new SmartUpload();
			   			      String id=request.getParameter("id");
			   			      su.initialize(pageContext);
			   			      su.setContentDisposition(null);
			   			      ProcessDocDown pdd=new ProcessDocDown();
						      out.clear();
			   			      pdd.getOneDate(id);
			   			      DocDown dd=pdd.getDocDown();
			   			      String file=dd.getDown_document();
			   			      String Path = request.getRealPath("/");
						      String url=Path+"\\upload\\files\\"+file;
			   			      //System.out.println("url:"+url);
			   			      su.downloadFile(url);
		   				  
		   			         }
		   			      catch(Exception e)
		   			     {
		   				    out.println("您所訪問的檔案不存在!");
		   			     }
		                      }
		                  }
		                  else
		                  {
		  		          try
		   			        {
			   			      SmartUpload su=new SmartUpload();
			   			      String id=request.getParameter("id");
			   			      su.initialize(pageContext);
			   			      su.setContentDisposition(null);
			   			      ProcessDocDown pdd=new ProcessDocDown();
						      out.clear();
			   			      pdd.getOneDate(id);
			   			      DocDown dd=pdd.getDocDown();
			   			      String file=dd.getDown_document();
			   			      String Path = request.getRealPath("/");
						      String url=Path+"\\upload\\files\\"+file;
			   			      //System.out.println("url:"+url);
			   			      su.downloadFile(url);
		   				  
		   			         }
		   			      catch(Exception e)
		   			     {
		   				    out.println("您所訪問的檔案不存在!");
		   			     }
		   			   }	
	
%>