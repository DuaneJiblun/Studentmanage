<%@ page import="excel.ExcelToDatabase" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>上传用户信息</title>
    <style>
        body {
            background-color: #ffffff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 400px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        input[type="file"] {
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 80%;
        }

        button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

        .success-message {
            margin-top: 20px;
            color: #28a745;
        }

        .error-message {
            margin-top: 20px;
            color: #dc3545;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>上传用户信息</h2>
    <form action="ExcelToDatabase" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
        <input type="file" name="excelFile" accept=".xls,.xlsx" required>
        <button type="submit">上传</button>
    </form>
    <div id="successMessage" class="success-message" style="display: none;">文件上传成功！</div>
    <div id="errorMessage" class="error-message" style="display: none;">文件上传失败，请检查文件格式和内容。</div>
</div>

<script>
    function validateForm() {
        var fileInput = document.querySelector('input[type="file"]');
        var errorMessage = document.getElementById('errorMessage');

        // 检查文件是否为空
        if (fileInput.files.length === 0) {
            errorMessage.style.display = 'block';
            return false;
        }

        // 其他可能的验证逻辑可以在此处添加

        // 如果一切验证通过，则显示上传成功提示
        var successMessage = document.getElementById('successMessage');
        successMessage.style.display = 'block';
        return true;
    }
</script>
</body>
</html>
