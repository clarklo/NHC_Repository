package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.www.*;
import util.DealString;
import util.page;
import www.LeaveWord;

public class OnlineQuestion extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public OnlineQuestion() {
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

		response.setContentType("text/html,charset=gb2312");
		 
		DealString ds=new DealString();
		String type=request.getParameter("type");
		String classid=ds.toString(request.getParameter("classid"));
		
		
		ProcessLeaveWord plw = new ProcessLeaveWord();
		LeaveWord lw = new LeaveWord();
		
		String path="messagelist.jsp";
		int row = 20;
	
		
		String sql="select l_id,l_title,l_user,l_time,l_content,l_reply,l_class_id from leaveword where l_isreply=1";
		System.out.println("OnlineQuestion sql="+sql);
		if(!"".equals(classid))
			sql=sql+" and l_class_id="+classid;
		
		if("add".equals(type)&&!"".equals(classid)&&classid!=null)
		{   
			String l_user=request.getParameter("user").replaceAll("<","").replaceAll(">","");
			String l_email=request.getParameter("email").replaceAll("<","").replaceAll(">","");
			String l_title=request.getParameter("title").replaceAll("<","").replaceAll(">","");
			String l_content=request.getParameter("content").replaceAll("<","").replaceAll(">","");
			
			lw.setL_class_id(classid);
			lw.setL_content(l_content);
			lw.setL_email(l_email);
			lw.setL_title(l_title);
			lw.setL_user(l_user);
			plw.setLeaveword(lw);
			plw.addLeaveWord();
			
		}
			
		 System.out.println("asdfsadfsadfsadfsadfsad");
		 sql=sql+" order by l_id desc";
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
	     request.setAttribute("classid",classid);
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
