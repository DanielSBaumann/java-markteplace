package model;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import control.ListaCompra;

public class MListaCompra {

	// POSTGRE
	public boolean saveList(ListaCompra lista) {
		Session session = null;
		try {
			session = HibernateUtilPost.abrirSession();
			session.saveOrUpdate(lista);
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
	public boolean saveList(ListaCompra lista, boolean aux) {
		Session session = null;
		try {
			session = HibernateUtil.abrirSession();
			session.saveOrUpdate(lista);
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
	public boolean updateList(ListaCompra lista) {
		Session session = null;
		try {
			session = HibernateUtilPost.abrirSession();
			session.saveOrUpdate(lista);
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
	public boolean updateList(ListaCompra lista, boolean aux) {
		Session session = null;
		try {
			session = HibernateUtil.abrirSession();
			session.saveOrUpdate(lista);
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
	public ListaCompra lista(long id) {
		Session session = null;
		List<ListaCompra> list = null;
		try {
			session = HibernateUtilPost.abrirSession();
			String sql = "SELECT * FROM lista_compras WHERE id_user = " + id + " ;";
			list = session.createSQLQuery(sql).addEntity(ListaCompra.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list.isEmpty() ? null : list.get(0);
	}

	// MARIADB
	public ListaCompra lista(long id, boolean aux) {
		Session session = null;
		List<ListaCompra> list = null;
		try {
			session = HibernateUtil.abrirSession();
			String sql = "SELECT * FROM lista_compras WHERE id_user = " + id + " ;";
			list = session.createSQLQuery(sql).addEntity(ListaCompra.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list.isEmpty() ? null : list.get(0);
	}

}
