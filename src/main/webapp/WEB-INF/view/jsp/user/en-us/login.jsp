<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <title>Sign in - Bibliosoft</title>
    <link href="/images/common/favicon.ico" rel="icon">
    <link href="/css/common/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="/css/common/common.css" rel="stylesheet">
    <link href="/css/user/login.css" rel="stylesheet">
    <script src="/js/common/jquery/jquery-3.3.1.min.js"></script>
    <script src="/js/common/jquery/jquery.cookie.js"></script>
    <script src="/js/common/bootstrap/bootstrap.min.js"></script>
    <script src="/js/common/common.js"></script>
    <script src="/js/user/login.js"></script>
</head>

<body>
<div class="app">
    <div class="card">
        <div class="card-header">
            <img src="/images/common/logo.png">
            <form id="lang">
                <select id="lang-list">
                    <option selected value="1">English(US)</option>
                    <option value="0">简体中文</option>
                </select>
            </form>
        </div>
        <div class="card-body">
            <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
                <form id="search" action="/search" class="form-inline" style="margin: 0">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Keyword">
                        <div class="input-group-append">
                            <button class="btn btn-success" type="submit">Search</button>
                        </div>
                    </div>
                </form>
            </nav>
            <form id="login" action="/login" method="post" style="display:block; width: 500px; margin: 0 auto;">
                <div class="form-group">
                    <label for="username">Account:</label>
                    <input id="username" name="username" class="form-control"/>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" class="form-control"/>
                </div>
                <input type="reset" value="Reset" class="btn btn-outline-secondary">
                <input type="submit" value="Login" class="btn btn-outline-success">
            </form>
        </div>
    </div>
    <footer>
        <p>Copyright © 2017-2020 Biblisoft (ly.cn) All rights reserved - 自从一见桃花后，直至如今更不疑！陕ICP备13145201号</p>
        <p>WeChat for help： qingyuehanxi | Email for help： qingyuehanxi@icloud.com</p>
    </footer>
</div>
</body>
</html>