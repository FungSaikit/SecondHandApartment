<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>居间业务管理主页</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.24/browser.min.js"></script>
    <script src="https://unpkg.com/react@latest/dist/react.js"></script>
    <script src="https://unpkg.com/react-dom@latest/dist/react-dom.js"></script>
</head>

<style type="text/css">
    *{
        margin: 0;
        padding: 0;
    }

    div{
        margin: 0px auto;
    }

    h1{
        color: white;
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
    }

    .header{
        height: 80px;
        width: 800px;
        background-color: rebeccapurple;
        vertical-align: middle;
    }
    .navigation{
        height: 50px;
        width: 800px;
    }
    .content{
        height: 800px;
        width: 800px;
        background-color: skyblue;
    }
    .bottom{
        height: 100px;
        width: 800px;
        background-color: pink;
    }

</style>

<body>

<div class="header">
    <div class="title"></div>
    <div class="navigation"></div>
</div>
<div class="content">${myName}</div>
<div class="bottom"></div>

<script type="text/babel">

    const title = <h1>居间业务管理系统</h1>;
    ReactDOM.render(
        title,
        document.getElementsByClassName('title')[0]
    );

    const navigationArray = ['二手房', '出租房', '楼盘展示', '经纪人', '我要买房', '联系我们'];
    const list = navigationArray.map((item) => <li><a href="#">{item}</a></li>);
    ReactDOM.render(
        <ul>
            {list}
        </ul>,
        document.getElementsByClassName('navigation')[0]
    );

</script>


</body>
</html>