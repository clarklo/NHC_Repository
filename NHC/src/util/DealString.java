/**********************************************************

Filename: DealString.java
Author:
來源︰JSP數據開發實例中
Date:2013-7-22
Description:此檔案為字元串的處理類
Other:
Variable List:
Function List:
1.public DealString()//構造函數
2.public String toString(String str)//把null轉化為"",trim()
3.public String toUTF-8(String str)//轉換編碼
  public String toUtf8String(String src)
4.public String[] splitStr(String str,char c)//分割字元串
5.public String getDateTime()//取得系統時間
6.public String Replace(String source, String oldString, String newString)//替換字元串
7.public long getDaysInterval(Date d1,Date d2)//取得兩個日期的天數之差
8.public String toLengthStr(String instr,int len)//將字元串格式化為固定長度
9.public String toLengthStrRight(String instr,int len)//將字元串格式化為固定長度(右邊補空格)
//9.public String AsciiToChineseString(String s)//ASCII轉化為字元串
//10.public String ChineseStringToAscii(String s)//字元串轉化為ASCII
11.public String UnicodetoGB(String s)//Unicode轉化成GB的源碼
12.public int toASCII(char c)//字符轉化為ASCII
public String toASCII(String s)
13.public int byteLength(String)//取得字符位元組長度
14.public String strByteCopy(String str,int nEnd)//取得字元串從頭開始指定長度子串
15.public boolean strMatch(String motherStr,String childStr)//取得字元串從頭開始指定長度子串  new 陳
16.public String strDistinct(String str)//將str中重複的去掉    new 劉建
17 	public Vector simplify(String[] str) //過濾數組 0 代表所有的
18 	public Vector simplify(Vector vstr) //過濾向量 0 代表所有的
History:
19  public String randomPSW()//產生隨機數
***********************************************************/

package util;
import java.util.Date;
import java.util.Vector;

import sun.io.ByteToCharConverter;
import sun.io.CharToByteConverter;

public  class DealString
{
	/**構造函數*/
	public DealString()
	{
	}

	/**把null轉化為""*/
	public String toString(String str)
	{
		if(str==null)str = "";
		if(str.equals("null"))str = "";
		str = str.trim();
		return str;
	}

	/**轉換編碼*/
	public String toUTF8(String str)
	{
		try
		{
			str=new String(str.getBytes("ISO-8859-1"),"UTF-8");
		}catch (Exception e) {}
		return str;
	}

	/**UTF8*/
	public String toUtf8String(String src)
	{
		byte[] b = src.getBytes();
		char[] c = new char[b.length];
		for(int i=0;i<b.length;i++)
		{
			c[i] = (char)(b[i]&0x00FF);
		}
		return new String(c);
	}

	public String toASCII(String str)
	{
		try
		{
			str=new String(str.getBytes("UTF-8"),"ISO-8859-1");
		}catch (Exception e) {}
		return str;
	}
	/**分割字元串*/
	public String[] splitStr(String str,char c)
	{
		str+=c;
		int n=0;
		for(int i=0;i<str.length();i++)
		{
			if(str.charAt(i)==c)n++;
		}

		String out[] = new String[n];

		for(int i=0;i<n;i++)
		{
			int index = str.indexOf(c);
			out[i] = str.substring(0,index);
			str = str.substring(index+1,str.length());
		}
		return out;
	}

	/**取得系統時間*/
	public String getDateTime()
	{
		java.text.SimpleDateFormat f = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = f.format(new java.util.Date());
		return time;
	}

	/**替換字元串*/
	public String Replace(String source, String oldString, String newString)
	{
       StringBuffer output = new StringBuffer();

       int lengthOfSource = source.length();   // 源字元串長度
       int lengthOfOld = oldString.length();   // 老字元串長度
       int posStart = 0;   // 開始搜索位置
       int pos;            // 搜索到老字元串的位置

       while ((pos = source.indexOf(oldString, posStart)) >= 0) {
           output.append(source.substring(posStart, pos));
           output.append(newString);
           posStart = pos + lengthOfOld;
       }
       if (posStart < lengthOfSource) {
           output.append(source.substring(posStart));
       }
       return output.toString();
	}

	/**取得兩個日期的天數之差*/
	public long getDaysInterval(Date d1,Date d2)
	{
		return (d2.getTime()-d1.getTime())/86400000;
	}

	/**將字元串格式化為固定長度*/
	public String toLengthStr(String instr,int len)
	{
		int n = instr.length();
		for(int i=0;i<(len-n);i++)
		{
			instr = " "+instr;
		}
		return instr;
	}
	/**將字元串格式化為固定長度(右邊補空格)*/
	public String toLengthStrRight(String instr,int len)
	{
		int n = instr.length();
		for(int i=0;i<(len-n);i++)
		{
			instr = instr+" ";
		}
		return instr;
	}
	/*ASCII轉化為字元串*/
	public String AsciiToChineseString(String s)
	{
		char[] orig = s.toCharArray();
		byte[] dest = new byte[orig.length];
		for (int i=0;i<orig.length;i++)
		dest[i] = (byte)(orig[i]&0xFF);
		try
		{
			ByteToCharConverter toChar = ByteToCharConverter.getConverter("UTF-8");
			return new String(toChar.convertAll(dest));
		}
		catch (Exception e)
		{
			System.out.println(e);
			return s;
		}
	}

	/**字元串轉化為ASCII*/
	public String ChineseStringToAscii(String s)
	{
		try
		{
			CharToByteConverter toByte = CharToByteConverter.getConverter("UTF-8");
			byte[] orig = toByte.convertAll(s.toCharArray());
			char[] dest = new char[orig.length];
			for (int i=0;i<orig.length;i++)
				dest[i] = (char)(orig[i] & 0xFF);
			return new String(dest);
		}
		catch (Exception e)
		{
			System.out.println(e);
			return s;
		}
	}

