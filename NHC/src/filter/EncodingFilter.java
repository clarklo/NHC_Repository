package filter;

/**
 * <p>Title: 整站系統1.0</p>
 *
 * <p>Description: 編碼過濾器 </p>
 *
 * <p>Copyright: Copyright (c) 2012</p>
 *
 * <p>Company: web</p>
 *
 * @version 1.0
 */
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class EncodingFilter implements Filter{
	protected FilterConfig filterConfig;
	private String targetEncoding = "UTF-8";

	public void init(FilterConfig config) throws ServletException{
		this.filterConfig = config;
		this.targetEncoding = config.getInitParameter("encoding");
	}

	public void doFilter(ServletRequest srequest, ServletResponse sresponse, FilterChain chain) throws IOException, ServletException{
		HttpServletRequest request = (HttpServletRequest)srequest;
		request.setCharacterEncoding(targetEncoding);
		chain.doFilter(srequest, sresponse);
	}

	public void setFilterConfig(final FilterConfig filterConfig){
		this.filterConfig = filterConfig;
	}

	public void destroy(){
		this.filterConfig = null;
	}
}