package model;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import control.Saldo;

public class MSaldo {

	// POSTGRE
	public Saldo saldo(long id) {
		Session session = null;
		List<Saldo> list = null;
		try {
			session = HibernateUtilPost.abrirSession();
			String sql = "SELECT * FROM saldo WHERE id_user = " + id + " ;";
			list = session.createSQLQuery(sql).addEntity(Saldo.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list.isEmpty() ? null : list.get(0);
	}

	// POSTGRE
	public Saldo saldo(long id, boolean aux) {
		Session session = null;
		List<Saldo> list = null;
		try {
			session = HibernateUtil.abrirSession();
			String sql = "SELECT * FROM saldo WHERE id_user = " + id + " ;";
			list = session.createSQLQuery(sql).addEntity(Saldo.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list.isEmpty() ? null : list.get(0);
	}

	// POSTGRE
	public boolean update(Saldo saldo) {
		Session session = null;
		try {
			session = HibernateUtilPost.abrirSession();
			session.saveOrUpdate(saldo);
			session.getTransaction().commit();
			return true;
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
			return false;
		} finally {
			session.close();
		}
	}

	// MARIADB
	public boolean update(Saldo saldo, boolean aux) {
		Session session = null;
		try {
			session = HibernateUtil.abrirSession();
			session.saveOrUpdate(saldo);
			session.getTransaction().commit();
			return true;
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
			return false;
		} finally {
			session.close();
		}
	}
}
