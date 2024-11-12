package devzeus.com.ktqt_01_st2.dao.impl;

import devzeus.com.ktqt_01_st2.config.JPAConfig;
import devzeus.com.ktqt_01_st2.dao.BookDao;
import devzeus.com.ktqt_01_st2.model.Book;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.util.List;

public class BookDaoImpl implements BookDao {
    private EntityManager entityManager = JPAConfig.getEntityManager();

    @Override
    public Book findById(Long bookId) {
        return entityManager.find(Book.class, bookId);
    }

    @Override
    public List<Book> findAll() {
        return entityManager.createQuery("SELECT b FROM Book b", Book.class).getResultList();
    }

    @Override
    public Book save(Book book) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(book);
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return book;
    }

    @Override
    public Book update(Book book) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.merge(book);
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return book;
    }

    @Override
    public void delete(Long bookId) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            Book book = entityManager.find(Book.class, bookId);
            if (book != null) {
                entityManager.remove(book);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    @Override
    public List<Book> findBooksByAuthor(Long authorId) {
        return entityManager.createQuery("SELECT b FROM Book b JOIN b.authors a WHERE a.author_id = :authorId", Book.class)
                .setParameter("authorId", authorId)
                .getResultList();
    }
}
