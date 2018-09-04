<%--
  Created by IntelliJ IDEA.
  User: 13994
  Date: 2018/9/4
  Time: 8:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("utf-8");
    String iid=request.getParameter("iid");
    String feedback=request.getParameter("feedback");
    System.out.println("获取到回复"+feedback);
    String sql = String.format("update message set feedback=\'%s\',feedtime=now() where id=\'%s\'",feedback,iid);
    System.out.println(sql);
    Connection conn;
    Statement stm;
    try{
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://39.108.90.113/messageboard?characterEncoding=UTF-8";
        conn = DriverManager.getConnection(url, "root", "270400");
        stm =conn.createStatement();
        stm.execute(sql);
    }
    catch (Exception e){
        e.printStackTrace();
    }
    response.sendRedirect("../checkMsg4Admin.jsp");
%>
