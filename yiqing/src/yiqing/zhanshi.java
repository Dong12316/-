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
@WebServlet("/zhanshi")
public class zhanshi extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
	public zhanshi() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		//声明list
		@SuppressWarnings("unchecked")
		ArrayList<course> list = new ArrayList();
		//声明缓冲区
		HttpSession session = request.getSession();
		
		String url = "jdbc:mysql://localhost:3306/gwlz?&useSSL=false&serverTimezone=UTC&useUnicode=yes&characterEncoding=utf8";		
		
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
		String num[]=new String[3000000];
		for(int i=0;i<33000;i++)
		{
			name[i]="";
			num[i]="";
		}
		//*************************************
		//在这里写!!!!
		Date date3 = new Date();//获得系统时间.
		try {
			Statement stmt = conn.createStatement();
			//1.改sql语句		
 			ResultSet rs = stmt.executeQuery("select *from tar ");
			while (rs.next()) {			
					String ip=new String(rs.getString("tarffic"));
					String tarffic=new String(rs.getString("number"));
					course course2=new course(ip,tarffic);
					list.add(course2);
					name[as]=ip;
					num[as]= tarffic;
					as++;
				
				
			}			
	}catch (SQLException e) {
			response.getWriter().print("查找失败");
		}	
		
		request.setAttribute("list",list);
		session.setAttribute("name",name);      
		session.setAttribute("num",num);
		session.setAttribute("as",as);

		request.getRequestDispatcher( "zhanshi.jsp").forward(request,response);
		//***************************************

		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
}