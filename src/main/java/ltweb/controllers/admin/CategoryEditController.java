package ltweb.controllers.admin;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import ltweb.models.Category;
import ltweb.services.CategoryService;
import ltweb.services.Impl.CategoryServiceImpl;

@WebServlet(urlPatterns = { "/admin/category/edit" })
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1, // 1MB trước khi lưu tạm
    maxFileSize = 1024 * 1024 * 5,       // 5MB mỗi file
    maxRequestSize = 1024 * 1024 * 20    // 20MB tổng request
)
public class CategoryEditController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final CategoryService cateService = new CategoryServiceImpl();

    // Thư mục upload relative tới ứng dụng (dùng getServletContext().getRealPath)
    private String getUploadDir() {
        // ví dụ: /webapp/uploads/category
        return getServletContext().getRealPath("") + File.separator + "uploads" + File.separator + "category";
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // hiển thị form edit: param id
        String idStr = req.getParameter("id");
        if (idStr == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/category/list");
            return;
        }
        int id = Integer.parseInt(idStr);
        Category c = cateService.get(id);
        if (c == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/category/list");
            return;
        }
        req.setAttribute("category", c);
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/edit-category.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Xử lý multipart/form-data
        req.setCharacterEncoding("UTF-8");

        String idStr = req.getParameter("cateid"); // name hidden trong form
        if (idStr == null) {
            req.setAttribute("error", "Thiếu tham số id");
            doGet(req, resp);
            return;
        }
        int cateid = Integer.parseInt(idStr);

        String catename = req.getParameter("catename");
        Part filePart = null;
        try {
            filePart = req.getPart("icon"); // name="icon"
        } catch (IllegalStateException e) {
            // file quá lớn
            req.setAttribute("error", "File upload quá lớn");
            doGet(req, resp);
            return;
        }

        // Lấy category cũ để biết icon cũ
        Category old = cateService.get(cateid);
        if (old == null) {
            req.setAttribute("error", "Category không tồn tại");
            doGet(req, resp);
            return;
        }

        String newFileName = null;
        if (filePart != null && filePart.getSize() > 0) {
            // Lấy tên file, bảo mật (chỉ tên, tránh path traversal)
            String submitted = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            // tạo tên file duy nhất: timestamp + tên gốc
            String ts = String.valueOf(new Timestamp(System.currentTimeMillis()).getTime());
            newFileName = ts + "_" + submitted.replaceAll("\\s+", "_");

            // tạo thư mục nếu chưa có
            String uploadDir = getUploadDir();
            Path uploadPath = Paths.get(uploadDir);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            // lưu file
            Path filePath = uploadPath.resolve(newFileName);
            try (InputStream is = filePart.getInputStream()) {
                Files.copy(is, filePath);
            } catch (IOException e) {
                e.printStackTrace();
                req.setAttribute("error", "Lỗi khi lưu file");
                doGet(req, resp);
                return;
            }

            // xóa file cũ (nếu có)
            String oldIcon = old.getIcon(); // giả sử getter là getIcon()
            if (oldIcon != null && !oldIcon.trim().isEmpty()) {
                Path oldPath = uploadPath.resolve(oldIcon);
                try {
                    Files.deleteIfExists(oldPath);
                } catch (IOException e) {
                    // không bắt buộc phải fail vì xóa không thành công, chỉ log
                    e.printStackTrace();
                }
            }
        }

        // xây dựng object Category mới/đã cập nhật
        Category updated = new Category();
        updated.setCateid(cateid);
        updated.setCatename(catename);
        // nếu có file mới thì set filename, nếu không giữ icon cũ
        if (newFileName != null) {
            updated.setIcon(newFileName);
        } else {
            updated.setIcon(old.getIcon());
        }

        // gọi service để update
        try {
            cateService.edit(updated);
            resp.sendRedirect(req.getContextPath() + "/admin/category/list");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Lỗi khi cập nhật category");
            doGet(req, resp);
        }
    }
}
