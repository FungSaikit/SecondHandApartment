<%@ page import="secondhandapartment.Agent" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>查看二手房</title>
</head>

<style type="text/css">
    * {
        margin: 0;
        padding: 0;
    }

    body {
        background: url("../assets/bg.jpg");
        background-size: cover;
    }

    div {
        margin: 0px auto;
    }

    ul {
        width: 100%;
    }

    li {
        list-style-type: none;
        color: #fff;
        display: inline-block;
        width: 16.667%;
        text-align: center;
        float: left;
    }

    a {
        font-size: 18px;
        color: dimgray;
        text-decoration: none;
    }

    a:hover {
        color: red;
    }

    .userinfo {
        width: 100%;
        height: 22px;
        background-color: #ececec;
    }

    .header {
        margin: 5px auto;
        height: 100px;
        width: 800px;
        background-color: #fff;
        vertical-align: middle;
        border: 1px gray solid;
        border-radius: 5px;
    }

    .content {
        height: 800px;
        width: 800px;
        background-color: white;
        border: 1px gray solid;
        border-radius: 5px;

    }

    .bottom {
        height: 100px;
        width: 800px;
        background-color: white;
        border: 1px gray solid;
        border-radius: 10px;
        margin: 5px auto;
        text-align: center;
    }

    .agentcontent {
        border: 1px gray solid;
        border-radius: 5px;
        width: 300px;
        height: 300px;
        margin: 5px 5px 5px 0;
        display: inline-block;
    }

    .housepic > button {
        height: 20px;
        width: 20px;
    }

    .title{
        font-weight: bold;
    }

    .filter{
        padding: 10px;
        border-bottom: 1px gray solid;
    }

    .filter1{
        padding: 5px;
    }

    .filter2{
        padding: 5px;
    }

    .filter2 > button {
        height: 20px;
        width: 40px;
    }

    .houselist{
        width: 100%;
        height: 680px;
    }

    .page{
        text-align: center;
        border-top: 1px gray solid;
    }

    .pagebutton{
        margin: 5px;
        width: 50px;
        height: 25px;
    }

    .houseline{
        border-top: 1px solid lightgray;
        border-bottom: 1px solid lightgray;
        height: 120px;
        vertical-align: top;
        margin-bottom: 10px;
    }


    .housepic{
        height: 120px;
        width: 160px;
    }

    .housedetail{
        height: 120px;
        width: 560px;
        display: inline-block;
        vertical-align: top;
    }

    .housetitle{
        vertical-align: top;
    }

    .houseprice{
        height: 120px;
        width: 65px;
        display: inline-block;
        vertical-align: top;
        color: red;
    }

    .houseprice > span{
        position: relative;
        top: 40px;
    }
</style>

<body onload="onloadData()">

<div class="userinfo">
    <span id="userinfo" style="float: right;color: gray;font-size: 14px; margin-right: 20px">欢迎您，<a id="username" href="login" style="color: blue; font-size: 14px; text-decoration: underline">请登陆</a></span>
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

    <div class="filter">
        <div class="filter1">
            <span class="title">区域：</span>
            <span>&nbsp省</span>
            <select id="province">
                <option value="none">不限</option>
            </select>
            <span>&nbsp市</span>
            <select id="city">
                <option value="none">不限</option>
            </select>
            <span>&nbsp区</span>
            <select id="district">
                <option value="none">不限</option>
            </select>
            <span class="title">&nbsp售价：</span>
            <select id="price">
                <option value="none">不限</option>
                <option value="1m">100万以内</option>
                <option value="2m">100万-200万(不含)</option>
                <option value="5m">200万-500万(不含)</option>
                <option value="10m">500万-1000万(不含)</option>
                <option value="max">1000万以上</option>
            </select>
            <span class="title">&nbsp面积：</span>
            <select id="area">
                <option value="none">不限</option>
                <option value="50">50m²以下</option>
                <option value="100">50m²-100m²(不含)</option>
                <option value="150">100m²-150m²(不含)</option>
                <option value="200">150m²-200m²(不含)</option>
                <option value="max">200m²以上</option>
            </select>
        </div>

        <div class="filter2">
            <span class="title">关键词：&nbsp</span>
            <input id="keyword" type="text">
            <button>搜索</button>
        </div>
    </div>

    <div class="houselist" style="text-align: left">
        <div style="color: gray; font-size: 14px; padding: 5px">共找到 <span style="color: blue">12345</span> 条结果</div>

        <g:each in="${(secondhandapartment.House.where {isSecondHandHouse == true}).list(max: 5, order: "desc", sort: "like")}" status="i" var="object">
            <div class="houseline">
                <img src="../assets/client/${i+1}.jpg" class="housepic">
                <div class="housedetail">
                    <a class="housetitle" href="#">${object.houseTitle}</a><br>
                    <span>楼盘：${object.housingProduct}</span><br>
                    <span>楼层：${object.houseFloor}</span><br>
                    <span>建筑面积：${object.houseBuildingArea}m²</span><br>
                    <span>经纪人：<a href="#">${object.agent}</a></span><br>
                </div>
                <div class="houseprice"><span>${object.housePrice/10000}万</span></div>
            </div>
        </g:each>



    </div>

    <div class="page">
        <button class="pagebutton" onclick="lastPage()">上一页</button>
        <span>第 </span><input id="currentpage" style="width: 2em;text-align: center;" value="1"><span> 页</span>
        <button class="pagebutton" onclick="nextPage()">下一页</button>
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

    function onloadData() {
        var username = sessionStorage.getItem('username');
        if (username != null)
            document.getElementById('username').innerHTML = username;
    }

    function nextPage() {
       self.location = '#';
    }

    function lastPage() {
        self.location = '#';
    }

</script>

</body>
</html>