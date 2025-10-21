<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Chỉnh Sửa Danh Mục</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
	rel="stylesheet">

<style>
body {
	background-color: #f8f9fa;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	font-family: 'Roboto', sans-serif;
}

.edit-card {
	background: #ffffff;
	border-radius: 16px;
	padding: 2.5rem;
	width: 100%;
	max-width: 500px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
	border: none;
	transition: all 0.3s ease-in-out;
}

.edit-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
}

.card-header-icon {
	font-size: 2rem;
	color: #0d6efd;
	margin-right: 1rem;
}

.card-title {
	font-weight: 700;
	color: #343a40;
}

.form-label {
	font-weight: 500;
	color: #495057;
}

.form-control {
	border-radius: 8px;
	border: 1px solid #ced4da;
	padding: 0.75rem 1rem;
	transition: border-color 0.2s, box-shadow 0.2s;
}

.form-control:focus {
	border-color: #86b7fe;
	box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
}

.image-preview-container {
	border: 2px dashed #e9ecef;
	border-radius: 8px;
	padding: 1rem;
	margin-top: 1rem;
	text-align: center;
}

.img-preview {
	max-width: 150px;
	height: auto;
	border-radius: 8px;
	object-fit: cover;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.btn {
	border-radius: 8px;
	padding: 0.75rem 1.5rem;
	font-weight: 500;
	transition: all 0.3s ease;
}
</style>
</head>
<body>

	<div class="edit-card">
		<div class="d-flex align-items-center mb-4">
			<i class="fas fa-edit card-header-icon"></i>
			<h2 class="card-title mb-0">Chỉnh Sửa Danh Mục</h2>
		</div>

		<c:url value="/admin/category/edit" var="editActionUrl" />
		<form action="${editActionUrl}" method="post"
			enctype="multipart/form-data">

			<input type="hidden" name="cateid" value="${category.cateid}" />

			<div class="mb-3">
				<label for="catename" class="form-label">Tên danh mục</label> <input
					type="text" class="form-control" id="catename" name="catename"
					value="${category.catename}" required
					placeholder="Nhập tên danh mục...">
			</div>

			<div class="mb-3 image-preview-container">
				<label class="form-label d-block">Ảnh hiện tại / Xem trước
					ảnh mới</label>
				<c:url value="/image?fname=${category.icon}" var="imgUrl" />
				<img src="${imgUrl}" id="imagePreview" class="img-preview mt-2"
					alt="Xem trước ảnh">
			</div>

			<div class="mb-4">
				<label for="icon" class="form-label">Chọn ảnh đại diện mới</label> <input
					type="file" class="form-control" name="icon" id="icon"
					accept="image/*">
			</div>

			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<c:url value="/admin/category/list" var="listUrl" />
				<a href="${listUrl}" class="btn btn-outline-secondary"> <i
					class="fas fa-times me-2"></i>Hủy
				</a>
				<button type="submit" class="btn btn-primary">
					<i class="fas fa-save me-2"></i>Cập nhật
				</button>
			</div>
		</form>
	</div>

	<script>
        document.addEventListener('DOMContentLoaded', function () {
            const imageInput = document.getElementById('icon');
            const imagePreview = document.getElementById('imagePreview');

            imageInput.addEventListener('change', function () {
                const file = this.files[0];

                if (file) {
                    const reader = new FileReader();

                    reader.onload = function (e) {
                        imagePreview.setAttribute('src', e.target.result);
                    }
                    reader.readAsDataURL(file);
                }
            });
        });
    </script>
</body>
</html>