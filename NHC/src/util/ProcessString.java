package util;

/**
 * <p>Title: �㯸�t��1.0</p>
 *
 * <p>Description: �r����B�zJavaBean </p>
 *
 * <p>Copyright: Copyright (c) 2005</p>
 *
 * <p>Company: web</p>
 *
 * @version 1.0
 */
public class ProcessString {
	/*
	 * ��^���w���ת��l��:�H�^��r�Ū��ӼƬ����,�^��r�Ū��׬�1,����r�Ū��׬�2
	 */
	public static String substring(String str, int len){
		//�w�q�^��r��
		char[] enChar = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9','.',',','?','!',':',';','"','+','-','*','=','/','\\','|','(',')','<','>','[',']','{','}','_','~','^','$','#','%','@','&'};
		int countEnChar = 0, countCnChar = 0;
		boolean isEnChar = false;
		int currLen = 0;
		int i = 0;
		for(i = 0; i <str.length();i++){
			isEnChar = false;
			for(int j = 0; j < enChar.length; j++){
				if(str.charAt(i) == enChar[j]){
					//�^��r��
					countEnChar++;
					isEnChar = true;
					break;
				}
			}
			if(!isEnChar){
				//����r��
				countCnChar++;
			}
			currLen = countEnChar + countCnChar * 2;
			if(currLen>=len){
				break;
			}
		}
		return str.substring(0,i);
	}
}