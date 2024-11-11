package devzeus.com.ktqt_01_st2.dao.impl;

import devzeus.com.ktqt_01_st2.config.JPAConfig;
import devzeus.com.ktqt_01_st2.dao.UserDao;
import devzeus.com.ktqt_01_st2.model.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import jakarta.transaction.Transactional;

import java.util.List;

public class UserDaoImpl implements UserDao {
    EntityManager em = JPAConfig.getEntityManager();
    
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
    public User findByEmail(String email) {
        try {
            return em.createQuery("SELECT u FROM User u WHERE u.email = :email", User.class)
                    .setParameter("email", email)
                    .getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null; // Xử lý nếu không tìm thấy user hoặc có lỗi khác
        } finally {
            em.close(); // Đảm bảo đóng EntityManager sau khi sử dụng
        }
    }

    @Override
    public List<User> findAll() {
        return em.createNamedQuery("User.findAll", User.class).getResultList();
    }

    @Override
    @Transactional
    public void saveUser(User user) {
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
            // Your code here
            em.persist(user);
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
        } finally {
            em.close();
        }
    }

    @Override
    @Transactional
    public void updateUser(User user) {
        EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
            // Your code here
            em.merge(user);
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
        } finally {
            em.close();
        }
    }

    @Override
    @Transactional
    public void deleteUser(int id) {
        EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
            // Your code here
            User user = em.find(User.class, id);
            if (user != null) {
                em.remove(user);
            }else{
                throw new Exception("Not found");
            }
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
        } finally {
            em.close();
        }
    }

    @Override
    public boolean checkExistEmail(String email) {
        EntityManager em = JPAConfig.getEntityManager();
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
        EntityManager em = JPAConfig.getEntityManager();
        TypedQuery<Long> query = em.createQuery("SELECT COUNT(u) FROM User u WHERE u.phone = :phone", Long.class);
        query.setParameter("phone", phone);
        return query.getSingleResult() > 0;
    }
}
