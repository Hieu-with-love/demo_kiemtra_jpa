package devzeus.com.ktqt_01_st2.service.impl;

import devzeus.com.ktqt_01_st2.dao.BookDao;
import devzeus.com.ktqt_01_st2.dao.impl.BookDaoImpl;
import devzeus.com.ktqt_01_st2.model.Book;
import devzeus.com.ktqt_01_st2.service.BookService;

import java.util.List;

public class BookServiceImpl implements BookService {
    private BookDao bookDao = new BookDaoImpl();

    @Override
    public Book createBook(Book book, Long authorId) {
        return bookDao.save(book);
    }

    @Override
    public boolean updateBook(Book book) {
        if (book != null) {
            bookDao.update(book);
            return true;
        }
        return false;
    }

    @Override
    public boolean deleteBook(Long bookId) {
        bookDao.delete(bookId);
        return false;
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
