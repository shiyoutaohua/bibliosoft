$(document).ready(function() {

    $("#myInfo").click(function(){
        $("#content").load('/user/myinfo');
    });

    $("#borrow").click(function(){
        $("#content").load('/book/borrow');
    });

    $("#return").click(function(){
        $("#content").load('/book/yiHuan');
    });
});