	/**Unicode轉化成GB的源碼*/
	public String UnicodetoGB(String s)
	{
		StringBuffer  sb  =  new  StringBuffer();
		boolean  escape  =  false;
		for(int  i=0;  i<s.length();  i++)
		{
			char  c  =  s.charAt(i);
			switch  (c)
			{
				case  '\\': escape = true; break;
				case  'u':
				case  'U':
				if(escape)
				{
					try
					{
						 sb.append((char)Integer.parseInt(s.substring(i+1,i+5),16));
						 escape  =  false;
					}
					catch(NumberFormatException e)
					{
						 throw new IllegalArgumentException();
					}
					i += 4;
				}
				else
				{
					sb.append(c);
				}
				break;
				default:sb.append(c); break;
			}
		}
		return  sb.toString();
	}
	/*將str中重複的去掉*/
	public String strDistinct(String str)
	{
		String[] strArr=str.split(",");
		String   strAim = ",";
		for(int i=0;i<strArr.length;i++)
		{
			if(strArr[i].equals(""))
				continue;
			if (strAim.indexOf(","+strArr[i]+",")==-1)
			{
				strAim = strAim + strArr[i] + ",";
			}
		}
		if(!strAim.equals(","))
		strAim = strAim.substring(1,strAim.length()-1);
		else strAim = "";
		return strAim;
	}

	/**字符轉化為ASCII*/
	public int toASCII(char c)
	{
		int i = c;
		return i;
	}

	/**取得字符位元組長度*/
	public int byteLength(String str)
	{
		return ((str.getBytes()).length);
	}

	/**取得字元串從頭開始指定長度子串*/
	public String strByteCopy(String str,int nEnd)
	{
		if(nEnd==0)
			return "";
		byte[] byteStr=str.getBytes();
		String strSub=new String(byteStr,0,nEnd);
		if (strSub.length()==0) strSub=new String(byteStr,0,nEnd-1);
		return strSub;
	}
        public boolean strMatch(String motherStr,String childStr)
        {
          boolean matched=false;
          int mLength=motherStr.length();
          int cLength=childStr.length();
          int starWith;
          if(mLength>=cLength){
            starWith=mLength-cLength;
            for(int i=0;i<=starWith;i++){
              matched=motherStr.startsWith(childStr,i);
              if(matched)break;
            }
          }
          return matched;
        }
/*

	//把字元串轉化為以ＵＴＦ８編碼
	public static String toUtf8String(String s) {
                 StringBuffer sb = new StringBuffer();
                 for (int i=0;i<s.length();i++) {
                   char c = s.charAt(i);
                   if (c >= 0 && c <= 255) {
                     sb.append(c);
                   }
                   else {
                     byte[] b;
                     try {
                       b = Character.toString(c).getBytes("utf-8");
                     }
                     catch (Exception ex) {
                       System.out.println(ex);
                       b = new byte[0];
                     }
                     for (int j = 0; j < b.length; j++) {
                       int k = b[j];
                       if (k < 0)
                         k += 256;
                       sb.append("%" + Integer.toHexString(k).
                                 toUpperCase());
                     }
                   }
                 }
                 return sb.toString();
       }
*/
	public Vector simplify(String[] str){
		Vector vect = new Vector();
		for(int i=0;i<str.length;i++)
			vect.add(str[i]);
		for(int i=0;i<vect.size();i++){
			String[] s1 = ((String)vect.get(i)).split("_");
			for(int j=i+1;j<vect.size();){
				boolean out = true;
				String[] s2 = ((String)vect.get(j)).split("_");
				for(int k=0;k<s1.length;k++){
					if(!s1[k].equals(s2[k])&&!s1[k].equals("0")){
						out = false;
						break;
					}
				}
				if(out)
					vect.remove(j);
				else
					j++;
			}
		}
		return vect;
	}
	public Vector simplify(Vector vstr){
		Vector vect = new Vector();
		for(int i=0;i<vstr.size();i++)
			vect.add(vstr.get(i));
		for(int i=0;i<vect.size();i++){
			String[] s1 = ((String)vect.get(i)).split("_");
			for(int j=i+1;j<vect.size();){
				boolean out = true;
				String[] s2 = ((String)vect.get(j)).split("_");
				for(int k=0;k<s1.length;k++){
					if(!s1[k].equals(s2[k])&&!s1[k].equals("0")){
						out = false;
						break;
					}
				}
				if(out)
					vect.remove(j);
				else
					j++;
			}
		}
		return vect;
	}


	/**
	 * 隨機產生一個密碼
	 * @return
	 */
	public String randomPSW(){
		int randomIndex=-1;
		int i=-1;
		String randomID="";
		char[] randomElement={
			'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f','g','h',
			'i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'
		};
		for(i=0;i<10;i++){
			randomIndex=((new Double(Math.random()*998)).intValue())%36;
			randomID=String.valueOf(randomElement[randomIndex])+randomID;
		}
		return randomID;
	}


	public static void main(String args[]) throws Exception
	{
		DealString mb = new DealString();
		System.out.println("begin\r\n\r\n");
	/*
		System.out.println("Please  input  string  to  be  translated");
        String  oldStr  =  null;
		java.io.BufferedReader in  = new java.io.BufferedReader(new java.io.InputStreamReader(System.in));
		oldStr  =  in.readLine();
		while(oldStr!=null)
		{
			System.out.println(mb.UnicodetoGB(oldStr));
			oldStr  =  in.readLine();
		}
                */
		System.out.print("fdsafd");
		System.out.print("\rggggggggggggggg");
		System.out.println("\rend                 ");
	}
};