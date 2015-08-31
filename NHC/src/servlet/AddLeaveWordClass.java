package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.www.*;
import www.LeaveWordClass;
import www.ProcessLeaveWordClass;

public class AddLeaveWordClass extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddLeaveWordClass() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		response.setContentType("text/html,charset=UTF-8");
		PrintWriter out = response.getWriter();
	    
		boolean check=true;
		
		String id=request.getParameter("id");
		String className=request.getParameter("className");
		String act=request.getParameter("act");
		String path="leavewordClass.jsp";
		
		ProcessLeaveWordClass plwc=new ProcessLeaveWordClass();
		LeaveWordClass leavewordClass=new LeaveWordClass();
		
		
		leavewordClass.setL_class_name(className);
		plwc.setLWC(leavewordClass);
		
		if("del".equals(act))
		{   leavewordClass.setL_class_id(id);
			if(plwc.LeaveWordIsExist(id))
			{
				out.write("<script language=\"javascript\">\r\n");
			      out.write("alert(\"�����O�U����ơA�Х�R�������O�U�������T��\");\r\n");
			      out.write("history.go(-1);\r\n");
			      out.write("</script>\r\n");
			      check=false;
			}
			else
			{
				plwc.delOneDate(id);
				if(plwc.isStatus()==false)  
				{
					  out.write("<script language=\"javascript\">\r\n");
				      out.write("alert(\""+plwc.getMsg()+"\");\r\n");
				      out.write("history.go(-1);\r\n");
				      out.write("</script>\r\n");
				      check=false;
				}
				
			}
			
			
		}
		else if("mod".equals(act))
		{     leavewordClass.setL_class_id(id);
			  plwc.updateLeaveWordClass();
			  if(plwc.isStatus()==false)
				{
					  out.write("<script language=\"javascript\">\r\n");
				      out.write("alert(\""+plwc.getMsg()+"\");\r\n");
				      out.write("history.go(-1);\r\n");
				      out.write("</script>\r\n");
				      check=false;
				}
			
		}
		else
		{
			
			plwc.addLeaveWordClass();
			if(plwc.isStatus()==false)
			{
				  out.write("<script language=\"javascript\">\r\n");
			      out.write("alert(\""+plwc.getMsg()+"\");\r\n");
			      out.write("history.go(-1);\r\n");
			      out.write("</script>\r\n");
			      check=false;
			}
		}
		if(check)
			response.sendRedirect(path);
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}