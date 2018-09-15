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
    String feedback4admin=request.getParameter("feedback4admin");
    String userN = (String) session.getAttribute("userN");
    System.out.println("获取到回复"+feedback4admin);
    String sql = String.format("insert into message2" +
                    "(id,fromn,subject,sendtime) " +
                    "values(%s,\'%s\',\'%s\',now())"
            ,iid,userN,feedback4admin);
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
    response.sendRedirect("../replyMsg4Admin.jsp?iid="+iid);
%>
