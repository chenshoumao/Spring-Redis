package com.csm.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.csm.entity.User;
import com.csm.util.Dao;

 

@Service
public class UserServiceImpl extends Dao {

 

	public List<User> findAll() {
		return getSessionFactory().getCurrentSession().createQuery("from User").list();
		}

		public int add(User user) {
			return (Integer) getSessionFactory().getCurrentSession().save(user);
		}

		public void update(User user) {
			getSessionFactory().getCurrentSession().update(user);
		}
}
