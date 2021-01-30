package model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtilPost {

	private static Session session;
	public static String erro = null;

	public static Session abrirSession() {
		SessionFactory sessionFactory = new Configuration().configure("postgresql.cfg.xml").buildSessionFactory();
		session = sessionFactory.openSession();
		session.beginTransaction();
		return session;
	}
}
