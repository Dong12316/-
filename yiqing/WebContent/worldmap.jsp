<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>    
 <%@page import="java.text.SimpleDateFormat"%>
		<%@page import="java.util.*"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <link rel="stylesheet" type="text/css" href="a.css"> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>
<script src="http://gallery.echartsjs.com/dep/echarts/map/js/world.js"></script> 
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
<style type="text/css">
.div_foot {
    position: absolute;
    height: 50px;
    text-align: center;
    line-height: 50px;
    width: 100%;  
}
body
{ 
    background:#000000
}
div
{
    float: left;
}

#left
{
    width: 300px;
    height: 700px;
}
</style>
</head>
<body background="#fff">
 <%String pname[] =(String[]) session.getAttribute("name");%>
  <%int cnum[] =(int[]) session.getAttribute("num");%>
  <%int q = (int)session.getAttribute("q");%>
  <%int z = (int)session.getAttribute("z");%>
  <%int d = (int)session.getAttribute("d");%>
  <%String date = (String)session.getAttribute("nowTime");%>
  <%String name[] = (String[])session.getAttribute("date2");%>
  <%String num[] = (String[])session.getAttribute("num2");%>
    <div id="left">
    <div style="background-color: #1F1F1F;width: 300px;height: 100px;margin-top: 10px;margin-left: 10px;">
        <h1 style="color: red;" align="center">
        <font size="4" color="#ffffff">总确诊人数：</font><br/>
        <%=q%>
        </h1>
    </div>
    <div style="margin-top: 10px;margin-left: 5px;background-color:#1F1F1F;BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; BORDER-LEFT: black 1px solid; BORDER-BOTTOM: black 1px solid; 
            
            OVERFLOW: auto;
            WIDTH: 300px;  HEIGHT: 670px" align=center;">
        <table class="table">
                <c:forEach items="${list2}" var="use2">
                    <tr>
                        <td>
                            <h3 style="color: red;">
                                ${use2.quezhen}
                                <font size="2" color="#DEDEDE">${use2.city }</font>
                            </h3>
                        </td>
                    </tr>
                </c:forEach>
        </table>
    </div>
    <div style="background-color: #1F1F1F;width: 300px;height: 100px;margin-top: 5px;margin-left: 5px;">
        <h1 style="color: red;" align="center">
        <font size="3" color="#ffffff">更新时间：</font><br>
        <%=date %>
        </h1>
    </div>
    
    </div>
    <div style="width: 1000px;height: 800px;margin-top: 10px;margin-left: 10px;" >
        <div id="worldMap" style="width: 1000px;height:800px; background-color:#4D4D4D;border:1px solid #ccc"></div> 
    </div>
    <div style="width: 550px; height: 1000px;margin-top: 10px;margin-left: 10px;">
    <div style="background-color: #1F1F1F;width: 48%;height: 8%;margin-top: 5px;">
        <h1 style="color: #ffffff" align="center">
            <font size="4" color="#DEDEDE">累计死亡人数：<br></font>
          <%=d%>
            </h1>
    </div>
    <div style="background-color: #1F1F1F;width: 48%;height: 8%;margin-top: 5px;margin-left: 10px;">
        <h1  align="center">
            <font size="4" color="#DEDEDE">累计治愈人数：<br></font>
            <font color="#32CD32"><%=z%></font>
            </h1>
    </div>
        <div style="width: 48%; height: 50%;background-color: #1F1F1F;background-color: #1F1F1F;BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; BORDER-LEFT: black 1px solid; BORDER-BOTTOM: black 1px solid; 
            
            OVERFLOW: auto;">
            
            <table class="table" style="overflow-y:scroll;">
                <c:forEach items="${list2}" var="use2">
                    <tr>
                        <td>
                            <h2 style="color: #ffffff;">
                                ${use2.dead }死亡
                                <font size="2" color="#DEDEDE">${use2.city }</font>
                            </h2>
                        </td>
                    </tr>
                </c:forEach>
        </table>
        </div>
        <div style="width: 48%; height: 50%;background-color: #1F1F1F;margin-left: 10px;background-color: #1F1F1F;BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; BORDER-LEFT: black 1px solid; BORDER-BOTTOM: black 1px solid; 
            
            OVERFLOW: auto;">
        <table class="table" style="overflow-y:scroll;">
                <c:forEach items="${list2}" var="use2">
                    <tr>
                        <td>
                            <h2 style="color:#32CD32">
                                ${use2.zhiyu }治愈:
                                <font size="2" color="#DEDEDE">${use2.city }</font>
                            </h2>
                        </td>
                    </tr>
                </c:forEach>
        </table>
        </div>
