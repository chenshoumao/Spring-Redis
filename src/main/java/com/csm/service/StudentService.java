package com.csm.service;

import java.util.List;

import org.openxmlformats.schemas.wordprocessingml.x2006.main.STUnderline;
import org.springframework.stereotype.Service;

import com.csm.entity.Student;
import com.csm.util.Dao;
@Service
public class StudentService extends Dao{

	public List saveData(){
		
		 Student student = new Student();
		 
		 student.setName("sdfsd");
		 student.setCard("1231");
		 student.setId(1);
		 
		 save(student);
		
		return null;
	}
}
