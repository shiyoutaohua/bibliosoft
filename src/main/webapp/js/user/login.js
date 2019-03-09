$(document).ready(function() {
    $("#lang").change(function () {
        var lang = $("#lang-list").val();
        $.cookie("lang", lang);
        console.log("lang值: " + lang + "已写入Cookie");
        window.location.reload();
    });

});

