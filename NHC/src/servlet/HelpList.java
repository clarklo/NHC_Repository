package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.util.page;

public class HelpList extends HttpServlet {

	/**
	 * 顯示三級欄目清單
	 */
	public HelpList() {
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

		String classid=request.getParameter("classid");
		String sql="select cms_class_id,cms_class_name,cms_class_fatid from cms_class where cms_class_fatid="+classid;
		System.out.println("sql:"+sql);
		String pages = request.getParameter("pgnum");
		 
	    int row=4;
	    String path="helpList.jsp";
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