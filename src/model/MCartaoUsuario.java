package model;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import control.CartaoUsuario;

public class MCartaoUsuario {

	// POSTGRE
	public boolean save(CartaoUsuario card) {
		Session session = null;
		try {
			session = HibernateUtilPost.abrirSession();
			session.save(card);
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
	public boolean save(CartaoUsuario card, boolean aux) {
		Session session = null;
		try {
			session = HibernateUtil.abrirSession();
			session.save(card);
			session.getTransaction().commit();
			return true;
		} catch (HibernateException e) {
			session.getTransaction().rollback();
			return false;
		} finally {
			session.close();
		}
	}

	// POSTGRE
	public List<CartaoUsuario> list(long id) {
		Session session = null;
		List<CartaoUsuario> list = null;
		try {
			session = HibernateUtilPost.abrirSession();
			String sql = "SELECT * FROM cartao_usuario WHERE id_user = " + id + " AND validate = true ;";
			list = session.createSQLQuery(sql).addEntity(CartaoUsuario.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list.isEmpty() ? null : list;
	}

	// MARIADB
	public List<CartaoUsuario> list(long id, boolean aux) {
		Session session = null;
		List<CartaoUsuario> list = null;
		try {
			session = HibernateUtil.abrirSession();
			String sql = "SELECT * FROM cartao_usuario WHERE id_user = " + id + " AND validate = true ;";
			list = session.createSQLQuery(sql).addEntity(CartaoUsuario.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list.isEmpty() ? null : list;
	}

	// POSTGRE
	public CartaoUsuario card(long id) {
		Session session = null;
		List<CartaoUsuario> list = null;
		try {
			session = HibernateUtilPost.abrirSession();
			String sql = "SELECT * FROM cartao_usuario WHERE id = " + id + ";";
			list = session.createSQLQuery(sql).addEntity(CartaoUsuario.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list.isEmpty() ? null : list.get(0);
	}

	// MARIADB
	public List<CartaoUsuario> card(long id, boolean aux) {
		Session session = null;
		List<CartaoUsuario> list = null;
		try {
			session = HibernateUtil.abrirSession();
			String sql = "SELECT * FROM cartao_usuario WHERE id = " + id + ";";
			list = session.createSQLQuery(sql).addEntity(CartaoUsuario.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list.isEmpty() ? null : list;
	}

	// POSTGRE
	public boolean removeCard(CartaoUsuario card) {
		Session session = null;
		try {
			session = HibernateUtilPost.abrirSession();
			session.saveOrUpdate(card);
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
	public boolean removeCard(CartaoUsuario card, boolean aux) {
		Session session = null;
		try {
			session = HibernateUtil.abrirSession();
			session.saveOrUpdate(card);
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
