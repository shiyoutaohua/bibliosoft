<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <title>Title</title>
    <link href="/css/common/bootstrap/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<div style="width: 650px; height: 400px; margin: 100px auto 0; border: #dcdcdc solid 1px; border-radius: 5px ">
    <div style="width:11em; margin: 50px auto;">
        <p style="width: 100%; text-align: center; margin-bottom: 0;">西安电子科技大学图书馆</p>
        <img src="/images/book/barcode/${imgName}" width="150" height="60" style="margin-left: 13px;"/>
        <p style="width: 100%; text-align: center;">${barcodeValue}</p>
        <a class="btn btn-outline-success btn-block" href="#" style="margin-top: 50px">打印条形码</a>
    </div>
</div>
</body>
</html>
