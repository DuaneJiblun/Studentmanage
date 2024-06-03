
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>交互式 JSP 页面</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffffff;
            margin: 0;
            padding: 0;
        }
        .navbar {
            background-color: #404040;
            overflow: hidden;
        }
        .navbar a {
            float: left;
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }
        .dropdown {
            float: left;
            overflow: hidden;
        }
        .dropdown .dropbtn {
            font-size: 16px;
            border: none;
            outline: none;
            color: #f2f2f2;
            padding: 14px 20px;
            background-color: inherit;
            margin: 0;
        }
        .navbar a:hover, .dropdown:hover .dropbtn {
            background-color: #ddd;
            color:  #007bff;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }
        .dropdown-content a {
            float: none;
            color:  #007bff;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
        }
        .dropdown-content a:hover {
            background-color: #ddd;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
        .container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
            margin-top: 50px;
        }
        h1 {
            color:  #007b;
            font-size: 28px;
            margin-bottom: 20px;
        }
        .icon {
            width: 24px;
            height: 24px;
            margin-right: 5px;
        }
        button, a {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
            transition: background-color 0.3s ease;
        }
        button:hover, a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="navbar">
    <a href="#">菜单</a>
    <a href="#">编辑</a>
    <div class="dropdown">
        <button class="dropbtn">窗口</button>
        <div class="dropdown-content">
            <a href="#" onclick="increaseFontSize()">字体放大</a>
            <a href="#" onclick="decreaseFontSize()">字体缩小</a>
        </div>
    </div>
</div>

<div class="container">
    <h1>欢迎来到学生信息管理系统</h1>
    <a href="excel.jsp">
        <img src="img3.jpg" alt="上传图标" class="icon">上传文件
    </a>
    <a href="ListStudentServlet.do">
        <img src="img4.jpg" alt="列表图标" class="icon">学生信息列表
    </a>
</div>

<script>
    function increaseFontSize() {
        document.body.style.fontSize = "larger";
    }

    function decreaseFontSize() {
        document.body.style.fontSize = "smaller";
    }
</script>

</body>

</html>
