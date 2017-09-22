<%@ page import="secondhandapartment.Agent" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>居间业务管理主页</title>
</head>

<style type="text/css">
    *{
        margin: 0;
        padding: 0;
    }

    body{
        background: url("/assets/bg.jpg");
        background-size: cover;
    }

    div{
        margin: 0px auto;
    }

    ul{
        width: 100%;
    }

    li{
        list-style-type: none;
        color: #fff;
        display: inline-block;
        width: 16.667%;
        text-align: center;
        float: left;
    }

    li > a{
        font-size: 18px;
        color: dimgray;
        text-decoration: none;
    }

    li >a:hover{
        color: red;
    }

    .userinfo{
        width: 100%;
        height: 22px;
        background-color: #ececec;
    }

    .header{
        margin: 5px auto;
        height: 100px;
        width: 800px;
        background-color: #fff;
        vertical-align: middle;
        border: 1px gray solid;
        border-radius: 5px;
    }

    .content{
        height: 800px;
        width: 800px;
        background-color: white;
        border: 1px gray solid;
        border-radius: 5px;

    }
    .bottom{
        height: 100px;
        width: 800px;
        background-color: white;
        border: 1px gray solid;
        border-radius: 10px;
        margin: 5px auto;
        text-align: center;
    }

    .agentcontent{
        border: 1px gray solid;
        border-radius: 5px;
        width: 300px;
        height: 300px;
        margin: 5px 5px 5px 0;
        display: inline-block;
    }

    .housepic{
        border: 1px gray solid;
        border-radius: 5px;
        width: 480px;
        height: 300px;
        margin: 5px 0 5px 5px;
        display: inline-block;
    }

    .housepic > button{
        height: 20px;
        width: 20px;
    }

    .hotsecondhand{
        border: 1px gray solid;
        border-radius: 5px;
        width: 390px;
        height: 475px;
        margin: 0 0 5px 5px;
        display: inline-block;
    }

    .hotrental{
        border: 1px gray solid;
        border-radius: 5px;
        width: 390px;
        height: 475px;
        margin: 0 5px 5px 0;
        display: inline-block;
    }

    th{
        border-bottom: 2px gray solid;
        height: 25px;
        background-color: #ececec;
        border-radius: 5px 5px 0 0;
    }

    td{
        border-bottom: 1px gray dotted;
        text-align: center;
        overflow: hidden;
        text-overflow:ellipsis;
        white-space: nowrap;
    }

    td > a{
        color: dimgray;
        text-decoration: none;
    }

    a:hover{
        color: red;
    }

    .housetitle > a{
        display: inline-block;
        width: 300px;
    }

    .houselocation{
        width: 5em;
    }

    div{
        vertical-align: top;
    }

    img{
        width: 100%;
        height: 90%;
        border-radius: 5px;
    }

    .btnselected{
        background-color: lightgray;
    }

</style>

<body>

<div class="userinfo">
    <span id="userinfo" style="float: right;color: gray;font-size: 14px; margin-right: 20px">欢迎您，<a href="login" style="color: blue;">请登陆</a></span>
</div>

<div class="header">

    <div class="title">
        <h1 style="font-size: 30px; margin: 10px;display: inline-block;">二手房电子商务交易平台</h1>
    </div>

    <div class="navigation">
        <ul>
            <li><a href="#">二手房</a></li>
            <li><a href="#">出租房</a></li>
            <li><a href="#">楼盘介绍</a></li>
            <li><a href="#">经纪人</a></li>
            <li><a href="#">我要看房/放盘</a></li>
            <li><a href="#">联系我们</a></li>
        </ul>
    </div>

</div>

<div class="content">

    <div class="line1">
        <div class="housepic" style="text-align: center">
            <a class="imga" href="#"><img class="showimg" src="../assets/client/1.jpg" alt="1"></a>
            <a class="imga" href="#" hidden><img class="showimg" src="../assets/client/2.jpg" alt="2"></a>
            <a class="imga" href="#" hidden><img class="showimg" src="../assets/client/3.jpg" alt="3"></a>
            <a class="imga" href="#" hidden><img class="showimg" src="../assets/client/4.jpg" alt="4"></a>
            <a class="imga" href="#" hidden><img class="showimg" src="../assets/client/5.jpg" alt="5"></a>
            <br>
            <button id="showbtn1" class="btnselected" onclick="changeImg(1)">1</button>
            <button id="showbtn2" onclick="changeImg(2)">2</button>
            <button id="showbtn3" onclick="changeImg(3)">3</button>
            <button id="showbtn4" onclick="changeImg(4)">4</button>
            <button id="showbtn5" onclick="changeImg(5)">5</button>
        </div>
        <div class="agentcontent">
            <table style="width: 100%; height: 100%">
                <tr><th colspan="3"><a href="#" style="color: gray; text-decoration: none">经纪人TOP10</a></th></tr>
                <g:each in="${secondhandapartment.Agent.list(max: 10, sort: "point", order: "desc")}" var="object" status="i">
                    <tr><td><a href="#">${i+1}. ${object.name}</a></td><td>${object.job}</td><td>${object.district}</td></tr>
                </g:each>
            </table>
        </div>
    </div>
    <div class="line2">
        <div class="hotsecondhand">
            <table style="width: 390px; height: 100%">
                <tr><th colspan="2"><a href="#" style="color: gray; text-decoration: none">热门二手房</a></th></tr>
                <g:each in="${(secondhandapartment.House.where{isSecondHandHouse == true}).list(max: 15, order: "desc", sort: "like")}" var="object">
                    <tr><td class="housetitle"><a href="#">${object.houseTitle}</a></td><td class="houselocation">${object.district}</td></tr>
                </g:each>
            </table>
        </div>
        <div class="hotrental">
            <table style="width: 390px; height: 100%">
                <tr><th colspan="2"><a href="#" style="color: gray; text-decoration: none">热门出租房</a></th></tr>
                <g:each in="${(secondhandapartment.House.where{isSecondHandHouse == false}).list(max: 15, order: "desc", sort: "like")}" var="object">
                    <tr><td class="housetitle"><a href="#">${object.houseTitle}</a></td><td class="houselocation">${object.district}</td></tr>
                </g:each>
            </table>
        </div>
    </div>

</div>

<div class="bottom">
    &nbsp
    <br>
    二手房电子商务交易平台
    <br>
    By JackFung
    <br>
    2017.9
</div>

<script type="text/javascript">
    var imgs = document.getElementsByClassName('imga');
    var currentImgNumber = 1;
    function changeImg(number) {
        for (var i = 1; i <= 5; i++){
            document.getElementById('showbtn' + i).className = number == i ? 'btnselected' : ' ';
        }
        for (var i = 0; i < imgs.length; i++){
            currentImgNumber = number;
            imgs[i].hidden = i == number-1 ? false : true;
        }
    }


    //设置首页图片轮播
    setInterval(function () {
        changeImg(currentImgNumber);
        currentImgNumber = currentImgNumber == imgs.length ? 1 : currentImgNumber+1;
    }, 3000);
</script>

</body>
</html>