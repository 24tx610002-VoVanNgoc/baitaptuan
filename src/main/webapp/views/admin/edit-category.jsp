<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<h2>Chỉnh sửa danh mục</h2>

<form role="form" action="${edit}" method="post" enctype="multipart/form-data">
    
    <!-- Hidden: ID danh mục -->
    <input type="hidden" name="id" value="${category.id}" />
    
    <!-- Tên danh mục -->
    <div class="form-group">
        <label>Tên danh mục:</label>
        <input type="text" class="form-control" name="name" value="${category.name}" />
    </div>

    <!-- Ảnh đại diện -->
    <div class="form-group">
        <c:url value="/image?fname=${category.icon}" var="imgUrl"></c:url>
        <img class="img-responsive" width="100px" src="${imgUrl}" alt="icon hiện tại">
        <br>
        <label>Ảnh đại diện mới:</label>
        <input type="file" name="icon" />
    </div>

    <!-- Nút submit/reset -->
    <button type="submit" class="btn btn-default">Cập nhật</button>
    <button type="reset" class="btn btn-primary">Hủy</button>
</form>
