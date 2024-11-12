package devzeus.com.ktqt_01_st2.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

@WebServlet("/uploads/*")
public class ImageServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "D:\\Nam 3 HK1 2024-2025\\LTWeb\\Bai tap luyen\\ktqt_01_ST2\\target\\ktqt_01_ST2-1.0-SNAPSHOT\\uploads";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, IOException {
        String fileName = req.getPathInfo().substring(1); // Lấy tên tệp từ URL
        File file = new File(UPLOAD_DIR, fileName);

        if (file.exists()) {
            resp.setContentType("image/jpeg"); // Định dạng nội dung, có thể là image/png tùy tệp
            Files.copy(file.toPath(), resp.getOutputStream());
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND); // 404 nếu tệp không tồn tại
        }
    }
}

