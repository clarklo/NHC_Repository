package com.web.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.www.ProcessUserMan;
import util.page;

public class UserList extends HttpServlet {

	
	public UserList() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	
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
        
		/**
		 * �H�U�Ѽƥ�userList.jsp�����ǹL�Ӫ��d�߱��
		 */
		String check=request.getParameter("check");//�f�֪��A
		String loginname=request.getParameter("loginname");//�n��W
		String userid=request.getParameter("userid");
		//�H�U�Ѽƥ�userList.jsp�����ǹL�Ӫ��ƧǰѼ�
		//String order=request.getParameter("order");//0�����ӤH�n���ƧǡA�������]�I�Ƨ�
		//�H�U���f�ַ|��
		String flag=request.getParameter("flag");
		String id=request.getParameter("id");
		ProcessUserMan pu=new ProcessUserMan();
		if(flag!=null&&!"".equals(flag)&&"0".equals(flag))
			pu.allowLogin(id);
		else if(flag!=null&&!"".equals(flag)&&"1".equals(flag))
			pu.noLogin(id);
		
		//�c�ySQL�y�y
		String sql="select user_man_id,user_man_loginname,user_man_name,user_man_mobile," +
				"user_man_email,user_man_flag from user_man where 1=1 ";
		//##mysql##String sql="select user_man_id,user_man_loginname,user_man_name,user_man_mobile," +
		//##mysql##		"user_man_email,user_man_flag from user_man where 1=1 ";
		if(check!=null&&!"".equals(check)&&!"�п��".equals(check))
			sql=sql+" and user_man_flag="+check;
		if(loginname!=null&&!"".equals(loginname))
			sql=sql+" and user_man_loginname='"+loginname+"' ";
		if(userid!=null&&!"".equals(userid))
			sql=sql+" and user_man_id='"+userid+"' ";
		/*if(order!=null&&!"".equals(order)&&"0".equals(order)&&!"�п��".equals(order))
			sql=sql+" order by user_man_score desc";
		else if(order!=null&&!"".equals(order)&&"1".equals(order))
			sql=sql+" order by user_man_coin desc";*/
		 sql=sql+"order by user_man_id desc";
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
		
		
		request.setAttribute("check",check);
		request.setAttribute("loginname",loginname);
		request.setAttribute("userid",userid);
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