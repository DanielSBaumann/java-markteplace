package model;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import control.ListaProduto;

public class MListaProduto {

	// POSTGRE
	public boolean save(ListaProduto item) {
		Session session = null;
		try {
			session = HibernateUtilPost.abrirSession();
			session.save(item);
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
	public boolean save(ListaProduto item, boolean aux) {
		Session session = null;
		try {
			session = HibernateUtil.abrirSession();
			session.save(item);
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
	public List<ListaProduto> selectByUserId(long id) {
		Session session = null;
		List<ListaProduto> list = null;
		try {
			session = HibernateUtilPost.abrirSession();
			String sql = "SELECT * " + "FROM lista_produto "
					+ "INNER JOIN produtos ON (lista_produto.id_produto = produtos.id) " + "WHERE produtos.id_user = "
					+ id + " ;";
			list = session.createSQLQuery(sql).addEntity(ListaProduto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list;
	}

	// MARIADB
	public List<ListaProduto> selectByUserId(long id, boolean aux) {
		Session session = null;
		List<ListaProduto> list = null;
		try {
			session = HibernateUtil.abrirSession();
			String sql = "SELECT * FROM lista_produto WHERE id_user = " + id + " ;";
			list = session.createSQLQuery(sql).addEntity(ListaProduto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list;
	}

}
