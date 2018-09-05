<%--
  Created by IntelliJ IDEA.
  User: 13994
  Date: 2018/9/3
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("utf-8");
    String email1=request.getParameter("account");
    String passwd1=request.getParameter("password");
    System.out.println("获取到用户名密码:"+email1+passwd1);
    String passwd2;
    String permission2;
    String sql = String.format("select name_u,passwd,permission from user where name_u=\"%s\"",email1);
    System.out.println(sql);
    Connection conn;
    Statement stm;
    ResultSet rs = null;
    try{
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://39.108.90.113/messageboard?characterEncoding=UTF-8";
        conn = DriverManager.getConnection(url, "root", "ALIyun270400.");
        stm =conn.createStatement();
        rs = stm.executeQuery(sql);
    }
    catch (Exception e){
        e.printStackTrace();
    }
    rs.next();
    passwd2=rs.getString("passwd");
    permission2=rs.getString("permission");
    System.out.println("密码为："+passwd2+"  权限为："+permission2);
    if(passwd2.equals(passwd1)){
        session.setAttribute("userN",email1);
        session.setAttribute("userP",permission2);
        response.sendRedirect("../index.jsp");
    }
    else {
        response.sendRedirect("login_failure.jsp");
    }
%>
