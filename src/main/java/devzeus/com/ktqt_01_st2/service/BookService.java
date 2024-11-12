package devzeus.com.ktqt_01_st2.service;

import devzeus.com.ktqt_01_st2.model.Book;
import java.util.*;

public interface BookService {
    Book createBook(Book book, Long authorId);
    Book updateBook(Book book);
    void deleteBook(Long bookId);
    Book findBookById(Long bookId);
    List<Book> findAllBooks();
}
