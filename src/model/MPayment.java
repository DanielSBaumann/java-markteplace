package model;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import control.Payment;

public class MPayment {

	// POSTGRE
	public boolean payment(Payment pay) {
		Session session = null;
		try {
			session = HibernateUtilPost.abrirSession();
			session.save(pay);
			session.getTransaction().commit();
			return true;
		} catch (HibernateException e) {
			session.getTransaction().rollback();
			System.out.println("Erro: " + e.toString());
			return false;
		} finally {
			session.close();
		}
	}

	// MARIADB
	public boolean payment(Payment pay, boolean aux) {
		Session session = null;
		try {
			session = HibernateUtil.abrirSession();
			session.save(pay);
			session.getTransaction().commit();
			return true;
		} catch (HibernateException e) {
			session.getTransaction().rollback();
			return false;
		} finally {
			session.close();
		}
	}
}
