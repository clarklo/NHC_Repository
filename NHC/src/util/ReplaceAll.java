package util;

/**
 * <p>Title: �㯸�t��1.0</p>
 *
 * <p>Description: �r�������</p>
 *
 * <p>Copyright: Copyright (c) 2013</p>
 *
 * <p>Company: web</p>
 *
 * @version 1.0
 */
public class ReplaceAll {
	/**
	 * �r�Ŵ������
	 */
	public static String replace(String source,String oldString,String newString) {
		if(source == null)
			return null;
		StringBuffer output = new StringBuffer();
		int lengOfsource = source.length();
		int lengOfold = oldString.length();
		int posStart = 0;
		int pos;
		while((pos = source.indexOf(oldString,posStart)) >= 0) {
			output.append(source.substring(posStart,pos));
			output.append(newString);
			posStart = pos + lengOfold;
		}
		if(posStart < lengOfsource) {
			output.append(source.substring(posStart));
		}
		return output.toString();
	}

	/**
	 * �N���q�r����榡�Ʀ��ƾڮw�{�i���r����榡
	 *
	 * @param str �n�榡�ƪ��r����
	 * @return �X�k���ƾڮw�r����
	 */
	public static String toSql(String str) {
		String sql = new String(str);
		return replace(sql, "'", "''");
    }
}