<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <title>读者</title>
    <link href="/images/common/favicon.ico" rel="icon">
    <link href="/css/common/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="/css/common/common.css" rel="stylesheet">
    <script src="/js/common/jquery/jquery-3.3.1.min.js"></script>
    <script src="/js/common/jquery/jquery.cookie.js"></script>
    <script src="/js/common/bootstrap/bootstrap.min.js"></script>
    <script src="/js/common/common.js"></script>
    <script src="/js/user/reader.js"></script>
</head>

<body>
<div class="app">
    <div class="card">
        <div class="card-header">
            <img src="/images/common/logo.png">
            <a href="/user/exit" class="btn btn-secondary btn-sm exit">log out</a>
        </div>
        <div class="card-body">
            <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
                <a class="navbar-brand" href="#">MENU</a>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a id="myInfo" class="nav-link" href="#">My Info</a>
                    </li>
                    <li class="nav-item">
                        <a id="borrow" class="nav-link" href="#">Borrowed books</a>
                    </li>
                    <li class="nav-item">
                        <a id="return" class="nav-link" href="#">Returned books </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/book/search">Search</a>
                    </li>
                </ul>
            </nav>
        </div>
        <div id="content" class="content">
            <div class="card" style="width: 500px; min-height: 500px; margin: 50px auto 0;">
                <div class="card-header alert-danger">
                    <h5>System Bulletin </h5>
                </div>
                <div class="card-body">
                    <div class="list-group">
                        <c:forEach items="${notes}" var="note">
                            <a href="/user/note/detail/${note.id}" class="list-group-item list-group-item-action">
                                    ${note.head} - <fmt:formatDate value="${note.date}"
                                                                   pattern="yyyy-MM-dd"/>(${note.userId})
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <p>Copyright © 2017-2020 Biblisoft (ly.cn) All rights reserved - 自从一见桃花后，直至如今更不疑！陕ICP备13145201号</p>
        <p>WeChat for help： qingyuehanxi | Email for help： qingyuehanxi@icloud.com</p>
    </footer>
</div>
</body>
</html>
