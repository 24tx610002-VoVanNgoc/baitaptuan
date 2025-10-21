<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách Category</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            background: #f7f9fc;
            font-family: 'Segoe UI', sans-serif;
        }
        .container {
            margin-top: 40px;
        }
        .table thead {
            background: #4facfe;
            color: white;
        }
        .table img {
            border-radius: 10px;
            object-fit: cover;
        }
        h2 {
            font-weight: bold;
            color: #333;
        }
        .btn-sm {
            border-radius: 8px;
            padding: 5px 12px;
        }
        .btn-edit {
            background: #00c6ff;
            color: white;
            border: none;
        }
        .btn-edit:hover {
            background: #0096c7;
        }
        .btn-delete {
            background: #ff6b6b;
            color: white;
            border: none;
        }
        .btn-delete:hover {
            background: #e63946;
        }
        .btn-add {
            background: #43cea2;
            color: white;
            font-weight: 600;
            border: none;
        }
        .btn-add:hover {
            background: #2bb673;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Tiêu đề + nút thêm -->
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2><i class="fa fa-list"></i> Danh sách Category</h2>
            <a href="<c:url value='/admin/category/add'/>" class="btn btn-add">
                <i class="fa fa-plus-circle"></i> Thêm Category
            </a>
        </div>

        <!-- Bảng danh mục -->
        <table class="table table-bordered table-hover align-middle text-center">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Hình ảnh</th>
                    <th>Tên Category</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${cateList}" var="cate" varStatus="STT">
                    <tr>
                        <td>${STT.index + 1}</td>
                        
                        <!-- Gọi ảnh từ ImageController -->
                        <c:url value="/image?fname=${cate.icon}" var="imgUrl"/>
                        <td><img src="${imgUrl}" width="120" height="90"/></td>
                        
                        <!-- Tên Category -->
                        <td>${cate.catename}</td>
                        
                        <!-- Nút hành động -->
                        <td>
                            <a href="<c:url value='/admin/category/edit?id=${cate.cateid}'/>" 
                               class="btn btn-sm btn-edit">
                                <i class="fa fa-edit"></i> Sửa
                            </a>
                            <a href="<c:url value='/admin/category/delete?id=${cate.cateid}'/>" 
                               class="btn btn-sm btn-delete" 
                               onclick="return confirm('Bạn có chắc muốn xóa không?')">
                                <i class="fa fa-trash"></i> Xóa
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
