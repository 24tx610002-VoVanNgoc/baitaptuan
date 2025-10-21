<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm danh mục</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #43cea2, #185a9d);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Segoe UI', sans-serif;
        }
        .card-form {
            background: #fff;
            border-radius: 15px;
            padding: 30px;
            width: 450px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.25);
        }
        .card-form h2 {
            text-align: center;
            margin-bottom: 25px;
            font-weight: bold;
            color: #333;
        }
        .form-control {
            border-radius: 10px;
        }
        .btn-custom {
            border-radius: 10px;
            width: 100px;
            font-weight: 600;
        }
        .btn-success {
            background: #43cea2;
            border: none;
        }
        .btn-success:hover {
            background: #2bb673;
        }
        .btn-warning {
            color: white;
            border: none;
        }
        .btn-warning:hover {
            background: #e0a800;
        }
    </style>
</head>
<body>
    <div class="card-form">
        <h2><i class="fa fa-plus-circle"></i> Thêm danh mục</h2>
        <form action="add" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label class="form-label">Tên danh mục:</label>
                <input type="text" class="form-control" placeholder="Nhập tên danh mục" name="name" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Ảnh đại diện:</label>
                <input type="file" class="form-control" name="icon" accept="image/*">
            </div>
            <div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-success btn-custom"><i class="fa fa-check"></i> Thêm</button>
                <button type="reset" class="btn btn-warning btn-custom"><i class="fa fa-undo"></i> Hủy</button>
            </div>
        </form>
    </div>
</body>
</html>
