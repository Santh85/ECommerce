package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.User;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<User> getAllUsers() {
		Session session = sessionFactory.openSession();
	 List<User> users=	 session.createCriteria(User.class).list();
	 System.out.println(users);
		session.close();
		return users;
	}

	public void deleteUser(String userId) {
		Session session = sessionFactory.openSession();
		User user = (User) session.get(User.class, userId);
		session.saveOrUpdate(user);
		session.flush();
		session.close();// close the session
	}

	public void addUser(User user) {
		Session session = sessionFactory.openSession();
		session.save(user);
		session.close();
	}

	public User getUserById(String userId) {
		Session session = sessionFactory.openSession();
	
		User user = (User) session.get(User.class, userId);
		session.close();
		return user;
	}
	
}
