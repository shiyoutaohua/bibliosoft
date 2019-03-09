<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <title>图书管理员</title>
    <link href="/images/common/favicon.ico" rel="icon">
    <link href="/css/common/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="/css/common/common.css" rel="stylesheet">
    <script src="/js/common/jquery/jquery-3.3.1.min.js"></script>
    <script src="/js/common/jquery/jquery.cookie.js"></script>
    <script src="/js/common/bootstrap/bootstrap.min.js"></script>
    <script src="/js/common/common.js"></script>
    <script src="/js/user/librarian.js"></script>
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
                            <a id="myInfo" class="dropdown-item" href="#">我的信息</a>
                            <div class="dropdown-divider"></div>
                            <a id="addReader" class="dropdown-item" href="#">新增读者</a>
                            <div class="dropdown-divider"></div>
                            <a id="allReader" class="dropdown-item" href="#">全部读者</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">书籍管理</a>
                        <div class="dropdown-menu">
                            <a id="addBook" class="dropdown-item" href="#">新增书籍</a>
                            <div class="dropdown-divider"></div>
                            <a id="allBook" class="dropdown-item" href="#">馆藏查询</a>
                            <div class="dropdown-divider"></div>
                            <a id="allLoan" class="dropdown-item" href="#">借出书籍</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a id="addNote" class="nav-link" href="#">发布公告</a>
                    </li>
                    <li class="nav-item">
                        <a id="income" class="nav-link" href="#">收入统计</a>
                    </li>
                    <li class="nav-item">
                        <a id="logs" class="nav-link" href="#">操作日志</a>
                    </li>
                    <li class="nav-item">
                        <a id="addTag" class="nav-link" href="#">添加标签</a>
                    </li>
                </ul>
            </nav>
        </div>
        <div id="content" class="content">
        </div>
    </div>
</div>

<footer>
    <p>Copyright © 2017-2020 Biblisoft (ly.cn) 版权所有 - 自从一见桃花后，直至如今更不疑！陕ICP备13145201号</p>
    <p>服务微信: qingyuehanxi | 服务邮箱： qingyuehanxi@icloud.com</p>
</footer>
</body>
</html>
