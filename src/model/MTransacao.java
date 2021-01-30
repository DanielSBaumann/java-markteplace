package model;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import control.Transacao;

public class MTransacao {

	// POSTGRE
	public boolean transaction(Transacao tr) {
		Session session = null;
		try {
			session = HibernateUtilPost.abrirSession();
			session.save(tr);
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
	public boolean transaction(Transacao tr, boolean aux) {
		Session session = null;
		try {
			session = HibernateUtil.abrirSession();
			session.save(tr);
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
	public int lastId() {
		Session session = null;
		List<Transacao> list = null;
		try {
			session = HibernateUtilPost.abrirSession();
			String sql = "SELECT * FROM transacoes WHERE id = (select max(id) from transacoes);";
			list = session.createSQLQuery(sql).addEntity(Transacao.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return (list.isEmpty()) ? -1 : list.get(0).getId();
	}

	// MARIADB
	public int lastId(boolean aux) {
		Session session = null;
		List<Transacao> list = null;
		try {
			session = HibernateUtil.abrirSession();
			String sql = "SELECT * FROM transacoes WHERE id = (select max(id) from transacoes);";
			list = session.createSQLQuery(sql).addEntity(Transacao.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return (list.isEmpty()) ? -1 : list.get(0).getId();
	}
	
	// POSTGRE
		public List<Transacao> list(long id) {
			Session session = null;
			List<Transacao> list = null;
			try {
				session = HibernateUtilPost.abrirSession();
				String sql = "SELECT * FROM transacoes WHERE id_comprador = " + id + " ;";
				list = session.createSQLQuery(sql).addEntity(Transacao.class).list();
			} catch (HibernateException e) {
				System.out.println("Erro: " + e.toString());
				session.getTransaction().rollback();
			} finally {
				session.close();
			}
			return list;
		}

		// MARIADB
		public List<Transacao> list(long id, boolean aux) {
			Session session = null;
			List<Transacao> list = null;
			try {
				session = HibernateUtil.abrirSession();
				String sql = "SELECT * FROM transacoes WHERE id_user = " + id + " ;";
				list = session.createSQLQuery(sql).addEntity(Transacao.class).list();
			} catch (HibernateException e) {
				System.out.println("Erro: " + e.toString());
				session.getTransaction().rollback();
			} finally {
				session.close();
			}
			return list;
		}

}
