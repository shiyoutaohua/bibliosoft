$(document).ready(function () {
    $("#librarians").click(function () {
        $("#content").load('/user/librarians');
    });

    $("#myinfo").click(function () {
        $("#content").load('/user/myinfo');
    });

    $("#addNote").click(function () {
        $("#content").load('/user/addNote');
    });

    $("#addLib").click(function () {
        $("#content").load('/user/addLibrarian');
    });

    $("#yajin").click(function () {
        $("#content").load('/sys/yajin');
    });

    $("#fajin").click(function () {
        $("#content").load('/sys/fajin');
    });

    $("#jyts").click(function () {
        $("#content").load('/sys/jyts');
    });
});
