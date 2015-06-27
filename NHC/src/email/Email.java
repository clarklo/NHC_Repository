/*類名稱︰Online
 *功能︰透過Email地fh址和內容發送郵件
 *時間︰2012-7-14
 */
package email;

 
 
import java.util.Date;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Email
{
	String toAddress,fromAddress;//接受者和發送者的電子郵件位址
	String title,content;//郵件標題和內容
	String smtpaddress;
	String fromname;//發送者的用戶名
	String frompassword;//發送者的密碼
	String []tokens;
	
	public Email()
	{
		toAddress=null;
		fromAddress=null;
		title=null;
		content=null;
		frompassword=null;
		smtpaddress=null;
	}

	public void setToAddress(String address)
	{
		toAddress=address;
	}

	public void setFromAddress(String address)
	{
		fromAddress=address;
	}

	public void setTitle(String title)
	{
		this.title=title;
	}

	public void setContent(String content)
	{
		this.content=content;
	}
	public void setFrompassword(String password)
	{
		frompassword=password;
	}
	
	//將發送端郵件依據@標誌分成兩個字段
	public void stringSeparate()
	{
		StringTokenizer st=new StringTokenizer(fromAddress,"@");
		tokens=new String[st.countTokens()];
		int i=0;
		while(st.hasMoreTokens())
		{
			tokens[i]=st.nextToken();
			i++;
		}

	}
	
	
	public void setSmtpaddress()
	{
		smtpaddress="smtp."+tokens[1];
	}
	
	//設定發送者名字
	public void setFromname()
	{
		fromname=tokens[0];
	}





	public void sendEmail()
	{
		stringSeparate();
		setFromname();
		setSmtpaddress();

		try
		{
			Properties props=new Properties();//也可用Properties props = System.getProperties(); 
			props.put("mail.smtp.host",smtpaddress);//存儲發送郵件伺服器的訊息
			props.put("mail.smtp.auth","true");//同時透過驗証
			Session s=Session.getInstance(props);//根據屬性新建一個郵件會話
			s.setDebug(true);
			MimeMessage message=new MimeMessage(s);//由郵件會話新建一個消息對象
			//設定郵件
			InternetAddress from=new InternetAddress(fromAddress);
			message.setFrom(from);//設定發件人
			InternetAddress to=new InternetAddress(toAddress);
			message.setRecipient(Message.RecipientType.TO,to);//設定收件人,並設定其接收類型為TO
			message.setSubject(title);//設定主題
			message.setContent(content,"text/html;charset=GB2312");//設定信件內容
			message.setSentDate(new Date());//設定發信時間
			//發送郵件
			message.saveChanges();//存儲郵件訊息
			Transport transport=s.getTransport("smtp");
			transport.connect(smtpaddress,fromname,frompassword);//以smtp模式登錄郵箱
			transport.sendMessage(message,message.getAllRecipients());//發送郵件,其中第二個參數是所有
			//已設好的收件人位址
			transport.close();
		}
		catch(Exception ex)
		{

		}
	}
/*
	public static void  main(String args[])
	{
		Email email=new Email();
		
		email.setToAddress("ihaoyu.service@gmail.com");
		email.setFromAddress("ihaoyu.service@gmail.com");
		email.setFrompassword("ihaoyu0603");
		email.setTitle("TEST111");
		email.setContent("成功了嗎111");
		email.sendEmail();
	}
	
*/

}