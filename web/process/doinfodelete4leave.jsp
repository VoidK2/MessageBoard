<%--
  Created by IntelliJ IDEA.
  User: 13994
  Date: 2018/9/12
  Time: 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("utf-8");
    String iid=request.getParameter("iid");
    String sql = String.format("delete from leavemsg1 where id=\'%s\'",iid);
    String sql2 = String.format("delete from leavemsg2 where id=\'%s\'",iid);
    System.out.println(sql);
    Connection conn;
    Statement stm,stm2;
    try{
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://39.108.90.113/messageboard?characterEncoding=UTF-8";
        conn = DriverManager.getConnection(url, "root", "ALIyun270400.");
        stm =conn.createStatement();
        stm.executeUpdate(sql);
        stm2=conn.createStatement();
        stm2.executeUpdate(sql2);
    }
    catch (Exception e){
        e.printStackTrace();
    }
    response.sendRedirect("../checkMsgAll.jsp");
%>
