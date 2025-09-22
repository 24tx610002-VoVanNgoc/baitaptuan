<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm danh mục</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2>Thêm danh mục</h2>
    <form role="form" action="add" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label>Tên danh mục:</label>
            <input class="form-control" placeholder="please enter category Name" name="name" required />
        </div>
        <div class="form-group">
            <label>Ảnh đại diện:</label>
            <input type="file" class="form-control" name="icon" accept="image/*" />
        </div>
        <button type="submit" class="btn btn-success">Thêm</button>
        <button type="reset" class="btn btn-warning">Hủy</button>
    </form>
</div>
</body>
</html>