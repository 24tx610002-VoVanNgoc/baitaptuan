<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Access Denied</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f6fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .card {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            text-align: center;
        }
        h1 {
            color: #e74c3c;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: white;
            background: #3498db;
            padding: 10px 20px;
            border-radius: 6px;
        }
        a:hover {
            background: #2980b9;
        }
    </style>
</head>
<body>
    <div class="card">
        <h1>Access Denied</h1>
        <p>Bạn không có quyền truy cập trang này.</p>
        <a href="${pageContext.request.contextPath}/home">Quay lại Trang chủ</a>
    </div>
</body>
</html>