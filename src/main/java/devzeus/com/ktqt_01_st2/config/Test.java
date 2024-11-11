package devzeus.com.ktqt_01_st2.config;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

public class Test {
    public static void main(String[] args) {
        EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction tx = enma.getTransaction();
        try{
            tx.begin();

            tx.commit();
        }catch (Exception e){
            e.printStackTrace();
            tx.rollback();
            throw e;
        }finally {
            enma.close();
        }
    }
}
