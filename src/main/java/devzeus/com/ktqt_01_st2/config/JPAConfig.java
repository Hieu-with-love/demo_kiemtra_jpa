package devzeus.com.ktqt_01_st2.config;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.PersistenceContext;

@PersistenceContext
public class JPAConfig {
    public static EntityManager getEntityManager() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("exam_jpa");
        return factory.createEntityManager();
    }
}
