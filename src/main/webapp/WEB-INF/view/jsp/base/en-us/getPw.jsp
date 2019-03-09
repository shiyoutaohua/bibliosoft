<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <title>Retrieve password</title>
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
        <h5>recover password</h5>
    </div>
    <form action="/retrievePw" method="post">
        <div class="form-group">
            <label for="account">ID:</label>
            <input id="account" name="account" class="form-control" placeholder="Please enter the account to be retrieved"/>
        </div>
        <input type="submit" value="submit" class="btn btn-sm btn-outline-success" style="float: right; margin-left: 20px">
        <input type="reset" value="reset" class="btn btn-sm btn-outline-secondary" style="float: right">
    </form>
</div>

</body>
</html>
