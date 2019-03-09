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
</head>

<body>
<div class="card">
    <div class="card-body">
        <form id="update" action="/update" method="post" style="display:block; width: 500px; margin: 0 auto;">
            <ul>
                <li class="list-group-item">${user.name}(${user.id})</li>
                <li class="list-group-item">
                    <div class="form-group">
                        <label for="password">password:</label>
                        <input id="password" name="password" class="form-control" value="${user.password}"/>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="form-group">
                        <label for="level">role:</label>
                        <select id="level" class="form-control">
                            <option selected value="${user.level}">${user.level}</option>
                        </select>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="form-group">
                        <label for="name">name:</label>
                        <input id="name" name="name" class="form-control" value="${user.name}"/>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="form-group">
                        <label for="email">e-mail:</label>
                        <input id="email" name="email" class="form-control" value="${user.email}"/>
                    </div>
                </li>
                <li class="list-group-item">
                    <input type="reset" value="cancel" class="btn btn-outline-secondary">
                    <input type="submit" value="modify" class="btn btn-outline-success">
                </li>
            </ul>
        </form>
    </div>
</div>
</body>
</html>
