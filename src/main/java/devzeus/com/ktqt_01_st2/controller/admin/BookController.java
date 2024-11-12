package devzeus.com.ktqt_01_st2.controller.admin;

import devzeus.com.ktqt_01_st2.model.Author;
import devzeus.com.ktqt_01_st2.model.Book;
import devzeus.com.ktqt_01_st2.service.AuthorService;
import devzeus.com.ktqt_01_st2.service.BookService;
import devzeus.com.ktqt_01_st2.service.impl.AuthorServiceImpl;
import devzeus.com.ktqt_01_st2.service.impl.BookServiceImpl;
import devzeus.com.ktqt_01_st2.utils.Constant;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.*;

@WebServlet(urlPatterns = {"/admin/books", "/admin/book/add",})
@MultipartConfig
public class BookController extends HttpServlet {
    private BookService bookService = new BookServiceImpl();
    private AuthorService authorService = new AuthorServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
        if (url.contains("admin/books")) {
            List<Book> books = bookService.findAllBooks();
            req.setAttribute("books", books);
            req.getRequestDispatcher("/views/admin/book-list.jsp").forward(req, resp);
        }else if (url.contains("admin/book/add")) {
            List<Author> authors = authorService.findAllAuthors();
            req.setAttribute("authors", authors);
            req.getRequestDispatcher("/views/admin/book-add.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
        if (url.contains("admin/book/add")) {
            resp.setContentType("text/html");
            resp.setCharacterEncoding("UTF-8");
            req.setCharacterEncoding("UTF-8");
            addBook(req, resp);
        }
    }

    private void addBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get data from form
        String title = req.getParameter("title");
        String isbn = req.getParameter("isbn");
        String publisher = req.getParameter("publisher");
        Double price = Double.valueOf(req.getParameter("price"));
        String publishDate = req.getParameter("publishDate");
        Long authorId = Long.parseLong(req.getParameter("authorId"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        String image = req.getParameter("pic");
        // Get file from form
        String fname = "";
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads"; // Đường dẫn tương đối trong dự án
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists())
            uploadDir.mkdirs(); // Create folder if not exist
        try {
            Part filePart = req.getPart("pic");
            if (filePart.getSize() > 0) {
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                // Change file name
                int index = fileName.lastIndexOf("."); // index of extend file .jpg, .png, .jpeg
                String ext = fileName.substring(index + 1); // extend file .jpg, .png, .jpeg
                fname = System.currentTimeMillis() + "." + ext;
                // Write file path
                String filePath = uploadPath + File.separator + fname;
                filePart.write(filePath);
            } else if (image != null) {
                fname = image;
            }else{
                fname = "HP-ProBook-650-G4-7.jpg";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        // Insert data to database
        Book book = Book.builder()
                .title(title)
                .isbn(isbn)
                .publisher(publisher)
                .price(price)
                .publisher(publisher)
                .publish_date(publishDate)
                .quantity(quantity)
                .cover_image(fname)
                .build();

        Book createBook = bookService.createBook(book, authorId);
        String msg = "This is default message";

        if (createBook != null) {
            msg = "Create book successfully";
            req.setAttribute("msg", msg);
            resp.sendRedirect(req.getContextPath() + "/admin/books");
        }else{
            msg = "Failed to create book";
            req.setAttribute("msg", msg);
            resp.sendRedirect(req.getContextPath() + "/admin/books/add");
        }
    }

}
