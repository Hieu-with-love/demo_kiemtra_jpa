package devzeus.com.ktqt_01_st2.service.impl;

import devzeus.com.ktqt_01_st2.config.JPAConfig;
import devzeus.com.ktqt_01_st2.dao.AuthorDao;
import devzeus.com.ktqt_01_st2.dao.impl.AuthorDaoImpl;
import devzeus.com.ktqt_01_st2.model.Author;
import devzeus.com.ktqt_01_st2.service.AuthorService;
import jakarta.persistence.EntityManager;

import java.util.Collections;
import java.util.List;

public class AuthorServiceImpl implements AuthorService {
    AuthorDao authorDao = new AuthorDaoImpl();

    @Override
    public Author createAuthor(Author author) {
        return authorDao.save(author);
    }

    @Override
    public Author updateAuthor(Author author) {
        return authorDao.update(author);
    }

    @Override
    public void deleteAuthor(Long authorId) {
        authorDao.delete(authorId);
    }

    @Override
    public Author findAuthorById(Long authorId) {
        return authorDao.findById(authorId);
    }

    @Override
    public List<Author> findAllAuthors() {
        return authorDao.findAll();
    }
}
