<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>第一个jsp练习</title>
<style type="text/css">
	.style{
		background-color: pink;
	}
</style>
</head>
<body>
	<h2>这是第一个关于jsp的练习</h2>
	<div>
		First Java Server Pages
		<%
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		out.print(sdf.format(date));
		
		Long count=(Long)application.getAttribute("count");
		if(count==null){
			count=1L;
		}else{
			count++;
		}
		application.setAttribute("count", count);
	%>
	当前网页访问的次数:<%=count %>次.
	</div>
	<div>
		<!-- 使用循环输出List<String>中的数据，放在表格中，并实现隔行变换背景。 -->
		<%
			List<String> list = new ArrayList<String>();
			list.add("张三");
			list.add("王五");
			list.add("李四");
			list.add("赵柳");
			list.add("五柳");
			list.add("集美");
		%>
		<table>
			<tr>
				<th>序号</th>
				<th>姓名</th>
				<th>操作</th>
			</tr>
			<% for(int i=0;i<list.size();i++){ %>
			<tr <% if(i%2==0){out.print("class=\"style\"");}%>>
				<td><%= i+1 %></td>
				<td><%= list.get(i) %></td>
				<td><a href="#">删除</a></td>
			</tr>
			<%} %>
		</table>

	</div>
</body>
</html>