package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.www.*;
import util.page;

public class LeaveWordList1 extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LeaveWordList1() {
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

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		LeaveWord1 lw = new LeaveWord1();
		ProcessLeaveWord1 plw = new ProcessLeaveWord1();
		/**
		 * �H�U�Ѽƥ�leavewordList1.jsp�����ǹL�Ӫ��d�߱��
		 */
		String l_class=request.getParameter("class");//���d�����O�ӷj��
		String isreply=request.getParameter("isreply"); //���O�_�^�ƨӷj�� �Y��"0"�h�O�����^�Ʒj���A�O"1"�h���w�^�ƨӷj��
		String reply=request.getParameter("reply");
		String id=request.getParameter("id");
		String act=request.getParameter("act");
		if(!"".equals(reply) && reply!=null)
		{
			
			
			lw=plw.getOneDate(id);
			lw.setL_reply(reply);
			lw.setL_isreply("1");
			plw.updateLeaveWord();
		     
			
		}
		if(!"".equals(act)&&act!=null&&"del".equals(act))
		{
			String []lid=request.getParameterValues("list");
			System.out.println("lid="+lid);
			plw.delLeaveWord(lid);
		}
		String path="leavewordList1.jsp";
		
		
		
		//�c�ySQL�y�y
		String sql="select l_id,l_title,l_user,l_email,l_time,l_isreply from leaveword1 where 1 ";
		if(l_class!=null&&!"".equals(l_class)&&!"0".equals(l_class))
			sql=sql+" and l_class_id='"+l_class+"' ";
		if(isreply!=null&&!"".equals(isreply))
			sql=sql+" and l_isreply='"+isreply+"' ";
		sql=sql+" order by l_id desc";
		
		
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
		
		request.setAttribute("l_class",l_class);
		request.setAttribute("isreply",isreply);
		
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