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
<div>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>ID</th>
            <th>Type</th>
            <th>Amount</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>1</td>
            <td>Reader deposit</td>
            <td>${yajin}</td>
        </tr>
        <tr>
            <td>2</td>
            <td>Overdue fine</td>
            <td>${fine}</td>
        </tr>
        <tr>
            <td>3</td>
            <td>lump sum</td>
            <td>${fine + yajin}</td>
        </tr>
        </tbody>
    </table>
</div>

</body>
</html>
