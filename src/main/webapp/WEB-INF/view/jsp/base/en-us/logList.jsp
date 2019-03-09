<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<table class="table table-hover">
    <thead>
    <tr>
        <th>ID</th>
        <th>User ID</th>
        <th>Time</th>
        <th>Operation category</th>
        <th>Details</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${logs}" var="log">
        <tr>
            <td>${log.id}</td>
            <td>${log.userId}</td>
            <td>
                <fmt:formatDate value="${log.date}" pattern="yyyy-MM-dd"/>
            </td>
            <td>${log.type}</td>
            <td>${log.note}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
