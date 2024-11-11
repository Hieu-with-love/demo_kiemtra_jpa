package devzeus.com.ktqt_01_st2.dao.impl;

import devzeus.com.ktqt_01_st2.dao.UserDao;
import devzeus.com.ktqt_01_st2.model.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import jakarta.transaction.Transactional;

import java.util.List;

public class UserDaoImpl implements UserDao {
    @PersistenceContext
    private EntityManager em;

    @Override
    public User findById(int id) {
        try {
            return em.find(User.class, id);
        } catch (Exception e) {
            // Log the exception
            return null; // or handle as needed
        }
    }

    @Override
    public User findByEmail(String username) {
        return em.createNamedQuery("User.findByEmail", User.class).getSingleResult();
    }

    @Override
    public List<User> findAll() {
        return em.createNamedQuery("User.findAll", User.class).getResultList();
    }

    @Override
    @Transactional
    public void saveUser(User user) {
        try {
            em.persist(user);
        } catch (Exception e) {
            // Log the exception
            // Optionally, rethrow or handle rollback manually
        }
    }

    @Override
    @Transactional
    public void updateUser(User user) {
        try {
            em.merge(user);
        } catch (Exception e) {
            // Log the exception
            // Optionally, rethrow or handle rollback manually
        }
    }

    @Override
    @Transactional
    public void deleteUser(int id) {
        try {
            User user = em.find(User.class, id);
            if (user != null) {
                em.remove(user);
            }
        } catch (Exception e) {
            // Log the exception
            // Optionally, rethrow or handle rollback manually
        }
    }

    @Override
    public boolean checkExistEmail(String email) {
        TypedQuery<Long> query = em.createQuery("SELECT COUNT(u) FROM User u WHERE u.email = :email", Long.class);
        query.setParameter("email", email);
        return query.getSingleResult() > 0;
    }

    @Override
    public boolean checkExistUsername(String username) {
        return false;
    }

    @Override
    public boolean checkExistPhone(String phone) {
        TypedQuery<Long> query = em.createQuery("SELECT COUNT(u) FROM User u WHERE u.phone = :phone", Long.class);
        query.setParameter("phone", phone);
        return query.getSingleResult() > 0;
    }
}
