<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <title>Title</title>
    <link href="/images/common/favicon.ico" rel="icon">
    <link href="/css/common/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="/css/common/common.css" rel="stylesheet">
    <script src="/js/common/jquery/jquery-3.3.1.min.js"></script>
    <script src="/js/common/jquery/jquery.cookie.js"></script>
    <script src="/js/common/bootstrap/bootstrap.min.js"></script>
    <script src="/js/common/common.js"></script>
    <script src="/js/user/admin.js"></script>
</head>

<body>
<div class="app">
    <div class="card">
        <div class="card-header">
            <img src="/images/common/logo.png">
            <a href="/user/exit" class="btn btn-secondary btn-sm exit">退出登录</a>
        </div>
        <div class="card-body">
            <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
                <a class="navbar-brand" href="#">菜单</a>
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">用户管理</a>
                        <div class="dropdown-menu">
                            <a id="myinfo" class="dropdown-item" href="#">我的信息</a>
                            <div class="dropdown-divider"></div>
                            <a id="librarians" class="dropdown-item" href="#">全部图书管理员</a>
                            <div class="dropdown-divider"></div>
                            <a id="addLib" class="dropdown-item" href="#">新增图书管理员</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">系统设置</a>
                        <div class="dropdown-menu">
                            <a id="yajin" class="dropdown-item" href="#">设置读者押金</a>
                            <div class="dropdown-divider"></div>
                            <a id="fajin" class="dropdown-item" href="#">设置逾期罚金</a>
                            <div class="dropdown-divider"></div>
                            <a id="jyts" class="dropdown-item" href="#">设置默认借阅天数</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a id="addNote" class="nav-link" href="#">发布公告</a>
                    </li>
                </ul>
            </nav>
        </div>
        <div id="content" class="content">
            <div class="card" style="width: 650px; margin: 100px auto 0;">
                <div class="card-header">
                    <h5>作为系统管理员，相信您早已了解日常注意事项。<br/>总结起来，无外乎这三点：</h5>
                </div>
                <div class="card-body">
                    <p style="padding-left: 2em">#1）尊重别人的隐私。</p>
                    <p style="padding-left: 2em">#2）修改前要考虑（后果和风险）。</p>
                    <p style="padding-left: 2em">#3）权力越大，责任越大。</p>
                </div>
            </div>
        </div>
    </div>
</div>

<footer>
    <p>Copyright © 2017-2020 Biblisoft (ly.cn) 版权所有 - 自从一见桃花后，直至如今更不疑！陕ICP备13145201号</p>
    <p>服务微信: qingyuehanxi | 服务邮箱： qingyuehanxi@icloud.com</p>
</footer>
</body>
</html>
