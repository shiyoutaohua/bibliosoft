<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <title>Title</title>
</head>

<body>
<div>
    <table class="table table-hover">
        <thead class="table">
        <tr>
            <th>书籍编号</th>
            <th>书名</th>
            <th>作者</th>
            <th>出版社</th>
            <th>读者</th>
            <th>借阅日期</th>
            <th>状态</th>
            <th>逾期罚金</th>
            <th style="width: 2em"></th>
            <th style="width: 2em"></th>
            <th style="width: 4em"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${loanLists}" var="loan">
            <tr>
                <td>${loan.bookId}</td>
                <td>${loan.title}</td>
                <td>${loan.author}</td>
                <td>${loan.press}</td>
                <td>${loan.user}</td>
                <td><fmt:formatDate value="${loan.lendingDate}" pattern="yyyy-MM-dd"/></td>
                <td>${loan.status}</td>
                <td>${loan.fine}</td>
                <c:if test="${uLevel == 1}">
                    <c:if test="${loan.status ne '已还'}">
                        <td><a href="/book/return/${loan.loanId}">归还</a></td>
                    </c:if>
                    <c:if test="${loan.status eq '逾期'}">
                        <td><a href="/book/warn/${loan.loanId}">提醒</a></td>
                        <td><a href="/book/payFine/${loan.loanId}">清偿罚金</a></td>
                    </c:if>
                    <c:if test="${loan.status eq '已还'}">
                        <td style="width: 2em"></td>
                        <td style="width: 2em"></td>
                        <td style="width: 4em"></td>
                    </c:if>
                </c:if>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
