package devzeus.com.ktqt_01_st2.dao;

import devzeus.com.ktqt_01_st2.model.Author;
import java.util.List;

public interface AuthorDao {
    Author findById(Long authorId);
    List<Author> findAll();
    Author save(Author author);
    Author update(Author author);
    void delete(Long authorId);
}
