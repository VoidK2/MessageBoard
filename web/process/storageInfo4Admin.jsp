<%--
  Created by IntelliJ IDEA.
  User: 13994
  Date: 2018/9/13
  Time: 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("utf-8");
    String user=request.getParameter("name");
    String t1=request.getParameter("info");
    String userN = (String) session.getAttribute("userN");
    System.out.println("获取到回复"+t1);
    String sql = String.format("insert into message" +
                    "(title,user,admin,time) " +
                    "values(\'%s\',\'%s\',\'%s\',now())"
            ,t1,user,userN);
    System.out.println(sql);
    Connection conn;
    Statement stm;
    try{
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://39.108.90.113/messageboard?characterEncoding=UTF-8";
        conn = DriverManager.getConnection(url, "root", "ALIyun270400.");
        stm =conn.createStatement();
        stm.executeUpdate(sql);
    }
    catch (Exception e){
        e.printStackTrace();
    }
    response.sendRedirect("../checkMsg4Admin.jsp");

%>
