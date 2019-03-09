$(document).ready(function() {

    $("#myInfo").click(function(){
        $("#content").load('/user/myinfo');
    });

    $("#allReader").click(function(){
        $("#content").load('/user/readers');
    });

    $("#allBook").click(function(){
        $("#content").load('/book/books');
    });

    $("#addBook").click(function(){
        $("#content").load('/book/addBook');
    });

    $("#addReader").click(function(){
        $("#content").load('/user/addReader');
    });

    $("#logs").click(function(){
        $("#content").load('/logs');
    });

    $("#allLoan").click(function(){
        $("#content").load('/book/allLoan');
    });

    $("#addNote").click(function(){
        $("#content").load('/user/addNote');
    });

    $("#income").click(function(){
        $("#content").load('/income');
    });

    $("#addTag").click(function(){
        $("#content").load('/book/addTag');
    });

});
