<%--
  Created by IntelliJ IDEA.
  User: 13994
  Date: 2018/9/3
  Time: 21:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("utf-8");
    String iid=request.getParameter("iid");
    String sql = String.format("delete from message where id=\'%s\'",iid);
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
