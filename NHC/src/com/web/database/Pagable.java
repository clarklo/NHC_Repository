package com.web.database;

/**
 * <p>Title: �㯸�t��1.0</p>
 *
 * <p>Description: ������ܾɯ�ե�</p>
 *
 * <p>Copyright: Copyright (c) 2012</p>
 *
 * <p>Company: web</p>
 *
 * @version 1.0
 */
public class Pagable {
	/**
	 *  currPage: ��e����
	 *  pageSize: ���j�p
	 *  pageCount: �`����
	 *  totalRecord:�`�O����
	 *  ��^�r����J�����ɯ�r����
	 */
	public static String navigator(int currPage, int pageSize, int pageCount, int totalRecord){
		String addr;

		addr = "<table width=100% border=0 align=center cellpadding=0 cellspacing=0>"+
			   "<form method=Post name=navigatorForm><tr><td><div align=right>"+
			   "��e��<strong><font color=red>" + currPage + "</font></strong>�� " +
			   "�@<strong><font color=red>" + pageCount + "</font></strong>�� "+
			   "�C��<strong><font color=red>" + pageSize + "</font></strong>�� "+
			   "�@<strong><font color=red>" + totalRecord + "</font></strong>�� ";

		if(currPage > pageCount){
			currPage = pageCount;
		}
		if(currPage < 1){
			currPage = 1;
		}

		if(currPage < 2){
			addr += "�� �� �W�@�� ";
		}
		else{
			addr += "<a href='javascript:document.navigatorForm.page.value=1;document.navigatorForm.submit();'>�� ��</a> ";
			addr += "<a href='javascript:document.navigatorForm.page.value="+ (currPage - 1) +";document.navigatorForm.submit();'>�W�@��</a> ";
		}

		if(currPage >= pageCount){
			addr += "�U�@�� �� �� ";
		}
		else{
			addr += "<a href='javascript:document.navigatorForm.page.value="+ (currPage + 1) +";document.navigatorForm.submit();'>�U�@��</a> ";
			addr += "<a href='javascript:document.navigatorForm.page.value="+ pageCount +";document.navigatorForm.submit();'>�� ��</a> ";
		}

		addr += "���J<select name='page' size='1' style='font-size: 9pt' onChange='javascript:document.navigatorForm.submit();'> ";
		for(int i = 1; i <= pageCount; i ++){
			if(i == currPage){
				addr += "<option value=" + i + " selected>��" + i + "��</option> ";
			}
			else{
				addr += "<option value=" + i + ">��" + i + "��</option> ";
			}
		}
		addr += "</select></div></td></tr></form></table>";

		return addr;
	}
}