<%@ page contentType="image/jpeg" import="java.awt.*,java.awt.image.*,java.util.*,javax.imageio.*" %>
<%!
Color getRandColor(int fc,int bc){//���w�d����o�H���C��
	Random random = new Random();
    if(fc>255) fc=255;
    if(bc>255) bc=255;
    int r=fc+random.nextInt(bc-fc);
    int g=fc+random.nextInt(bc-fc);
    int b=fc+random.nextInt(bc-fc);

    return new Color(r,g,b);
}
%>
<%
//�]�w�������w�s
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires", 0);

// �b���s���Ыع϶H
int width=60, height=20;
BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

// ����ϧΤW�U��
Graphics g = image.getGraphics();

//�ͦ��H����
Random random = new Random();

// �]�w�I����
g.setColor(getRandColor(200,250));
g.fillRect(0, 0, width, height);

//�]�w�r��
g.setFont(new Font("Times New Roman",Font.PLAIN,18));

//�e���
g.setColor(new Color(0,0,255));
g.drawRect(0,0,width-1,height-1);


// �H������155���z�Z�u�A�Ϲ϶H�����{���X�����Q�䥦�{��������
g.setColor(getRandColor(160,200));
for (int i=0;i<155;i++)
{
	int x = random.nextInt(width);
	int y = random.nextInt(height);
	int xl = random.nextInt(12);
	int yl = random.nextInt(12);
	g.drawLine(x,y,x+xl,y+yl);
}

// ���H�����ͪ��{���X(4��Ʀr)
String sRand="";
for (int i=0;i<4;i++){
    String rand=String.valueOf(random.nextInt(10));
    sRand+=rand;
    // �N�{���X��ܨ�϶H��
    g.setColor(new Color(20+random.nextInt(100),20+random.nextInt(100),20+random.nextInt(100)));//�եΨ�ƥX�Ӫ��C��ۦP�A�i��O�]���ؤl�ӱ���A�ҥH�u�ઽ���ͦ�
    g.drawString(rand,13*i+6,16);
}

// �N�{���X�s�JSESSION
session.setAttribute("checkcode",sRand);


// �϶H�ͮ�
g.dispose();

// ��X�϶H�쭶��
ImageIO.write(image, "JPEG", response.getOutputStream());

%> 
