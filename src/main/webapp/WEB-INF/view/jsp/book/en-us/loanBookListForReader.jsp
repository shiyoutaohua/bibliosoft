<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <title>Loan book list</title>
</head>

<body>
<div>
    <table class="table table-hover">
        <thead class="table">
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>Publisher</th>
            <th>Reader</th>
            <th>Borrow date</th>
            <th>State</th>
            <th>Overdue fine</th>
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
                    <c:if test="${loan.status ne 'Returned'}">
                        <td><a href="/book/return/${loan.loanId}">Return</a></td>
                    </c:if>
                    <c:if test="${loan.status eq 'Overdue'}">
                        <td><a href="/book/warn/${loan.loanId}">Notice</a></td>
                        <td><a href="/book/payFine/${loan.loanId}">Pay fine</a></td>
                    </c:if>
                    <c:if test="${loan.status eq 'Returned'}">
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
