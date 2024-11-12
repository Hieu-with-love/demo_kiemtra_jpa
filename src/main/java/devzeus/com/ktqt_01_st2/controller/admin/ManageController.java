package devzeus.com.ktqt_01_st2.controller.admin;

import devzeus.com.ktqt_01_st2.model.Book;
import devzeus.com.ktqt_01_st2.service.BookService;
import devzeus.com.ktqt_01_st2.service.impl.BookServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/admin/home"})
public class ManageController extends HttpServlet {
    private BookService bookService = new BookServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Book> books = bookService.findAllBooks();
        req.setAttribute("books", books);
        req.getRequestDispatcher("/views/admin/home.jsp").forward(req, resp);
    }
}
