package com.admin.usermanagement.bean;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class OnetoOne {
	public static void main(String args[]) {

		Configuration cfg = new Configuration();
		cfg.configure("hibernate.xml");

		SessionFactory factory = cfg.buildSessionFactory();
		Session session = factory.openSession();

		LoginBean l = new LoginBean();
		l.setUsername("admin");
		l.setPassword("admin");

		User user = new User();
		user.setId(1);
		user.setName("admin");
		user.setEmail("admin@gmail.com");
		user.setCountry("India");
		user.setRole("Checker");

		User user1 = new User();
		user1.setId(2);
		user1.setName("Sanika");
		user1.setEmail("sanika@gmail.com");
		user1.setCountry("Germany");
		user1.setRole("Maker");

		user.setLog(l);
		user1.setLog(l);
		Transaction tx = session.beginTransaction();
		session.save(user);
		session.save(user1);
		tx.commit();
		session.close();
		System.out.println("One to One with annotations is done..!!!!");
		factory.close();
	}
}