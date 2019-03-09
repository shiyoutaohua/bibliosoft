<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<ul class="list-group" style="list-style: none; color: #5b951b; margin-top: 2em">
    <li>
        Current settings:
        <c:choose>
            <c:when test="${key eq 'yajin'}">
                &nbsp;&nbsp;Reader registration deposit:&nbsp;<span style="color: red">${value}</span>&nbsp;(yuan)
            </c:when>
            <c:when test="${key eq 'fajin'}">
                &nbsp;&nbsp;Borrowing overdue fines:&nbsp;<span style="color: red">${value}</span>&nbsp;(yuan/day)
            </c:when>
            <c:when test="${key eq 'jyts'}">
                &nbsp;&nbsp;Default borrowing time:&nbsp;<span style="color: red">${value}</span>&nbsp;(day)
            </c:when>
        </c:choose>
    </li>
</ul>
<div class="card" style="width: 500px; min-height: 500px; margin: 50px auto 0;">
    <div class="card-header">
        <h5>Modify system configuration</h5>
    </div>
    <form action="/sys/${key}" method="post">
        <div class="form-group">
            <label for="value">
                <c:choose>
                    <c:when test="${key eq 'yajin'}">
                        Modify Reader registration deposit
                    </c:when>
                    <c:when test="${key eq 'fajin'}">
                        Modify Borrowing overdue fines
                    </c:when>
                    <c:when test="${key eq 'jyts'}">
                        Modify Default borrowing time
                    </c:when>
                </c:choose>
            </label>
            <input id="value" name="value" class="form-control" placeholder="Please enter new parameters"/>
        </div>
        <input type="submit" value="submit" class="btn btn-sm btn-outline-success" style="float: right; margin-left: 20px">
        <input type="reset" value="reset" class="btn btn-sm btn-outline-secondary" style="float: right">
    </form>
</div>

</body>
</html>
