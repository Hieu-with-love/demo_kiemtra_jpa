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

@WebServlet(urlPatterns = {"/admin/books", "/admin/book/add", "/admin/book/update", "/admin/book/delete"})
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
        } else if (url.contains("admin/book/update")) {
            Long id = Long.parseLong(req.getParameter("bookId"));
            Book book = bookService.findBookById(id);
            req.setAttribute("book", book);
            req.getRequestDispatcher("/views/admin/book-update.jsp").forward(req, resp);
        } else if (url.contains("admin/book/delete")) {
            Long id = Long.parseLong(req.getParameter("bookId"));
            bookService.deleteBook(id);
            resp.sendRedirect(req.getContextPath() + "/admin/books");
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
        else if (url.contains("admin/book/update")) {
            resp.setContentType("text/html");
            resp.setCharacterEncoding("UTF-8");
            req.setCharacterEncoding("UTF-8");
            updateBook(req, resp);
        }
        else if (url.contains("admin/book/delete")) {
            resp.setContentType("text/html");
            resp.setCharacterEncoding("UTF-8");
            req.setCharacterEncoding("UTF-8");
            deleteBook(req, resp);
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

    private void updateBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get data from form
        String title = req.getParameter("title");
        String isbn = req.getParameter("isbn");
        String publisher = req.getParameter("publisher");
        Double price = Double.valueOf(req.getParameter("price"));
        String publishDate = req.getParameter("publishDate");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        String existingImage = req.getParameter("pic");

        // Path to store uploaded image
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs(); // Create folder if not exist
        }

        String fname = existingImage; // Default to existing image if no new image is uploaded

        try {
            Part filePart = req.getPart("pic");
            if (filePart != null && filePart.getSize() > 0) {
                // Delete old image if it exists and a new image is uploaded
                if (existingImage != null && !existingImage.isEmpty()) {
                    File oldFile = new File(uploadPath + File.separator + existingImage);
                    if (oldFile.exists()) {
                        oldFile.delete();
                    }
                }

                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
                fname = System.currentTimeMillis() + "." + ext;

                String filePath = uploadPath + File.separator + fname;
                filePart.write(filePath);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Update data in the database
        Book book = Book.builder()
                .title(title)
                .isbn(isbn)
                .publisher(publisher)
                .price(price)
                .publish_date(publishDate)
                .quantity(quantity)
                .cover_image(fname)
                .build();

        boolean isUpdated = bookService.updateBook(book);
        String msg = isUpdated ? "Book updated successfully" : "Failed to update book";
        req.setAttribute("msg", msg);

        resp.sendRedirect(req.getContextPath() + "/admin/books");
    }

    private void deleteBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long bookId = Long.parseLong(req.getParameter("bookId"));

        // Fetch the book by ID to get the cover image file name
        Book book = bookService.findBookById(bookId);
        String coverImage = book.getCover_image();

        // Delete book from the database (and its relationships with authors)
        boolean isDeleted = bookService.deleteBook(bookId);

        if (isDeleted && coverImage != null && !coverImage.isEmpty()) {
            // Delete the cover image file
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
            File imageFile = new File(uploadPath + File.separator + coverImage);
            if (imageFile.exists()) {
                imageFile.delete();
            }
        }

        String msg = isDeleted ? "Book deleted successfully" : "Failed to delete book";
        req.setAttribute("msg", msg);
    }
}
