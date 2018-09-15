<%--
  Created by IntelliJ IDEA.
  User: 13994
  Date: 2018/9/3
  Time: 15:23
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
                <li class="layui-nav-item layui-nav-itemed">
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
                <li class="layui-nav-item">
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
            String sql = String.format("select * from message where admin=\'%s\'",userN);
            String sql2="select * from user where permission=1";
            System.out.println(sql);
            Connection conn;
            Statement stm,stm2;
            ResultSet rs=null,rs2=null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://39.108.90.113/messageboard?characterEncoding=UTF-8";
                conn = DriverManager.getConnection(url, "root", "ALIyun270400.");
                stm = conn.createStatement();
                rs = stm.executeQuery(sql);
                stm2=conn.createStatement();
                rs2 = stm2.executeQuery(sql2);
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
                    <th>用户</th>
                    <th>时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <%while(rs.next()){%>
                <tr>
                    <td><%=rs.getString("title")%></td>
                    <td><%=rs.getString("user")%></td>
                    <td><%=rs.getTimestamp("time")%></td>
                    <td>
                        <a href="replyMsg4Admin.jsp?iid=<%=rs.getString("id")%>" class="layui-btn layui-btn-mini">回复站内信</a>
                        <a href="process/doinfodelete4admin.jsp?iid=<%=rs.getString("id")%>" class="layui-btn layui-btn-danger layui-btn-mini">删除</a>
                    </td>
                </tr>
                <%}%>
                </tbody>
            </table>
        </div>
        <div class="layui-container" align="center" style="margin-top:50px;">
            <form class="layui-form" action="process/storageInfo4Admin.jsp" method="post">
                <table class="layui-table" lay-skin="line">
                    <tbody>
                    <div class="layui-form-item">
                        <label class="layui-form-label">选择用户：</label>
                        <div class="layui-input-block">
                            <select name="name" style="width:50px;">
                                <%while(rs2.next()){%>
                                <option value="<%=rs2.getString("name_u")%>"><%=rs2.getString("name_u")%></option>
                                <%}%>
                            </select>
                        </div>
                    </div>
                    <tr>
                        <label class="layui-form-label">内容：</label>
                        <textarea name="info" id="t1" cols="100" rows="6"></textarea>
                    </tr>
                    </tbody>
                </table>
                <br>
                <input type="submit" class="layui-btn layui-btn-normal" value="提交留言">
            </form>
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