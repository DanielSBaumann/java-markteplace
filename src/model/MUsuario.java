package model;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import control.Usuario;

public class MUsuario {

	// POSTGRE
	public boolean cadastrar(Usuario usuario) {
		Session session = null;
		try {
			session = HibernateUtilPost.abrirSession();
			session.save(usuario);
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
	public boolean cadastrar(Usuario usuario, boolean aux) {
		Session session = null;
		try {
			session = HibernateUtil.abrirSession();
			session.save(usuario);
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
	public long login(Usuario usuario) {
		Session session = null;
		List<Usuario> list = null;
		try {
			session = HibernateUtilPost.abrirSession();
			String sql = "SELECT * FROM usuario WHERE email = \'" + usuario.getEmail() + "\' AND senha = \'"
					+ usuario.getSenha() + "\' ;";
			list = session.createSQLQuery(sql).addEntity(Usuario.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return (list.isEmpty()) ? -1 : list.get(0).getId();
	}

	// MARIADB
	public Usuario login(Usuario usuario, boolean aux) {
		Session session = null;
		List<Usuario> list = null;
		try {
			session = HibernateUtil.abrirSession();
			String sql = "SELECT u FROM Usuario u where email like '%" + usuario.getEmail() + "%' AND senha like '%"
					+ usuario.getSenha() + "%'";
			list = session.createQuery(sql, Usuario.class).getResultList();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list.get(0);
	}

	// POSTGRE
	public Usuario user(long id) {
		Session session = null;
		List<Usuario> list = null;
		try {
			session = HibernateUtilPost.abrirSession();
			String sql = "SELECT u FROM Usuario u where u.id =" + id;
			list = session.createQuery(sql, Usuario.class).getResultList();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list.get(0);
	}

	// MARIADB
	public Usuario user(long id, boolean aux) {
		Session session = null;
		List<Usuario> list = null;
		try {
			session = HibernateUtil.abrirSession();
			String sql = "SELECT u FROM Usuario u where u.id =" + id;
			list = session.createQuery(sql, Usuario.class).getResultList();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list.get(0);
	}

	// POSTGRE
	public boolean mail(String email) {
		Session session = null;
		List<Usuario> list = null;
		try {
			session = HibernateUtilPost.abrirSession();
			String sql = "SELECT u FROM Usuario u where u.email =\'" + email + "\'";
			list = session.createQuery(sql, Usuario.class).getResultList();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list.isEmpty();
	}

	// MARIADB
	public boolean mail(String email, boolean aux) {
		Session session = null;
		List<Usuario> list = null;
		try {
			session = HibernateUtil.abrirSession();
			String sql = "SELECT u FROM Usuario u where u.email =\'" + email + "\'";
			list = session.createQuery(sql, Usuario.class).getResultList();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list.isEmpty();
	}

	// POSTGRE
	public boolean update(Usuario usuario) {
		Session session = null;
		try {
			session = HibernateUtilPost.abrirSession();
			session.saveOrUpdate(usuario);
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
	public boolean update(Usuario usuario, boolean aux) {
		Session session = null;
		try {
			session = HibernateUtil.abrirSession();
			session.saveOrUpdate(usuario);
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

	// POSTGRE
	public Usuario nameVendor(String name) {
		Session session = null;
		List<Usuario> list = null;
		try {
			session = HibernateUtilPost.abrirSession();
			String sql = "SELECT * FROM usuario WHERE nome = \'" + name + "\' ; ";
			list = session.createSQLQuery(sql).addEntity(Usuario.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list.get(0);
	}

	// MARIADB
	public Usuario nameVendor(String name, boolean aux) {
		Session session = null;
		List<Usuario> list = null;
		try {
			session = HibernateUtil.abrirSession();
			String sql = "SELECT * FROM usuario WHERE nome = \'" + name + "\' ; ";
			list = session.createSQLQuery(sql).addEntity(Usuario.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list.get(0);
	}
}
