<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng ký</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #43e97b, #38f9d7);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Segoe UI', sans-serif;
        }
        .register-box {
            background: #fff;
            border-radius: 15px;
            padding: 40px 30px;
            width: 420px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.2);
        }
        .register-box h2 {
            text-align: center;
            margin-bottom: 25px;
            font-weight: bold;
            color: #333;
        }
        .form-control {
            border-radius: 10px;
        }
        .btn-register {
            width: 100%;
            border-radius: 10px;
            background: #43e97b;
            border: none;
            color: white;
            font-weight: 600;
            padding: 10px;
            transition: 0.3s;
        }
        .btn-register:hover {
            background: #2cd19d;
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
    <div class="register-box">
        <h2>Đăng ký</h2>
        <c:if test="${alert != null}">
            <div class="alert-custom">${alert}</div>
        </c:if>
        <form action="register" method="post">
            <div class="mb-3">
                <label class="form-label">Họ tên</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fa fa-user"></i></span>
                    <input type="text" class="form-control" name="fullname" placeholder="Nhập họ tên" required>
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label">Email</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fa fa-envelope"></i></span>
                    <input type="email" class="form-control" name="email" placeholder="Nhập email" required>
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label">Tài khoản</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fa fa-user-circle"></i></span>
                    <input type="text" class="form-control" name="username" placeholder="Tên tài khoản" required>
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label">Mật khẩu</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fa fa-lock"></i></span>
                    <input type="password" class="form-control" name="password" placeholder="Nhập mật khẩu" required>
                </div>
            </div>
            <button type="submit" class="btn-register mb-3">Đăng ký</button>
            <!-- Nút quay lại đăng nhập -->
            <a href="login.jsp" class="btn btn-outline-secondary w-100" style="border-radius:10px;">Quay lại đăng nhập</a>
        </form>
    </div>
</body>
</html>
