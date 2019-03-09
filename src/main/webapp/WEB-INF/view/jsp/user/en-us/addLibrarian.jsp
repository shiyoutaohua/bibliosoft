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
</head>

<body>
<div class="card" style="width: 500px; min-height: 500px; margin: 50px auto 0;">
    <div class="card-header">
        <h5>Add Librarian</h5>
    </div>
    <form action="/user/addLibrarian" method="post">
        <div class="form-group">
            <label for="account">account:</label>
            <input id="account" name="account" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="name">name:</label>
            <input id="name" name="name" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="email">e-mail:</label>
            <input id="email" name="email" class="form-control"/>
        </div>
        <input type="submit" value="submit" class="btn btn-sm btn-outline-success" style="float: right; margin-left: 20px">
        <input type="reset" value="cancel" class="btn btn-sm btn-outline-secondary" style="float: right">
    </form>
</div>
</body>
</html>
