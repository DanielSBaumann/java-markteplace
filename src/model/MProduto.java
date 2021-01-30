package model;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;

import control.Produto;

public class MProduto {

	// POSTGRE
	public boolean cadastrar(Produto produto) {
		Session session = null;
		try {
			session = HibernateUtilPost.abrirSession();
			session.save(produto);
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
	public boolean cadastrar(Produto produto, boolean aux) {
		Session session = null;
		try {
			session = HibernateUtil.abrirSession();
			session.save(produto);
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
	public List<Produto> list(long id) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtilPost.abrirSession();
			String sql = "SELECT * FROM produtos WHERE id_user = " + id + " ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list;
	}

	// MARIADB
	public List<Produto> list(long id, boolean aux) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtil.abrirSession();
			String sql = "SELECT * FROM produtos WHERE id_user = " + id + " ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list;
	}

	// POSTGRE
	public Produto meuProduto(long id) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtilPost.abrirSession();
			String sql = "SELECT * FROM produtos WHERE id = " + id + " ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list.isEmpty() ? null : list.get(0);
	}

	// MARIADB
	public Produto meuProduto(long id, boolean aux) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtil.abrirSession();
			String sql = "SELECT * FROM produtos WHERE id = " + id + " ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list.isEmpty() ? null : list.get(0);
	}

	// POSTGRE
	public boolean update(Produto produto) {
		Session session = null;
		try {
			session = HibernateUtilPost.abrirSession();
			session.saveOrUpdate(produto);
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
	public boolean update(Produto produto, boolean aux) {
		Session session = null;
		try {
			session = HibernateUtil.abrirSession();
			session.saveOrUpdate(produto);
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

	// ###############################################################################
	// ####################PAGINAS*PRODUTOS###########################################
	// ###############################################################################

	// POSTGRE
	public List<Produto> main(long id) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtilPost.abrirSession();
			String sql = "SELECT * FROM produtos WHERE id_user != " + id + " AND ativo = true ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list;
	}

	// MARIADB
	public List<Produto> main(long id, boolean aux) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtil.abrirSession();
			String sql = "SELECT * FROM produtos WHERE id_user != " + id + " AND ativo = true ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list;
	}

	// POSTGRE
	public List<Produto> eletronicos(long id) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtilPost.abrirSession();
			String sql = "SELECT * FROM produtos WHERE id_user != " + id
					+ " AND categoria = \'Eletronicos\' AND ativo = true ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list;
	}

	// MARIADB
	public List<Produto> eletronicos(long id, boolean aux) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtil.abrirSession();
			String sql = "SELECT * FROM produtos WHERE id_user != " + id
					+ " AND categoria = \'Eletronicos\' AND ativo = true ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list;
	}

