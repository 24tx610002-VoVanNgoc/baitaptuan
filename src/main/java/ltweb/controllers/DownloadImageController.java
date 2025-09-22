package ltweb.controllers;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ltweb.constant.Constant;
import org.apache.commons.io.IOUtils;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/image")  // ví dụ: /image?fname=abc.png
public class DownloadImageController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // lấy tên file từ param
        String fileName = req.getParameter("fname");

        // tạo đối tượng File trỏ đến thư mục upload
        File file = new File(Constant.UPLOAD_DIRECTORY + "/" + fileName);

        // đặt kiểu nội dung trả về (ảnh jpeg mặc định)
        resp.setContentType("image/jpeg");

        // nếu file tồn tại thì copy dữ liệu ra output stream
        if (file.exists()) {
            IOUtils.copy(new FileInputStream(file), resp.getOutputStream());
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found: " + fileName);
        }
    }
}
