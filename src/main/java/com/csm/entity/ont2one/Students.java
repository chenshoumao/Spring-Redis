package com.csm.entity.ont2one;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Students {
	@Id
	@GeneratedValue
	private int sid;
	
	private String gender;
	private Date birthday;
	private String major;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="pid",unique=true)
	private IdCard card;
	public Students(){}
	public Students(IdCard card,int sid,  String gender, Date birthday, String major) {
		super();
		this.card = card;
		this.sid = sid;
	 
		this.gender = gender;
		this.birthday = birthday;
		this.major = major;
	}
	 
	
	
	public IdCard getCard() {
		return card;
	}
	public void setCard(IdCard card) {
		this.card = card;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
 
	 
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	
	
}
