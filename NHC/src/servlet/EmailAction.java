package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.email.Email;
import com.web.util.DealString;
import com.web.www.ProcessUserMan;


public class EmailAction extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		
		response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
	
		try{
		
			String loginname=request.getParameter("loginname");
			String email2=request.getParameter("email");
			DealString ds=new DealString();
			String password=ds.randomPSW();
			ProcessUserMan pum=new ProcessUserMan();
			pum.reSetPassword(password,email2,loginname);
			if(pum.isStatus())
			{
			
				//獲取郵件的標題和內容，發送郵件
					
				String title="高雄榮總國際醫療中心會員密碼找回（自動發送，請勿回複）";
				String content="<p>"+loginname+"您好︰</p><p>感謝您註冊成為<a href=\"http://www.xinyuky.com\" target=\"_blank\">高雄榮總國際醫療中心</a>會員，" +
						"您的新密碼是"+password+"，點擊<a href=\"http://www.vghks.gov.tw/icmsite/login.jsp\" target=\"_blank\">這裡</a>重新登入 </p>";
				String toaddr=email2;
				
				String p=getServletConfig().getInitParameter("Frompassword");
				
				String a=getServletConfig().getInitParameter("FromAddress");
			
				Email email=new Email();
				email.setFrompassword(p);
				email.setFromAddress(a);
				email.setTitle(title);
				email.setContent(content);
				
				email.setToAddress(toaddr);
				
				email.sendEmail();
				 response.sendRedirect("temp.jsp");
			}
			else
			{
				
		        	out.write("\r\n");
				    out.write("\t\t<script language=\"javascript\"> \r\n");
				    out.write("  \t\t  alert(\"您輸入的訊息有誤，請重新輸入﹗\");\r\n");
				    out.write("  \t\t  window.history.go(-1);\r\n");
				    out.write("  \t\t\t</script>\r\n");
				    out.write("\t\t\r\n");
				    out.write("\r\n");
		       
			}
		}catch(Exception e){
			System.out.println(e.toString());
		}
		 
		

		
		
	}

	protected void doPost(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {
		this.doGet(arg0,arg1);
	}

}