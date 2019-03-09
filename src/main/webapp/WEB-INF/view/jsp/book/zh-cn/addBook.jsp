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
<div class="card" style="width: 500px; min-height: 500px; margin: 10px auto 0;">
    <div class="card-header">
        <h5>新增书籍</h5>
    </div>
    <form id="addBook" action="/book/addBook" method="post">
        <div class="form-group">
            <label for="ISBN">ISBN:</label>
            <div class="input-group">
                <input id="ISBN" name="ISBN" class="form-control"/>
                <div class="input-group-append">
                    <button id="getInfoByISBN" class="btn btn-info" type="button">查询</button>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="title">书名:</label>
            <input id="title" name="title" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="author">作者:</label>
            <input id="author" name="author" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="press">出版社:</label>
            <input id="press" name="press" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="pubDate">出版日期:</label>
            <input id="pubDate" name="pubDate" class="form-control" placeholder="格式：1970-01-01"/>
        </div>
        <div class="form-group">
            <label for="tag">标签:</label>
            <input id="tag" name="tag" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="location">位置:</label>
            <input id="location" name="location" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="count">数量:</label>
            <input id="count" name="count" class="form-control" value="1"/>
        </div>
        <input type="submit" value="提交" class="btn btn-sm btn-outline-success" style="float: right; margin-left: 20px">
        <input type="reset" value="放弃" class="btn btn-sm btn-outline-secondary" style="float: right">
    </form>
</div>
</body>

<script>
    $(document).ready(function () {
        $("#getInfoByISBN").click(function () {
            var url = "https://api.douban.com/v2/book/isbn/" + $("#ISBN").val()
            $.ajax({
                url: url,
                type: 'GET',
                dataType: 'JSONP',
                success: function (data) {
                    $("#title").val(data.title);
                    $("#author").val(data.author[0]);
                    $("#press").val(data.publisher);
                    $("#pubDate").val(data.pubdate);
                    $("#tag").val(data.tags[0].title+"|"+data.tags[1].title);
                }
            });
        });
    });
</script>
</html>
