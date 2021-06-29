
package yiqing;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

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
@WebServlet("/index")
public class index extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
	public index() {
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
		
		String start=request.getParameter("start"); 
		String end=request.getParameter("end"); 
		
		int as=0;
		String name[] =new String [330];
		String num[]=new String[330];
		for(int i=0;i<330;i++)
		{
			name[i]="";
			num[i]="0";
		}
		//*************************************
		//在这里写!!!!
		
		try {
			Statement stmt = conn.createStatement();
			//1.改sql语句		
 			ResultSet rs = stmt.executeQuery("select * from info2");
			while (rs.next()) {
		
				
				String date=new String(rs.getString("Date"));
				if(date.compareTo(start)>=0&& date.compareTo(end)<=0)
				{
					String province=new String(rs.getString("Province"));
					String city=new String(rs.getString("City"));
					String quezhen=new String(rs.getString("Confirmed_num"));
					String zhiyu=new String(rs.getString("Cured_num"));
					String dead=new String(rs.getString("Dead_num"));
					System.out.println(date+" "+province+" "+city+" "+quezhen);
					user use=new user(date,province,city,quezhen,zhiyu,dead);
					list.add(use);					
						
				}
				
			}

			
	}catch (SQLException e) {
			response.getWriter().print("查找失败");
		}	

		try {
			Statement stmt = conn.createStatement();
			//1.改sql语句		
 			ResultSet rs = stmt.executeQuery("select * from info3");
			while (rs.next()) {			
				String date=new String(rs.getString("Date"));
				if(date.compareTo(start)>=0&& date.compareTo(end)<=0)
				{
					String province=new String(rs.getString("Province"));
					String city=new String(rs.getString("City"));
					String quezhen=new String(rs.getString("Confirmed_num"));
					String zhiyu=new String(rs.getString("Cured_num"));
					String dead=new String(rs.getString("Dead_num"));
					System.out.println(date+" "+province+" "+city+" "+quezhen);
					user use=new user(date,province,city,quezhen,zhiyu,dead);
					list.add(use);
				}
				
			}

			
	}catch (SQLException e) {
			response.getWriter().print("查找失败");
		}
		try {
			Statement stmt = conn.createStatement();
			//1.改sql语句		
 			ResultSet rs = stmt.executeQuery("select * from info4");
			while (rs.next()) {			
				String date=new String(rs.getString("Date"));
				if(date.compareTo(start)>=0&& date.compareTo(end)<=0)
				{
					String province=new String(rs.getString("Continents"));
					String city=new String(rs.getString("Province"));
					String quezhen=new String(rs.getString("Confirmed_num"));
					String zhiyu=new String(rs.getString("Cured_num"));
					String dead=new String(rs.getString("Dead_num"));
					System.out.println(date+" "+province+" "+city+" "+quezhen);
					user use2=new user(date,province,city,quezhen,zhiyu,dead);
					list2.add(use2);
					name[as]=city;
					num[as]= quezhen;
					as++;
				}
				
			}

			
	}catch (SQLException e) {
			response.getWriter().print("查找失败");
		}	
		request.setAttribute("list",list);
		request.setAttribute("list2",list2);   
		session.setAttribute("name",name);      
		session.setAttribute("num",num);      
		request.getRequestDispatcher( "echarts.jsp").forward(request,response);
		//***************************************

		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
}
