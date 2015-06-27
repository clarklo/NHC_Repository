package com.web.database;

/**
 * <p>Title: 整站系統1.0</p>
 *
 * <p>Description: 分頁顯示導航組件</p>
 *
 * <p>Copyright: Copyright (c) 2012</p>
 *
 * <p>Company: web</p>
 *
 * @version 1.0
 */
public class Pagable {
	/**
	 *  currPage: 當前頁數
	 *  pageSize: 頁大小
	 *  pageCount: 總頁數
	 *  totalRecord:總記錄數
	 *  返回字元串︰分頁導航字元串
	 */
	public static String navigator(int currPage, int pageSize, int pageCount, int totalRecord){
		String addr;

		addr = "<table width=100% border=0 align=center cellpadding=0 cellspacing=0>"+
			   "<form method=Post name=navigatorForm><tr><td><div align=right>"+
			   "當前第<strong><font color=red>" + currPage + "</font></strong>頁 " +
			   "共<strong><font color=red>" + pageCount + "</font></strong>頁 "+
			   "每頁<strong><font color=red>" + pageSize + "</font></strong>條 "+
			   "共<strong><font color=red>" + totalRecord + "</font></strong>條 ";

		if(currPage > pageCount){
			currPage = pageCount;
		}
		if(currPage < 1){
			currPage = 1;
		}

		if(currPage < 2){
			addr += "首 頁 上一頁 ";
		}
		else{
			addr += "<a href='javascript:document.navigatorForm.page.value=1;document.navigatorForm.submit();'>首 頁</a> ";
			addr += "<a href='javascript:document.navigatorForm.page.value="+ (currPage - 1) +";document.navigatorForm.submit();'>上一頁</a> ";
		}

		if(currPage >= pageCount){
			addr += "下一頁 尾 頁 ";
		}
		else{
			addr += "<a href='javascript:document.navigatorForm.page.value="+ (currPage + 1) +";document.navigatorForm.submit();'>下一頁</a> ";
			addr += "<a href='javascript:document.navigatorForm.page.value="+ pageCount +";document.navigatorForm.submit();'>尾 頁</a> ";
		}

		addr += "轉到︰<select name='page' size='1' style='font-size: 9pt' onChange='javascript:document.navigatorForm.submit();'> ";
		for(int i = 1; i <= pageCount; i ++){
			if(i == currPage){
				addr += "<option value=" + i + " selected>第" + i + "頁</option> ";
			}
			else{
				addr += "<option value=" + i + ">第" + i + "頁</option> ";
			}
		}
		addr += "</select></div></td></tr></form></table>";

		return addr;
	}
}