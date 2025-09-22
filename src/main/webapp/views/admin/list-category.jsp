<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<html>
<head>
    <title>Danh sách Category</title>
</head>
<body>
    <h2>Danh sách Category</h2>
    <table border="1" cellpadding="10" cellspacing="0">
        <tr>
            <th>STT</th>
            <th>Hình ảnh</th>
            <th>Tên Category</th>
            <th>Hành động</th>
        </tr>
        
        <c:forEach items="${cateList}" var="cate" varStatus="STT">
            <tr>
                <td>${STT.index + 1}</td>
                
                <c:url value="/image?fname=${cate.icon}" var="imgUrl"/>
                <td><img height="150" width="200" src="${imgUrl}" /></td>
                
                <td>${cate.name}</td>
                
                <td>
                    <a href="<c:url value='/admin/category/edit?id=${cate.id}'/>">Sửa</a> | 
                    <a href="<c:url value='/admin/category/delete?id=${cate.id}'/>">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
