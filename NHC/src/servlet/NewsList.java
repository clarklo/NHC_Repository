package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.page;

public class NewsList extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public NewsList() {
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

		String classid=request.getParameter("classid");
		String type=request.getParameter("type");
		System.out.println("�����J"+type);
		
		String path="../index.jsp";
		int row = 15;
		if(type.equals("news"))
			path="news.jsp";
		else if(type.equals("investment"))
			path="investment.jsp";
		else if(type.equals("scenery"))
			path="scenery.jsp";
		else if(type.equals("sceneryinfo"))
			path="scenery_info.jsp";
		else if(type.equals("project"))
			path="project.jsp";
		else 
			path="job.jsp";
			
		String sql="select cms_infodata_id,cms_infodata_name,cms_infodata_releasetime" +
				" from cms_infodata where cms_infodata_class=" +classid+
				" order by cms_infodata_id desc";
		
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