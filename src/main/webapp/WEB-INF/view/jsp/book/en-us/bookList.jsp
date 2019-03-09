<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <title>Book list</title>
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
    <form id="search" action="/book/search" method="post" class="form-inline" style="margin: 0; float: right;">
        <div class="input-group">
            <input type="text" name="keyWord" class="form-control" placeholder="Please input keyword to search book">
            <div class="input-group-append">
                <button class="btn btn-success" type="submit">Search</button>
            </div>
        </div>
    </form>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>Publisher</th>
            <th>Publish date</th>
            <th>Tag</th>
            <th>ISBN</th>
            <th>Location</th>
            <th>State</th>
            <c:choose>
                <c:when test="${uLevel == 0}">
                    <th style="width: 4em"></th>
                    <th style="width: 2em"></th>
                    <th style="width: 2em; color: red;"></th>
                </c:when>
                <c:when test="${uLevel == 1}">
                    <th style="width: 4em"></th>
                    <th style="width: 2em"></th>
                    <th style="width: 2em; color: red;"></th>
                </c:when>
                <c:when test="${uLevel == 2}">
                    <th style="width: 2em"></th>
                </c:when>
                <c:otherwise/>
            </c:choose>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${books}" var="book">
            <tr>
                <td>${book.id}</td>
                <td>${book.title}</td>
                <td>${book.author}</td>
                <td>${book.press}</td>
                <td>
                    <fmt:formatDate value="${book.publishDate}" pattern="yyyy-MM-dd"/>
                </td>
                <td>${book.tag}</td>
                <td>${book.ISBN}</td>
                <td>${book.location}</td>
                <td>${book.status}</td>
                <c:choose>
                    <c:when test="${uLevel == 0}">
                        <td><a href="/book/barcode/${book.id}">Barcode</a></td>
                        <td><a href="/book/delete/${book.id}" style="color: #999">Delete</a></td>
                        <td><a href="/book/update/${book.id}">Edit</a></td>
                    </c:when>
                    <c:when test="${uLevel == 1}">
                        <td><a href="/book/barcode/${book.id}">Barcode</a></td>
                        <td><a href="/book/delete/${book.id}" style="color: #999">Delete</a></td>
                        <td><a href="/book/update/${book.id}">Edit</a></td>
                        <c:if test="${book.status eq 'Reserved'}">
                            <td><a href="/book/jie/${book.id}">Borrow</a></td>
                        </c:if>
                        <c:if test="${book.status ne 'Reserved'}">
                            <td></td>
                        </c:if>
                    </c:when>
                    <c:when test="${uLevel == 2}">
                        <c:if test="${book.status eq 'AtLibrary'}">
                            <td><a href="/book/order/${book.id}">Reserve</a></td>
                        </c:if>
                        <c:if test="${book.status != 'AtLibrary'}">
                            <td/>
                        </c:if>
                    </c:when>
                    <c:otherwise/>
                </c:choose>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
