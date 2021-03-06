<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <title>添加标签</title>
    <link href="/images/common/favicon.ico" rel="icon">
    <link href="/css/common/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="/css/common/common.css" rel="stylesheet">
    <script src="/js/common/jquery/jquery-3.3.1.min.js"></script>
    <script src="/js/common/jquery/jquery.cookie.js"></script>
    <script src="/js/common/bootstrap/bootstrap.min.js"></script>
    <script src="/js/common/common.js"></script>
</head>
<body>
<ul class="list-group" style="list-style: none; color: #5b951b; margin-top: 2em">
    <li>
        当前标签:
        <c:forEach items="${tags}" var="tag">
            &nbsp;&nbsp;${tag}
        </c:forEach>
    </li>
</ul>
<div class="card" style="width: 500px; min-height: 500px; margin: 50px auto 0;">
    <div class="card-header">
        <h5>添加标签</h5>
    </div>
    <form action="/book/addTag" method="post">
        <div class="form-group">
            <label for="tag">标签名:</label>
            <input id="tag" name="tag" class="form-control" placeholder="请输入新标签"/>
        </div>
        <input type="submit" value="提交" class="btn btn-sm btn-outline-success" style="float: right; margin-left: 20px">
        <input type="reset" value="放弃" class="btn btn-sm btn-outline-secondary" style="float: right">
    </form>
</div>

</body>
</html>
