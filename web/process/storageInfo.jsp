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
                    "(from_u,to_u,title,time) " +
                    "values(\'admin\',\'%s\',\'%s\',now())"
            ,userN,title);
    System.out.println(sql);
    String iid=null;
    String sql2=String.format("select id from message where title=\'%s\'",title);
    Connection conn;
    Statement stm,stm2,stm3;
    ResultSet rs=null;
    try{
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://39.108.90.113/messageboard?characterEncoding=UTF-8";
        conn = DriverManager.getConnection(url, "root", "ALIyun270400.");
        stm =conn.createStatement();
        stm.executeUpdate(sql);

        stm2=conn.createStatement();
        rs=stm2.executeQuery(sql2);
        rs.next();

        iid=rs.getString("id");
        System.out.println("获取id"+iid);
        System.out.println(sql2);
        String sql3 = String.format("insert into message2" +
                        "(id,user,subject,sendtime) " +
                        "values(%s,\'%s\',\'%s\',now())"
                ,iid,userN,info);
        System.out.println(sql3);

        stm3 =conn.createStatement();
        stm3.executeUpdate(sql3);
    }
    catch (Exception e){
        e.printStackTrace();
    }


    response.sendRedirect("../sendMsg4User.jsp");
    
%>
