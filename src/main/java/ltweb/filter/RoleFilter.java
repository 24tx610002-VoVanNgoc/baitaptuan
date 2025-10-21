package ltweb.filter;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ltweb.models.UserModel;

@WebFilter(urlPatterns = {"/admin/*", "/user/*"}) // Lọc cả 2 nhóm URL
public class RoleFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        UserModel user = null;
        if (session != null) {
            Object acc = session.getAttribute("account");
            if (acc instanceof UserModel) {
                user = (UserModel) acc;
            }
        }

       
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

       
        String path = req.getRequestURI();

        
        if (user.getRoleid() == 1) {
            // admin có thể vào /admin/* và /user/*
            chain.doFilter(request, response);
            return;
        }

      
        if (user.getRoleid() == 3) {
            // chỉ cho phép vào /user/*
            if (path.startsWith(req.getContextPath() + "/user")) {
                chain.doFilter(request, response);
                return;
            } else {
                // vào /admin/* → chặn
                resp.sendRedirect(req.getContextPath() + "/views/access-denied.jsp");
                return;
            }
        }

       
        resp.sendRedirect(req.getContextPath() + "/logout");
    }
}
