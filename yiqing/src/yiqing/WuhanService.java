package yiqing;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.Timestamp;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.xml.crypto.Data;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
public class WuhanService {
	
	public static void main(String[] args) throws IOException {
		//getAreaStat();
		getListByCountryTypeService2(); 
		
		}
	// 根URL
	private static String httpRequset(String requesturl) throws IOException {
		StringBuffer buffer = null;
		BufferedReader bufferedReader = null;
		InputStreamReader inputStreamReader = null;
		InputStream inputStream = null;
		HttpsURLConnection httpsURLConnection = null;
		try {
			URL url = new URL(requesturl);
			httpsURLConnection = (HttpsURLConnection) url.openConnection();
			httpsURLConnection.setDoInput(true);
			httpsURLConnection.setRequestMethod("GET");
			inputStream = httpsURLConnection.getInputStream();
			inputStreamReader = new InputStreamReader(inputStream, "utf-8");
			bufferedReader = new BufferedReader(inputStreamReader);
			buffer = new StringBuffer();
			String str = null;
			while ((str = bufferedReader.readLine()) != null) {
				buffer.append(str);
			}
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return buffer.toString();
	}

	/**
	 * 获取全国各个省市的确诊、死亡和治愈人数
	 * 
	 * @return
	 */
	
	public static String getAreaStat() {
		String url = "https://ncov.dxy.cn/ncovh5/view/pneumonia";
		String htmlResult = "";
		try {
			htmlResult = httpRequset(url);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// System.out.println(htmlResult);

		// 正则获取数据
		// 因为html的数据格式看着就像json格式，所以我们正则获取json
		String reg = "window.getAreaStat = (.*?)\\}(?=catch)";
		Pattern totalPattern = Pattern.compile(reg);
		Matcher totalMatcher = totalPattern.matcher(htmlResult);

		String result = "";
		if (totalMatcher.find()) {
			result = totalMatcher.group(1);
			System.out.println(result);
			// 各个省市的是一个列表List，如果想保存到数据库中，要遍历结果，下面是demo
			JSONArray array = JSONArray.parseArray(result);
			DBUTIL l = new DBUTIL();
			try {
				Connection con = l.lin("VData");
				Statement stmt = con.createStatement();

				Date date = new Date();//获得系统时间.
				SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd hh:mm:ss" );
				String nowTime = sdf.format(date);

				for (int i = 0; i <= 30; i++) {

					com.alibaba.fastjson.JSONObject jsonObject = com.alibaba.fastjson.JSONObject
							.parseObject(array.getString(i));

				
					    String provinceName = jsonObject.getString("provinceName");
					    String cityname1 = " ";
						String confirmed = jsonObject.getString("confirmedCount");
						String cured = jsonObject.getString("curedCount");
						String dead = jsonObject.getString("deadCount");
						String suspect = jsonObject.getString("suspectedCount");
						stmt.executeUpdate("insert into info2(Date,Province,City,Confirmed_num,Yisi_num,Cured_num,Dead_num) values('"+ nowTime + "','"+ provinceName + "','"+ cityname1 + "','" + confirmed + "','" + suspect +"','" + cured +"','" + dead +"')");
						
						JSONArray array2 = jsonObject.getJSONArray("cities");
						for (int j = 0; j < array2.size(); j++) {
							com.alibaba.fastjson.JSONObject jsonObject2 = com.alibaba.fastjson.JSONObject
									.parseObject(array2.getString(j));
							String provinceName2 = jsonObject.getString("provinceName");
							String cityname = jsonObject2.getString("cityName");
							String confirmed2 = jsonObject2.getString("confirmedCount");
							String cured2 = jsonObject2.getString("curedCount");
							String dead2 = jsonObject2.getString("deadCount");
							String suspect2 = jsonObject2.getString("suspectedCount");
							stmt.executeUpdate("insert into info3(Date,Province,City,Confirmed_num,Yisi_num,Cured_num,Dead_num) values('"+ nowTime + "','"+ provinceName2 + "','"+ cityname + "','" + confirmed2 + "','" + suspect2 +"','" + cured2 +"','" + dead2 +"')");
				}
			}
				stmt.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}
	/**
     * 获取全球各个国家的确诊、死亡和治愈人数
     * @return
     */
	public static String getListByCountryTypeService2() {
		String url = "https://ncov.dxy.cn/ncovh5/view/pneumonia";
		String htmlResult = "";
		try {
			htmlResult = httpRequset(url);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// System.out.println(htmlResult);

		// 正则获取数据
		// 因为html的数据格式看着就像json格式，所以我们正则获取json
		String reg = "window.getListByCountryTypeService2true = (.*?)\\}(?=catch)";
		Pattern totalPattern = Pattern.compile(reg);
		Matcher totalMatcher = totalPattern.matcher(htmlResult);

		String result = "";
		if (totalMatcher.find()) {
			result = totalMatcher.group(1);
			System.out.println(result);
			// 各个省市的是一个列表List，如果想保存到数据库中，要遍历结果，下面是demo
			JSONArray array = JSONArray.parseArray(result);
			DBUTIL l = new DBUTIL();
			try {
				Connection con = l.lin("VData");
				Statement stmt = con.createStatement();

				Date date = new Date();//获得系统时间.
				SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd" );
				String nowTime = sdf.format(date);

				for (int i = 0; i <array.size(); i++) {
			com.alibaba.fastjson.JSONObject jsonObject = com.alibaba.fastjson.JSONObject
					.parseObject(array.getString(i));	
			    String continents =jsonObject.getString("continents");
			    int id =jsonObject.getIntValue("id");
			    String provinceName = jsonObject.getString("provinceName");
				String confirmed = jsonObject.getString("confirmedCount");
				String cured = jsonObject.getString("curedCount");
				String dead = jsonObject.getString("deadCount");
				String suspect = jsonObject.getString("suspectedCount");
				stmt.executeUpdate("insert into info4(Date,Continents,Province,Confirmed_num,Yisi_num,Cured_num,Dead_num,id) values('"+ nowTime + "','"+ continents + "','"+ provinceName + "','" + confirmed + "','" + suspect +"','" + cured +"','" + dead +"','" + id +"')");	
				}
				stmt.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
		return result;
	}
	
}
