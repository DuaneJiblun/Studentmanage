<%--
  Created by IntelliJ IDEA.
  User: YY
  Date: 2024/5/20
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>上传失败</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 50%;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #d33;
        }
        p {
            color: #666;
        }
        .btn {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>上传失败</h2>
    <p>很抱歉，上传文件时发生了错误。</p>
    <p>可能的原因包括：</p>
    <ul>
        <li>文件格式不正确，请确保上传的文件为正确的 Excel 文件。</li>
        <li>文件内容不符合要求，请检查文件内容并重新上传。</li>
        <li>服务器内部错误，请联系管理员进行进一步处理。</li>
    </ul>
    <p>如果你需要帮助，请联系我们的技术支持团队。</p>
    <a href="contact.html" class="btn">联系技术支持</a>
</div>
</body>
</html>
