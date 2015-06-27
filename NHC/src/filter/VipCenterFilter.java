package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class VipCenterFilter implements Filter{

	 protected FilterConfig  filterConfig;
		public void doFilter(final ServletRequest request,final ServletResponse response,	FilterChain chain)throws IOException,ServletException
				{
			response.setContentType("text/html; charset=UTF-8");
			 PrintWriter out = response.getWriter();
			HttpServletRequest hreq=(HttpServletRequest)request;
					HttpServletResponse hres=(HttpServletResponse)response;
					HttpSession session=hreq.getSession();
					try
					{
						
						String loginname=(String)session.getAttribute("loginname");
						if(loginname!=null&&loginname.length()>0)
						{
							//System.out.println("驗証通過");
							chain.doFilter(request,response);
						}
						else
						{
							out.write("<script language=\"javascript\">\r\n");
						      out.write("alert(\"您還沒有登入，請先登入﹗\");\r\n");
						      out.write("window.open(\"../login/userlogin.jsp\",\"_parent\");\r\n");
						      out.write("</script>\r\n");
							//hres.sendRedirect("../login/login.jsp");
							//System.out.println("攔截非法請求!");
						}
						
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
				}

		public void init(FilterConfig filterConfig) throws ServletException {
			this.filterConfig=filterConfig;
		}

		public void destroy() {
			 this.filterConfig=null;
		}
}