<div id="main" style="width: 100%;height:35%;background-color: #1F1F1F;margin-top: 10px;"></div>
</div>
<div class="div_foot">&copy;Dong的疫情地图</div>

</body>
<script>
   let worldChart = echarts.init(document.getElementById('worldMap'));
    // 国家名英文中文对比
    let  nameComparison = {
    		'Canada':'加拿大',
            'Russia':'俄罗斯',
            'China':'中国',
            'United States':'美国',
            'Singapore Rep.':'新加坡',
            'Dominican Rep.':'多米尼加',
            'Palestine':'巴勒斯坦',
            'Bahamas':'巴哈马',
            'Timor-Leste':'东帝汶',
            'Afghanistan':'阿富汗',
            'Guinea-Bissau':'几内亚比绍',
            "Côted'Ivoire":'科特迪瓦',
            'Siachen Glacier':'锡亚琴冰川',
            "Br. Indian Ocean Ter.":'英属印度洋领土',
            'Angola':'安哥拉',
            'Albania':'阿尔巴尼亚',
            'United Arab Emirates':'阿联酋',
            'Argentina':'阿根廷',
            'Armenia':'亚美尼亚',
            'French Southern and Antarctic Lands':'法属南半球和南极领地',
            'Australia':'澳大利亚',
            'Austria':'奥地利',
            'Azerbaijan':'阿塞拜疆',
            'Burundi':'布隆迪',
            'Belgium':'比利时',
            'Benin':'贝宁',
            'Burkina Faso':'布基纳法索',
            'Bangladesh':'孟加拉国',
            'Bulgaria':'保加利亚',
            'The Bahamas':'巴哈马',
            'Bosnia and Herz.':'波斯尼亚和黑塞哥维那',
            'Belarus':'白俄罗斯',
            'Belize':'伯利兹',
            'Bermuda':'百慕大',
            'Bolivia':'玻利维亚',
            'Brazil':'巴西',
            'Brunei':'文莱',
            'Bhutan':'不丹',
            'Botswana':'博茨瓦纳',
            'Central African Rep.':'中非',
            'Switzerland':'瑞士',
            'Chile':'智利',
            'Ivory Coast':'象牙海岸',
            'Cameroon':'喀麦隆',
            'Dem. Rep. Congo':'刚果（金）',
            'Congo':'刚果（布）',
            'Colombia':'哥伦比亚',
            'Costa Rica':'哥斯达黎加',
            'Cuba':'古巴',
            'N. Cyprus':'北塞浦路斯',
            'Cyprus':'塞浦路斯',
            'Czech Rep.':'捷克',
            'Germany':'德国',
            'Djibouti':'吉布提',
            'Denmark':'丹麦',
            'Algeria':'阿尔及利亚',
            'Ecuador':'厄瓜多尔',
            'Egypt':'埃及',
            'Eritrea':'厄立特里亚',
            'Spain':'西班牙',
            'Estonia':'爱沙尼亚',
            'Ethiopia':'埃塞俄比亚',
            'Finland':'芬兰',
            'Fiji':'斐',
            'Falkland Islands':'福克兰群岛',
            'France':'法国',
            'Gabon':'加蓬',
            'United Kingdom':'英国',
            'Georgia':'格鲁吉亚',
            'Ghana':'加纳',
            'Guinea':'几内亚',
            'Gambia':'冈比亚',
            'Guinea Bissau':'几内亚比绍',
            'Eq. Guinea':'赤道几内亚',
            'Greece':'希腊',
            'Greenland':'格陵兰',
            'Guatemala':'危地马拉',
            'French Guiana':'法属圭亚那',
            'Guyana':'圭亚那',
            'Honduras':'洪都拉斯',
            'Croatia':'克罗地亚',
            'Haiti':'海地',
            'Hungary':'匈牙利',
            'Indonesia':'印度尼西亚',
            'India':'印度',
            'Ireland':'爱尔兰',
            'Iran':'伊朗',
            'Iraq':'伊拉克',
            'Iceland':'冰岛',
            'Israel':'以色列',
            'Italy':'意大利',
            'Jamaica':'牙买加',
            'Jordan':'约旦',
            'Japan':'日本',
            'Kazakhstan':'哈萨克斯坦',
            'Kenya':'肯尼亚',
            'Kyrgyzstan':'吉尔吉斯斯坦',
            'Cambodia':'柬埔寨',
            'Korea':'韩国',
            'Kosovo':'科索沃',
            'Kuwait':'科威特',
            'Lao PDR':'老挝',
            'Lebanon':'黎巴嫩',
            'Liberia':'利比里亚',
            'Libya':'利比亚',
            'Sri Lanka':'斯里兰卡',
            'Lesotho':'莱索托',
            'Lithuania':'立陶宛',
            'Luxembourg':'卢森堡',
            'Latvia':'拉脱维亚',
            'Morocco':'摩洛哥',
            'Moldova':'摩尔多瓦',
            'Madagascar':'马达加斯加',
            'Mexico':'墨西哥',
            'Macedonia':'马其顿',
            'Mali':'马里',
            'Myanmar':'缅甸',
            'Montenegro':'黑山',
            'Mongolia':'蒙古',
            'Mozambique':'莫桑比克',
            'Mauritania':'毛里塔尼亚',
            'Malawi':'马拉维',
            'Malaysia':'马来西亚',
            'Namibia':'纳米比亚',
            'New Caledonia':'新喀里多尼亚',
            'Niger':'尼日尔',
            'Nigeria':'尼日利亚',
            'Nicaragua':'尼加拉瓜',
            'Netherlands':'荷兰',
            'Norway':'挪威',
            'Nepal':'尼泊尔',
            'New Zealand':'新西兰',
            'Oman':'阿曼',
            'Pakistan':'巴基斯坦',
            'Panama':'巴拿马',
            'Peru':'秘鲁',
            'Philippines':'菲律宾',
            'Papua New Guinea':'巴布亚新几内亚',
            'Poland':'波兰',
            'Puerto Rico':'波多黎各',
            'Dem. Rep. Korea':'朝鲜',
            'Portugal':'葡萄牙',
            'Paraguay':'巴拉圭',
            'Qatar':'卡塔尔',
            'Romania':'罗马尼亚',
            'Rwanda':'卢旺达',
            'W. Sahara':'西撒哈拉',
            'Saudi Arabia':'沙特阿拉伯',
            'Sudan':'苏丹',
            'S. Sudan':'南苏丹',
            'Senegal':'塞内加尔',
            'Solomon Is.':'所罗门群岛',
            'Sierra Leone':'塞拉利昂',
            'El Salvador':'萨尔瓦多',
            'Somaliland':'索马里兰',
            'Somalia':'索马里',
            'Serbia':'塞尔维亚',
            'Suriname':'苏里南',
            'Slovakia':'斯洛伐克',
            'Slovenia':'斯洛文尼亚',
            'Sweden':'瑞典',
            'Swaziland':'斯威士兰',
            'Syria':'叙利亚',
            'Chad':'乍得',
            'Togo':'多哥',
            'Thailand':'泰国',
            'Tajikistan':'塔吉克斯坦',
            'Turkmenistan':'土库曼斯坦',
            'East Timor':'东帝汶',
            'Trinidad and Tobago':'特里尼达和多巴哥',
            'Tunisia':'突尼斯',
            'Turkey':'土耳其',
            'Tanzania':'坦桑尼亚',
            'Uganda':'乌干达',
            'Ukraine':'乌克兰',
            'Uruguay':'乌拉圭',
            'Uzbekistan':'乌兹别克斯坦',
            'Venezuela':'委内瑞拉',
            'Vietnam':'越南',
            'Vanuatu':'瓦努阿图',
            'West Bank':'西岸',
            'Yemen':'也门',
            'South Africa':'南非',
            'Zambia':'赞比亚',
            'Zimbabwe':'津巴布韦',
            "Côte d'Ivoire":'科特迪瓦'
    };
    // 数据
    let dataMap = [
        <% for(int i=0;i<205;i++)
        {%>
        {"name": "<%=pname[i]%>","value": <%=cnum[i]%>},
        <%
        }
        %>
        {"name": "<%=pname[205]%>","value": <%=cnum[205]%>}
    ]
    let option = {
        backgroundColor: "#1F1F1F",
        title: {    //地图显示标题
            show: false,
            text: '',
            top:"30px",
            left: 'center',
            textStyle: {color: '#000'}
        },
        visualMap: {   //图列显示柱
            type: 'piecewise',
            left:30,
            realtime: false,
            calculable : true,
            color: ['#A0522D','#EE5C42','#FF8247','#EEB422','#FFFF00','#FFFFFF'],
            pieces: [
            	{gte: 100000, label: '大于等于100000'},  
                {gte: 10000,lte: 99999, label: '大于10000'},            // (10, Infinity]
                {gte: 5000,lte: 9999, label: '大于5000'}, 
                {gte: 1000, lte: 4999, label: '大于1000'},       // (1, 9]
                {gte: 1, lte: 999,  label: '不足1000'},
                {lt: 1 , label: '0'},                          // (-Infinity, 1)
            ],
                
        },
        toolbox: {  //工具栏
            show: false,
            orient: 'vertical',
            top:50,
            itemGap:20,
            left:30,
            feature: {
                dataView: {readOnly: false},
                restore: {},
                saveAsImage: {}
            }
        },
        tooltip: {  //提示框组件
            show: true,
            trigger: 'item',
            formatter: ''
        },
        series: [{
            name:"累计确诊人数",
            type: 'map',
            mapType: 'world',
            roam: true,
            zoom: 1,
            mapLocation: {y: 100},
            data: dataMap,   //绑定数据
            nameMap: nameComparison,
            symbolSize: 12,
            label: {
                normal: {show: false},
                emphasis: {show: true}
            },
            itemStyle: {
                emphasis: {
                    borderColor: 'transparent',
                    borderWidth: 1
                }
            }
        }]
    };
    worldChart.setOption(option);
