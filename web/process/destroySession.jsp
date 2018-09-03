<%--
  Created by IntelliJ IDEA.
  User: 13994
  Date: 2018/9/3
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%--删除所有session--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.invalidate();
    response.sendRedirect("../index.jsp");
%>
