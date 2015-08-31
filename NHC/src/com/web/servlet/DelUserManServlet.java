package com.web.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.www.ProcessUserMan;
import util.page;
public class DelUserManServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DelUserManServlet() {
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

		String id[]=request.getParameterValues("id");
		
		ProcessUserMan pum = new ProcessUserMan();
		pum.delUserMan(id);
		
		String sql="select user_man_id,user_man_loginname,user_man_name,user_man_mobile," +
		"user_man_email,user_man_flag from user_man where 1 ";
		
		 sql=sql+" order by user_man_id desc";
		 int row = 15;
	     String pages = request.getParameter("pgnum");
	     pages = pages != null ? pages : "1";
	     page pg = new page(row, sql);
	     int cupage = Integer.parseInt(pages);
	     int Maxpage = pg.getMaxpage();
	     int counts=pg.getCounts();
	     java.util.Vector v = pg.getData(cupage);

	     String Maxpagenum = Integer.toString(Maxpage);
	     request.setAttribute("Info", v);
	     request.setAttribute("Curpage", pages);
	     request.setAttribute("Maxpage", Maxpagenum);
	     request.setAttribute("Counts", Integer.toString(counts));
		System.out.println("UserList:sql:"+sql);
		
		
		//request.setAttribute("check",check);
		//request.setAttribute("loginname",loginname);
		//request.setAttribute("userid",userid);
		//request.setAttribute("order",order);
		 String path="userList.jsp";
	     RequestDispatcher requestDispatcher = request.getRequestDispatcher(path);
	     requestDispatcher.forward(request, response);
		
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
