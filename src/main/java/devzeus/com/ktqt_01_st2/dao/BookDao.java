package devzeus.com.ktqt_01_st2.dao;

import devzeus.com.ktqt_01_st2.model.Book;

import java.util.List;

public interface BookDao {
    Book findById(Long bookId);
    List<Book> findAll();
    Book save(Book book);
    Book update(Book book);
    void delete(Long bookId);
    List<Book> findBooksByAuthor(Long authorId);
}
