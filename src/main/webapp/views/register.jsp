<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<h2>Đăng ký</h2>

<c:if test="${alert != null}">
    <h3 style="color:red;">${alert}</h3>
</c:if>

<form action="register" method="post">
    <label>Họ tên:</label>
    <input type="text" name="fullname" required><br>

    <label>Email:</label>
    <input type="email" name="email" required><br>

    <label>Tài khoản:</label>
    <input type="text" name="username" required><br>

    <label>Mật khẩu:</label>
    <input type="password" name="password" required><br>

    <input type="submit" value="Đăng ký">
</form>
