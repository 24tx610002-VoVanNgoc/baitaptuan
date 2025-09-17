package ltweb.controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import ltweb.models.UserModel;
import ltweb.services.UserSevice;
import ltweb.services.Impl.UserServiceImpl;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserSevice userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // hiển thị form register.jsp
        req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Lấy dữ liệu từ form
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String fullname = req.getParameter("fullname");
        String email = req.getParameter("email");

        // Tạo đối tượng User
        UserModel user = new UserModel();
        user.setUsername(username);
        user.setPassword(password);
        user.setFullname(fullname);
        user.setEmail(email);

        // Gọi service đăng ký
        boolean result = userService.register(user);

        if (result) {
            // Nếu đăng ký thành công -> chuyển về login
            resp.sendRedirect(req.getContextPath() + "/login");
        } else {
            // Nếu thất bại -> quay lại form
            req.setAttribute("error", "Đăng ký thất bại! Vui lòng thử lại.");
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
        }
    }
}
