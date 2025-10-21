package ltweb.controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ltweb.models.UserModel;
import ltweb.services.UserSevice;
import ltweb.services.Impl.UserServiceImpl;

@WebServlet(urlPatterns = { "/login" })
public class LoginControllers extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute("account") != null) {
            resp.sendRedirect(req.getContextPath() + "/waiting");
            return;
        }

        req.getRequestDispatcher("views/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String alertMsg = "";

        if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
            alertMsg = "Tài khoản hoặc mật khẩu không được để trống!";
            req.setAttribute("alert", alertMsg);
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
            return;
        }

        UserSevice service = new UserServiceImpl();
        UserModel user = service.login(username, password);

        if (user != null) {
            HttpSession session = req.getSession(true);
            session.setAttribute("account", user);

            // ⚡ Phân quyền chuyển hướng
            if (user.getRoleid() == 3) {
                // roleid = 3 → user bình thường
                resp.sendRedirect(req.getContextPath() + "/home");
            } else if (user.getRoleid() == 1 || user.getRoleid() == 2) {
                // roleid = 1 hoặc 2 → admin
                resp.sendRedirect(req.getContextPath() + "/admin/category/list");
            } else {
                // Nếu role không xác định
                resp.sendRedirect(req.getContextPath() + "/logout");
            }

        } else {
            alertMsg = "Tài khoản hoặc mật khẩu không đúng!";
            req.setAttribute("alert", alertMsg);
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
        }
    }
}