	// POSTGRE
	public List<Produto> acessorios(long id) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtilPost.abrirSession();
			String sql = "SELECT * FROM produtos WHERE id_user != " + id
					+ " AND categoria = \'Acessorios\' AND ativo = true ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list;
	}

	// MARIADB
	public List<Produto> acessorios(long id, boolean aux) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtil.abrirSession();
			String sql = "SELECT * FROM produtos WHERE id_user != " + id
					+ " AND categoria = \'Acessorios\' AND ativo = true ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list;
	}

	// POSTGRE
	public List<Produto> infantil(long id) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtilPost.abrirSession();
			String sql = "SELECT * FROM produtos WHERE id_user != " + id
					+ " AND categoria = \'Infantil\' AND ativo = true ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list;
	}

	// MARIADB
	public List<Produto> infantil(long id, boolean aux) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtil.abrirSession();
			String sql = "SELECT * FROM produtos WHERE id_user != " + id
					+ " AND categoria = \'Infantil\' AND ativo = true ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list;
	}

	// POSTGRE
	public List<Produto> fashion(long id) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtilPost.abrirSession();
			String sql = "SELECT * FROM produtos WHERE id_user != " + id
					+ " AND categoria = \'Fashion\' AND ativo = true ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list;
	}

	// MARIADB
	public List<Produto> fashion(long id, boolean aux) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtil.abrirSession();
			String sql = "SELECT * FROM produtos WHERE id_user != " + id
					+ " AND categoria = \'Fashion\' AND ativo = true ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list;
	}

	// POSTGRE
	public List<Produto> esportes(long id) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtilPost.abrirSession();
			String sql = "SELECT * FROM produtos WHERE id_user != " + id
					+ " AND categoria = \'Esportes\' AND ativo = true ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list;
	}

	// MARIADB
	public List<Produto> esportes(long id, boolean aux) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtil.abrirSession();
			String sql = "SELECT * FROM produtos WHERE id_user != " + id
					+ " AND categoria = \'Esportes\' AND ativo = true ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list;
	}

	// POSTGRE
	public List<Produto> livros(long id) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtilPost.abrirSession();
			String sql = "SELECT * FROM produtos WHERE id_user != " + id
					+ " AND categoria = \'Livros\' AND ativo = true ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list;
	}

	// MARIADB
	public List<Produto> livros(long id, boolean aux) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtil.abrirSession();
			String sql = "SELECT * FROM produtos WHERE id_user != " + id
					+ " AND categoria = \'Livros\' AND ativo = true ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list;
	}

	// POSTGRE
	public Produto display(long id) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtilPost.abrirSession();
			String sql = "SELECT * FROM produtos WHERE id = " + id + " ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list.get(0);
	}

	// MARIADB
	public Produto display(long id, boolean aux) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtil.abrirSession();
			String sql = "SELECT * FROM produtos WHERE id = " + id + " ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list.get(0);
	}

	// POSTGRE
	public List<Produto> displayUser(long id, long idUser) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtilPost.abrirSession();
			// aqui
			String sql = "SELECT * FROM produtos WHERE id != " + id + " AND id_user = " + idUser
					+ " AND ativo = true ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list;
	}

	// MARIADB
	public List<Produto> displayUser(long id, long idUser, boolean aux) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtil.abrirSession();
			String sql = "SELECT * FROM produtos WHERE id != " + id + " AND id_user = " + idUser
					+ " AND ativo = true ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list;
	}

	// POSTGRE
	public boolean vendor(long idUser, long idProd) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtilPost.abrirSession();
			String sql = "SELECT * FROM produtos WHERE id = " + idProd + " AND id_user = " + idUser + " ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return !list.isEmpty() ? true : false;
	}

	// MARIADB
	public boolean vendor(long idUser, long idProd, boolean aux) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtil.abrirSession();
			String sql = "SELECT * FROM produtos WHERE id = " + idProd + " AND id_user = " + idUser + " ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return !list.isEmpty() ? true : false;
	}

	// POSTGRE
	public List<Produto> vendor(long id) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtilPost.abrirSession();
			// aqui
			String sql = "SELECT * FROM produtos WHERE id_user = " + id + " AND ativo = true ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list;
	}

	// POSTGRE
	public List<Produto> vendor(long id, boolean aux) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtil.abrirSession();
			// aqui
			String sql = "SELECT * FROM produtos WHERE id_user = " + id + " AND ativo = true ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list;
	}

	// ###############################################################################
	// ####################PAGINAS*PRODUTOS###########################################
	// ###############################################################################

	// ###############################################################################
	// ####################PESQUISAS##################################################
	// ###############################################################################

	// POSTGRE
	public List<Produto> searchNome(long id, String search) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtilPost.abrirSession();
			String sql = "SELECT * FROM produtos WHERE id_user != " + id + " AND upper(nome) like \'%" + search
					+ "%\' AND ativo = true ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list;
	}

	// MariaDB
	public List<Produto> searchNome(long id, String search, boolean aux) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtil.abrirSession();
			String sql = "SELECT * FROM produtos WHERE id_user != " + id + " AND upper(nome) like \'%" + search
					+ "%\' AND ativo = true ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list;
	}

	// POSTGRE
	public List<Produto> searchCategoria(long id, String search) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtilPost.abrirSession();
			String sql = "SELECT * FROM produtos WHERE id_user != " + id + " AND upper(categoria) like \'%" + search
					+ "%\' AND ativo = true ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list;
	}

	// MariaDB
	public List<Produto> searchCategoria(long id, String search, boolean aux) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtil.abrirSession();
			String sql = "SELECT * FROM produtos WHERE id_user != " + id + " AND categoria like \'%" + search
					+ "%\' AND ativo = true ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list;
	}

	// POSTGRE
	public List<Produto> searchMarca(long id, String search) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtilPost.abrirSession();
			String sql = "SELECT * FROM produtos WHERE id_user != " + id + " AND upper(marca) like \'%" + search
					+ "%\' AND ativo = true ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list;
	}

	// MariaDB
	public List<Produto> searchMarca(long id, String search, boolean aux) {
		Session session = null;
		List<Produto> list = null;
		try {
			session = HibernateUtil.abrirSession();
			String sql = "SELECT * FROM produtos WHERE id_user != " + id + " AND upper(marca) like \'%" + search
					+ "%\' AND ativo = true ;";
			list = session.createSQLQuery(sql).addEntity(Produto.class).list();
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return list;
	}

	// ###############################################################################
	// ####################PESQUISAS##################################################
	// ###############################################################################

	// UPDATE DE QTD DE PRODUTO
	// POSTGRE
	public int updateQTD(Produto produto, int qtd) {
		Session session = null;
		int result = 0;
		try {
			session = HibernateUtilPost.abrirSession();
			String sql = "update Produto set qtd = (qtd - :numero) where id = :identificador";
			Query query = session.createQuery(sql);
			query.setParameter("numero", qtd);
			query.setParameter("identificador", produto.getId());
			result = query.executeUpdate();
			System.out.println("Resultado do update -> " + result);
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
			return -1;
		} finally {
			session.close();
		}
		return result;
	}

	// MARIADB
	public int updateQTD(Produto produto, int qtd, boolean aux) {
		Session session = null;
		int result = 0;
		try {
			session = HibernateUtil.abrirSession();
			String sql = "update Produto set qtd = (qtd - :numero) where id = :identificador";
			Query query = session.createQuery(sql);
			query.setParameter("numero", qtd);
			query.setParameter("identificador", produto.getId());
			result = query.executeUpdate();
			System.out.println("Resultado do update -> " + result);
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
			return -1;
		} finally {
			session.close();
		}
		return result;
	}

	// POSTGRE
	public int updateQTDVendida(Produto produto, int qtd) {
		Session session = null;
		int result = 0;
		try {
			session = HibernateUtilPost.abrirSession();
			String sql = "update Produto set qtd_vendida = (qtd_vendida + :numero) where id = :identificador";
			Query query = session.createQuery(sql);
			query.setParameter("numero", qtd);
			query.setParameter("identificador", produto.getId());
			result = query.executeUpdate();
			System.out.println("Resultado do update -> " + result);
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
			return -1;
		} finally {
			session.close();
		}
		return result;
	}

	// MARIADB
	public int updateQTDVendida(Produto produto, int qtd, boolean aux) {
		Session session = null;
		int result = 0;
		try {
			session = HibernateUtil.abrirSession();
			String sql = "update Produto set qtd_vendida = (qtd_vendida + :numero) where id = :identificador";
			Query query = session.createQuery(sql);
			query.setParameter("numero", qtd);
			query.setParameter("identificador", produto.getId());
			result = query.executeUpdate();
			System.out.println("Resultado do update -> " + result);
		} catch (HibernateException e) {
			System.out.println("Erro: " + e.toString());
			session.getTransaction().rollback();
			return -1;
		} finally {
			session.close();
		}
		return result;
	}

}
