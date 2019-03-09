<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
</head>

<body>
<div class="card" style="width: 500px; min-height: 500px; margin: 10px auto 0;">
    <div class="card-header">
        <h5>修改书籍信息-(${book.id})</h5>
    </div>
    <form id="addBook" action="/book/update/${book.id}" method="post">
        <div class="form-group">
            <label for="ISBN">ISBN:</label>
            <input id="ISBN" name="ISBN" class="form-control" value="${book.ISBN}"/>
        </div>
        <div class="form-group">
            <label for="title">书名:</label>
            <input id="title" name="title" class="form-control" value="${book.title}"/>
        </div>
        <div class="form-group">
            <label for="author">作者:</label>
            <input id="author" name="author" class="form-control" value="${book.author}"/>
        </div>
        <div class="form-group">
            <label for="press">出版社:</label>
            <input id="press" name="press" class="form-control" value="${book.press}"/>
        </div>
        <div class="form-group">
            <label for="pubDate">出版日期:</label>
            <input id="pubDate" name="pubDate" class="form-control"
                   value="<fmt:formatDate value="${book.publishDate}" pattern="yyyy-MM-dd"/>
            "/>
        </div>
        <div class="form-group">
            <label for="tag">标签:</label>
            <input id="tag" name="tag" class="form-control" value="${book.tag}"/>
        </div>
        <div class="form-group">
            <label for="location">位置:</label>
            <input id="location" name="location" class="form-control" value="${book.location}"/>
        </div>
        <div class="form-group">
            <label for="status">状态:</label>
            <input id="status" name="status" class="form-control" value="${book.status}"/>
        </div>
        <input type="submit" value="提交" class="btn btn-sm btn-outline-success" style="float: right; margin-left: 20px">
        <input type="reset" value="放弃" class="btn btn-sm btn-outline-secondary" style="float: right">
    </form>
</div>
</body>
</html>
