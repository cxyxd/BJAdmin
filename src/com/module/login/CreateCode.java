package com.module.login;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;

import org.springframework.stereotype.Component;

import com.core.BaseAction;

//生成验证码的servlet

@Component
public class CreateCode extends BaseAction {


    /**
	 * 
	 */
	private static final long serialVersionUID = -7226051798569724872L;


	public String execute() throws ServletException, IOException {
        
        //禁止浏览器缓存随机图片
        response.setDateHeader("Expires", -1);
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma","no-cache");
        
        //通知客户机以图片的方式打开发送过去的数据
        response.setHeader("Control-Type", "image/jpeg");
        
        //在内存中创建一幅图片
        BufferedImage image= new BufferedImage(80,30,
                BufferedImage.TYPE_INT_RGB);
        
        //创建画笔
        Graphics g = image.getGraphics();
        
        //设置背景色
        g.setColor(Color.GRAY);
        g.fillRect(0, 0, 80, 30);
        
        //设置写入数据的颜色和字体
        g.setColor(Color.blue);
        g.setFont(new Font(null,Font.BOLD,20));
        
        //向图片上写数据
        String num = makeNum();
        System.out.println("啦啦啦 "+request.getSession().getId()+"  "+num);
        //把随机生成的数据保存到session，用于验证
        request.getSession().setAttribute("checkcode", num);
        g.drawString(num, 0, 20);
        
        //把写好数据的图片输出到浏览器
        ImageIO.write(image, "jpg", response.getOutputStream());
		return "";

    }
    
    //生成随机数
    public String makeNum()    {
        Random r = new Random();
        String num = r.nextInt(9999)+"";
        StringBuffer str=new StringBuffer();
        for(int i=0;i<4-num.length();i++){
            str.append("0");
        }
        num = str.toString()+num;
        return num;
    }
    


}