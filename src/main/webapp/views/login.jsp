<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #4facfe, #00f2fe);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Segoe UI', sans-serif;
        }
        .login-box {
            background: #fff;
            border-radius: 15px;
            padding: 40px 30px;
            width: 380px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.2);
        }
        .login-box h2 {
            text-align: center;
            margin-bottom: 25px;
            font-weight: bold;
            color: #333;
        }
        .form-control {
            border-radius: 10px;
        }
        .btn-login {
            width: 100%;
            border-radius: 10px;
            background: #4facfe;
            border: none;
            color: white;
            font-weight: 600;
            padding: 10px;
            transition: 0.3s;
        }
        .btn-login:hover {
            background: #00c6ff;
        }
        .alert-custom {
            text-align: center;
            color: red;
            font-size: 14px;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="login-box">
        <h2>Đăng nhập</h2>
        <c:if test="${alert != null}">
            <div class="alert-custom">${alert}</div>
        </c:if>
        <form action="login" method="post">
            <div class="mb-3">
                <label class="form-label">Tài khoản</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fa fa-user"></i></span>
                    <input type="text" class="form-control" placeholder="Nhập tài khoản" name="username" required>
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label">Mật khẩu</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fa fa-lock"></i></span>
                    <input type="password" class="form-control" placeholder="Nhập mật khẩu" name="password" required>
                </div>
            </div>
            <button type="submit" class="btn-login">Đăng nhập</button>
        </form>
    </div>
</body>
</html>
