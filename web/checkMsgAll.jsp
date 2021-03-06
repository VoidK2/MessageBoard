<%--
  Created by IntelliJ IDEA.
  User: 13994
  Date: 2018/9/12
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>后台</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="layui/css/layui.css" rel="stylesheet" type="text/css"/>
    <link href="layui/css/layui.mobile.css" rel="stylesheet" type="text/css"/>
    <script src="layui/layui.all.js"></script>
</head>
<body class="layui-layout-body">
<%
    String userN = (String) session.getAttribute("userN");
    String userP = (String) session.getAttribute("userP");
%>
<%--头部导航栏--%>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">

        <div class="layui-logo">
            <i class="layui-icon layui-icon-website" style="font-size: 35px;"></i>
            留言板
        </div>
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">MessageBoard</a></li>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <%
                if (userN != null) {
            %>
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <i class="layui-icon layui-icon-username" style="font-size: 25px; "></i>
                    <%=userN%>
                </a>
            </li>
            <li class="layui-nav-item"><a href="process/destroySession.jsp">退了</a></li>
            <%}%>

            <%
                if (userN == null) {
            %>
            <li class="layui-nav-item">
                <a href="login.jsp">
                    <i class="layui-icon layui-icon-username" style="font-size: 25px; "></i>
                    请登录
                </a>
            </li>
            <li class="layui-nav-item"><a href="signup.jsp">注册</a></li>
            <%}%>

        </ul>
    </div>
    <%--左侧导航栏--%>
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <%if(userP != null){%>
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">站内信</a>
                    <dl class="layui-nav-child">
                        <%if (userP.equals("2")) {%>
                        <dd class="layui-this"><a href="checkMsg4Admin.jsp">查看站内信</a></dd>
                        <%}%>
                        <%if (userP.equals("1")) {%>
                        <dd class="layui-this"><a href="sendMsg4User.jsp">写站内信</a></dd>
                        <%}%>
                    </dl>
                </li>
                <li class="layui-nav-item  layui-nav-itemed">
                    <a class="" href="javascript:;">留言信息</a>
                    <dl class="layui-nav-child">
                        <dd class="layui-this"><a href="checkMsgAll.jsp">查看留言</a></dd>
                    </dl>
                </li>
            </ul>
            <%}%>
        </div>
    </div>

    <div class="layui-body" style="bottom: 0;border-left: solid 2px #1AA094;" id="admin-body">
        <!-- 内容主体区域 -->
        <%
            request.setCharacterEncoding("utf-8");
            String sql = String.format("select * from leavemsg1");
            System.out.println(sql);
            Connection conn;
            Statement stm;
            ResultSet rs=null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://39.108.90.113/messageboard?characterEncoding=UTF-8";
                conn = DriverManager.getConnection(url, "root", "ALIyun270400.");
                stm = conn.createStatement();
                rs = stm.executeQuery(sql);
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        <div class="layui-tab admin-nav-card layui-tab-brief" lay-filter="admin-tab">
            <ul class="layui-tab-title">
                <li class="layui-this">
                    <i class="fa fa-dashboard" aria-hidden="true"></i>
                    <cite>主面板</cite>
                </li>
            </ul>
            <table class="layui-table" lay-skin="line">
                <colgroup>
                    <col width="10">
                    <col width="10">
                    <col width="10">
                    <col width="10">
                    <col width="10">
                    <col width="200">
                </colgroup>
                <thead>
                <tr>
                    <th>标题</th>
                    <th>发起人</th>
                    <th>内容</th>
                    <th>时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <%while(rs.next()){%>
                <tr>
                    <td><%=rs.getString("title")%></td>
                    <td><%=rs.getString("author")%></td>
                    <td><%=rs.getString("msgone")%></td>
                    <td><%=rs.getTimestamp("time")%></td>
                    <td>
                        <a href="checkMsgOne.jsp?iid=<%=rs.getString("id")%>" class="layui-btn layui-btn-mini">详情</a>
                        <%if(userP.equals("2")||userN.equals(rs.getString("author"))){%>
                        <a href="process/doinfodelete4leave.jsp?iid=<%=rs.getString("id")%>" class="layui-btn layui-btn-danger layui-btn-mini">删除</a>
                        <%}%>
                    </td>
                </tr>
                <%}%>
                </tbody>
            </table>
            <div class="layui-container" align="center">
                <form class="layui-form" action="process/storageLeaveInfo.jsp" method="post">
                    <table class="layui-table" lay-skin="line">
                        <tbody>
                        <tr>
                            <td>标题： </td>
                            <td><input type="text" name="title" class="layui-input"></td>
                        </tr>
                        <tr>
                            <td>内容： </td>
                            <td><textarea name="info" id="t1" cols="100" rows="6"></textarea></td>
                        </tr>
                        </tbody>
                    </table>
                    <br>
                    <input type="submit" class="layui-btn layui-btn-normal" value="提交留言">
                </form>
            </div>
        </div>

        <div class="layui-footer">
            <!-- 底部固定区域 -->
            ©遵循MIT许可协议
            <i class="layui-icon layui-icon-link" style="font-size: 15px; "></i>
            <a herf="https://github.com/VoidK2/MessageBoard/tree/master">github链接</a>
        </div>
    </div>
    <script src="./layui/layui.all.js"></script>
    <script>
        //JavaScript代码区域
        layui.use('element', function () {
            var element = layui.element;
        });
    </script>
</body>
</html>
