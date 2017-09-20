<!DOCTYPE html>
<html lang="en">
<head>
    <g:javascript library="prototype" />
    <meta charset="UTF-8">
    <title>登陆-二手房电子商务交易平台</title>

    <style type="text/css">
        * {
            margin: 0;
            padding: 0px;
        }

        body {
            background: url("/assets/bg.jpg");
            background-size: cover;
            vertical-align: middle;
            font-family: 黑体;
        }

        .box {
            border: 1px gray solid;
            width: 300px;
            height: 230px;
            text-align: center;
            background-color: #fff;
            position: fixed;
            left: 0;
            right: 0;
            top: 0px;
            bottom: 200px;
            margin: auto;
            border-radius: 10px;
        }

        #registerbox{
            height: 400px;
        }

        input {
            width: 100%;
            height: 30px;
            margin: 5px 0px;
        }

        button {
            height: 30px;
            width: 50px;
            margin-bottom: 20px;
        }

        .registertitle {
            font-size: 14px;
            color: gray;
        }

        .registerleft{
            width: 4em;
            text-align: right;
        }

    </style>

</head>
<body>

<div class="header">
    <span style="font-size: 30px; margin: 10px;display: inline-block;">二手房电子商务交易平台</span>
</div>

<div id="loginbox" class="box">
    <p style="margin: 10px; font-size: 20px;">用户登陆</p>
    <table class="logintable" style="width: 98%;">
        <tr>
            <td><input id="username" placeholder="用户名" title="请输入用户名"></td>
        </tr>
        <tr>
            <td><input type="password" id="password" placeholder="密码" title="请输入密码"></td>
        </tr>
    </table>
    <button onclick="login()">登陆</button>
    <p style="font-size: 14px">没有账号？<a href="javascript:void(0)" onclick="displayRegister()">点此注册</a></p>
</div>

<div hidden id="registerbox" class="box" >
    <p style="margin: 10px;font-size: 20px;">用户注册</p>
    <table style="width: 98%;">
        <tr class="titletr">
            <td class="registerleft"><span class="registertitle">用户名</span></td>
            <td><input id="registerusername"></td>
        </tr>
        <tr class="titletr">
            <td class="registerleft"><span class="registertitle">密码</span></td>
            <td><input type="password" id="registerpassword"></td>
        </tr>
        <tr class="titletr">
            <td class="registerleft"><span class="registertitle">确认密码</span></td>
            <td><input type="password" id="comfirmpassword"></td>
        </tr>
        <tr class="titletr">
            <td class="registerleft"><span class="registertitle">称呼</span></td>
            <td>

                <select id="gender" style="height: 30px;width: 100%;">
                    <option value="male">先生</option>
                    <option value="female">女士</option>
                </select>
            </td>
        </tr>
        <tr class="titletr">
            <td class="registerleft"><span class="registertitle">电子邮箱</span></td>
            </td>
            <td><input type="email"></td>
        </tr>
        <tr class="titletr">
            <td class="registerleft"><span class="registertitle">电话号码</span></td>
            </td>
            <td><input id="phone"></td>
        </tr>
    </table>
    <button>注册</button>
    <p><a href="javascript:void(0)" onclick="displayLogin()">返回登陆</a></p>
</div>
</body>
<script type="text/javascript">
    var registerBox = document.getElementById('registerbox');
    function displayLogin() {
        registerBox.hidden = true;
    }

    function displayRegister() {
        registerBox.hidden = false;
    }

    function login() {
        var username = document.getElementById('username').value;
        var password = document.getElementById('password').value;
        var url = "/User/userLogin";
        var xhr = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject("Microsoft.XMLHTTP");
        xhr.open('post', url);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send('username=' + username + "&password=" + password);
        xhr.onreadystatechange = function () {
            if(this.status == 200 && this.readyState == 4){
                var result = this.responseText;
                if (result == "用户不存在"){
                    alert("用户不存在");
                }else if(result == "密码错误"){
                    alert("密码错误");
                }else{
                    localStorage.setItem('username', username);
                    window.location.href = this.responseText;
                }
            }
        }
    }
</script>
</html>