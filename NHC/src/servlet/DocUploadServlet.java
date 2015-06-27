package servlet;

import java.io.IOException; 
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.web.www.DocDown;
import com.web.www.ProcessDocDown;

public class DocUploadServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DocUploadServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	private ServletConfig config;

	final public void init(ServletConfig config) throws ServletException
	{
		this.config = config;
	}

	final public ServletConfig getServletConfig()
	{
		return config;
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

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		SmartUpload su = new SmartUpload();	
		String filename="";
		String path="docupload.jsp";
		ProcessDocDown pdd=new ProcessDocDown();
		DocDown dd=new DocDown();
		
		try
		{
			su.initialize(config,request,response);
			su.upload();
			String act=su.getRequest().getParameter("act");
			dd.setDown_id(su.getRequest().getParameter("id"));
			dd.setDown_title(su.getRequest().getParameter("downName"));
			dd.setDown_flag(su.getRequest().getParameter("menu"));
			
			
			Calendar calendar = Calendar.getInstance();
			filename=calendar.get(Calendar.YEAR)+""+(calendar.get(Calendar.MONTH)+1)+
			calendar.get(Calendar.DAY_OF_MONTH)+calendar.get(Calendar.MINUTE)+
			calendar.get(Calendar.SECOND);
			String realPath=request.getRealPath("/")+"upload\\files\\";
			
			File file=su.getFiles().getFile(0);
			file.saveAs("/upload/files/"+filename+"."+file.getFileExt());
			filename=filename+"."+file.getFileExt();
			if(!file.isMissing())
			{
				if(!"exe".equals(file.getFileExt())&&!"dll".equals(file.getFileExt()))
					 dd.setDown_document(filename);
				else
				  {
					  out.write("<script language=\"javascript\">\r\n");
					  out.write("alert(\"文檔格式不正確，請重新輸入﹗\");\r\n");
				      out.write("history.go(-1);\r\n");
				      out.write("</script>\r\n");
				      return;
				  }
			}

			pdd.setDocDown(dd);
			if("add".equals(act))
				{
					if(file.isMissing())
					{
						
						  out.write("<script language=\"javascript\">\r\n");
					      out.write("alert(\"請上傳文檔﹗\");\r\n");
					      out.write("history.go(-1);\r\n");
					      out.write("</script>\r\n");
					      return;
					}
					else
						pdd.addDocDown();
				}
			else if("mod".equals(act))
				{
					 if(file.isMissing())//用戶改時沒有修改文檔
					    {      // System.out.println("111111111111111111111");
							pdd.updateDocDownNoDoc();
							//System.out.println("222222222222222222222");
					    }	
					else 						//用戶修改時修改了文檔
						{
												
							String oldaddress=dd.getDown_document();
							realPath=realPath+java.io.File.separator+oldaddress;
							java.io.File f=new java.io.File(realPath);
							if(f.exists())
								f.delete();
							
							pdd.updateDocDown();
							
						}
				}
			}
			catch(Exception e)
			{
				System.out.println("uploadException :"+e.getMessage());
			}
				
			
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