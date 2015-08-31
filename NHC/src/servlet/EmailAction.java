package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.www.ProcessUserMan;
import email.Email;
import util.DealString;


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
			
				//���l�󪺼��D�M���e�A�o�e�l��
					
				String title="�����a�`�������߷|��K�X��^�]�۰ʵo�e�A�ФŦ^�ơ^";
				String content="<p>"+loginname+"�z�n�J</p><p>�P�±z��U����<a href=\"http://www.xinyuky.com\" target=\"_blank\">�����a�`��������</a>�|��A" +
						"�z���s�K�X�O"+password+"�A�I��<a href=\"http://www.vghks.gov.tw/icmsite/login.jsp\" target=\"_blank\">�o��</a>���s�n�J </p>";
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
				    out.write("  \t\t  alert(\"�z��J���T�����~�A�Э��s��J�T\");\r\n");
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