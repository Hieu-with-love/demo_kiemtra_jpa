package devzeus.com.ktqt_01_st2.dao.impl;

import devzeus.com.ktqt_01_st2.config.JPAConfig;
import devzeus.com.ktqt_01_st2.dao.AuthorDao;
import devzeus.com.ktqt_01_st2.model.Author;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.util.List;

public class AuthorDaoImpl implements AuthorDao {
    private EntityManager entityManager = JPAConfig.getEntityManager();

    @Override
    public Author findById(Long authorId) {
        return entityManager.find(Author.class, authorId);
    }

    @Override
    public List<Author> findAll() {
        return entityManager.createQuery("SELECT a FROM Author a", Author.class).getResultList();
    }

    @Override
    public Author save(Author author) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(author);
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return author;
    }

    @Override
    public Author update(Author author) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.merge(author);
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return author;
    }

    @Override
    public void delete(Long authorId) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            Author author = entityManager.find(Author.class, authorId);
            if (author != null) {
                entityManager.remove(author);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
}
