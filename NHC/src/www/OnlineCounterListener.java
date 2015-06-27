package www;

/**
 * <p>Title: 整站系統1.0</p>
 *
 * <p>Description: SessionListener</p>
 *
 * <p>Copyright: Copyright (c) 2013</p>
 *
 * <p>Company: web</p>
 *
 * @version 1.0
 */
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class OnlineCounterListener implements HttpSessionListener{
	public void sessionCreated(HttpSessionEvent hse) {
		OnlineCounter.raise();
	}
	public void sessionDestroyed(HttpSessionEvent hse) {
		OnlineCounter.reduce();
	}
}