package devzeus.com.ktqt_01_st2.controller.user;

import devzeus.com.ktqt_01_st2.model.Book;
import devzeus.com.ktqt_01_st2.model.Rating;
import devzeus.com.ktqt_01_st2.service.BookService;
import devzeus.com.ktqt_01_st2.service.RatingService;
import devzeus.com.ktqt_01_st2.service.impl.BookServiceImpl;
import devzeus.com.ktqt_01_st2.service.impl.RatingServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/user/home"})
public class HomeController extends HttpServlet {
    private BookService bookService = new BookServiceImpl();
    private RatingService ratingService = new RatingServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long bookId = Long.parseLong(req.getParameter("bookId"));
        Book book = bookService.findBookById(bookId);
        //List<Rating> ratings = ratingService
        req.setAttribute("book", book);
        req.getRequestDispatcher("/views/user/home.jsp").forward(req, resp);
    }
}
