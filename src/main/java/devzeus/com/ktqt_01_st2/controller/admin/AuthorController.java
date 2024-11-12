package devzeus.com.ktqt_01_st2.controller.admin;

import devzeus.com.ktqt_01_st2.model.Author;
import devzeus.com.ktqt_01_st2.service.AuthorService;
import devzeus.com.ktqt_01_st2.service.impl.AuthorServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/admin/authors", "/admin/author/add",})
public class AuthorController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AuthorService authorService = new AuthorServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
        if (url.contains("admin/authors")) {
            List<Author> authors = authorService.findAllAuthors();
            req.setAttribute("authors", authors);
            req.getRequestDispatcher("/views/admin/author-list.jsp").forward(req, resp);
        }else if (url.contains("admin/author/add")) {
            req.getRequestDispatcher("/views/admin/author-add.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
