package com.csm.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.csm.entity.Student;
import com.csm.util.Dao;
 

@Service
public class StudentServiceImpl extends Dao {

	 

	public Student get(int id) {
		return (Student) getSessionFactory().getCurrentSession().get(Student.class, id);
	}

	public int add(Student student) {
		return (Integer)  getSessionFactory().getCurrentSession().save(student);
	}

	public void delete(int id) {
		Student student = new Student();
		student.setId(id);
		 getSessionFactory().getCurrentSession().delete(student);
	}
}
