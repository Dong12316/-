package yiqing;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//2.将删除改成类名
/**
 * Servlet implementation class index
 */
@WebServlet("/world")
public class world extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
	public world() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		//声明list
		ArrayList<user> list = new ArrayList();
		ArrayList<user> list2 = new ArrayList();
		//声明缓冲区
		HttpSession session = request.getSession();
		
		String url = "jdbc:mysql://localhost:3306/yiqing1?&useSSL=false&serverTimezone=UTC&useUnicode=yes&characterEncoding=utf8";		
		
		Connection conn = null;
		PreparedStatement ps = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, "root", "root");
			
		} catch (ClassNotFoundException e) {
			response.getWriter().print("加载驱动失败");
		} catch (SQLException e) {
			response.getWriter().print("连接数据库失败");
		}

		
		int as=0;
		String name[] =new String [3000000];
		int num[]=new int[3000000];
		int q=0,z=0,d=0;
		for(int i=0;i<330;i++)
		{
			name[i]="";
			num[i]=0;
		}
		//*************************************
		//在这里写!!!!
		Date date3 = new Date();//获得系统时间.
		SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd" );
		String nowTime = sdf.format(date3);
		System.out.println(nowTime);
		try {
			Statement stmt = conn.createStatement();
			//1.改sql语句		
 			ResultSet rs = stmt.executeQuery("select * from info4 where Date = '" + nowTime + "'");
			while (rs.next()) {			
				String date=new String(rs.getString("Date"));
				
					String province=new String(rs.getString("Continents"));
					String city=new String(rs.getString("Province"));
					String quezhen=new String(rs.getString("Confirmed_num"));
					String zhiyu=new String(rs.getString("Cured_num"));
					String dead=new String(rs.getString("Dead_num"));
					String id2=new String(rs.getString("id"));
					int id = Integer.parseInt(id2); 
					int qz = Integer.parseInt(quezhen); 
					q=q+qz;
					int zy = Integer.parseInt(zhiyu); 
					z=z+zy;
					int de = Integer.parseInt(dead); 
					d=d+de;
					System.out.println(date+" "+province+" "+city+" "+quezhen);
					user use2=new user(date,province,city,quezhen,zhiyu,dead);
					list2.add(use2);
					name[as]=city;
					num[as]= qz;
					as++;
				
				
			}			
	}catch (SQLException e) {
			response.getWriter().print("查找失败");
		}	
		
		String date2[] =new String [300];
		String num2[]=new String[300];
		int num3=0;
		try {
			Statement stmt = conn.createStatement();
			//1.改sql语句		
 			ResultSet rs = stmt.executeQuery("select * from confirm");
			while (rs.next()) {			
				String date=new String(rs.getString("Date"));
				String confirmed=new String(rs.getString("Confirmed_num"));
                date2[num3]=date;  
                num2[num3]=confirmed;
                num3++;
			}			
	}catch (SQLException e) {
			response.getWriter().print("查找失败");
		}
		request.setAttribute("list2",list2);
		session.setAttribute("name",name);      
		session.setAttribute("num",num);
		session.setAttribute("date2",date2);      
		session.setAttribute("num2",num2);  
		session.setAttribute("nowTime",nowTime); 
		session.setAttribute("q",q); 
		session.setAttribute("z",z); 
		session.setAttribute("d",d); 
		request.getRequestDispatcher( "worldmap.jsp").forward(request,response);
		//***************************************

		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
}