package devzeus.com.ktqt_01_st2.service.impl;

import devzeus.com.ktqt_01_st2.config.JPAConfig;
import devzeus.com.ktqt_01_st2.dao.BookDao;
import devzeus.com.ktqt_01_st2.dao.impl.BookDaoImpl;
import devzeus.com.ktqt_01_st2.model.Author;
import devzeus.com.ktqt_01_st2.model.Book;
import devzeus.com.ktqt_01_st2.service.BookService;
import jakarta.persistence.EntityManager;

import java.util.Collections;
import java.util.List;

public class BookServiceImpl implements BookService {
    private BookDao bookDao = new BookDaoImpl();

    @Override
    public Book createBook(Book book, Long authorId) {
        return bookDao.save(book);
    }

    @Override
    public Book updateBook(Book book) {
        return bookDao.update(book);
    }

    @Override
    public void deleteBook(Long bookId) {
        bookDao.delete(bookId);
    }

    @Override
    public Book findBookById(Long bookId) {
        return bookDao.findById(bookId);
    }

    @Override
    public List<Book> findAllBooks() {
        return bookDao.findAll();
    }
}