</script>
<script src="js/echarts.min.js"></script>
<script type="text/javascript">
var myChart = echarts.init(document.getElementById('main'));
        var option2 = {
        		title: {
                    text: '疫情确诊增长情况'
                },
                tooltip: {},
                legend: {
                    data:['确诊人数']
                },
        	    xAxis: {
        	        type: 'category',
        	    	axisLabel: {  
             		   interval:0,  
             		   rotate:15 ,
             		  textStyle: {
                          color: '#ffffff'
                      }
             		}  ,
                 data: ["<%=name[0]%>","<%=name[1]%>","<%=name[2]%>","<%=name[3]%>","<%=name[4]%>","<%=name[5]%>"
                 	,"<%=name[6]%>","<%=name[7]%>","<%=name[8]%>","<%=name[9]%>","<%=name[10]%>","<%=name[11]%>"]
        	    },
        	    yAxis: {
        	        type:'value'
        	       
        	    },
        	    series: [{
        	    	name: '确诊人数',
                    data: [<%=num[0]%>,<%=num[1]%>,<%=num[2]%>, <%=num[3]%>,<%=num[4]%> ,<%=num[5]%>
                    ,<%=num[6]%>,<%=num[7]%>,<%=num[8]%>,<%=num[9]%>,<%=num[10]%>,<%=num[11]%>],
        	        type: 'line',
					smooth: true
        	    }]
        	};
        // 指定图表的配置项和数据    
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option2);
        </script>
</html>