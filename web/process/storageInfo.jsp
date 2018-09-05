<%--
  Created by IntelliJ IDEA.
  User: 13994
  Date: 2018/9/3
  Time: 21:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("utf-8");
    String title=request.getParameter("title");
    String info=request.getParameter("info");
    System.out.println("获取到内容:"+title+info);
    String userN = (String) session.getAttribute("userN");
    String sql = String.format("insert into message" +
                    "(from_u,to_u,title,info,senddate) " +
                    "values(\'admin\',\'%s\',\'%s\',\'%s\',now())"
            ,userN,title,info);
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
    response.sendRedirect("../sendMsg4User.jsp");
    
%>
