package com.yogi.main.entity;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

@Entity
public class CustomerEnquery 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int enqId;
	private String interestedCourse;
	private String discussion;
	private String status;
	private String phone;
	private String followUpDate;
	private String enquiryDate;
	private String enquiryTime;
	private String medium;
	private String caller;
	@ManyToOne(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	private Customer customer;
	private String employeeEmail;
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public int getEnqId() {
		return enqId;
	}
	public void setEnqId(int enqId) {
		this.enqId = enqId;
	}
	public String getInterestedCourse() {
		return interestedCourse;
	}
	public void setInterestedCourse(String interestedCourse) {
		this.interestedCourse = interestedCourse;
	}
	public String getDiscussion() {
		return discussion;
	}
	public void setDiscussion(String discussion) {
		this.discussion = discussion;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getFollowUpDate() {
		return followUpDate;
	}
	public void setFollowUpDate(String followUpDate) {
		this.followUpDate = followUpDate;
	}
	public String getEnquiryDate() {
		return enquiryDate;
	}
	public void setEnquiryDate(String enquiryDate) {
		this.enquiryDate = enquiryDate;
	}
	public String getEnquiryTime() {
		return enquiryTime;
	}
	public void setEnquiryTime(String enquiryTime) {
		this.enquiryTime = enquiryTime;
	}
	public String getMedium() {
		return medium;
	}
	public void setMedium(String medium) {
		this.medium = medium;
	}
	public String getCaller() {
		return caller;
	}
	public void setCaller(String caller) {
		this.caller = caller;
	}
	public String getEmployeeEmail() {
		return employeeEmail;
	}
	public void setEmployeeEmail(String employeeEmail) {
		this.employeeEmail = employeeEmail;
	}
	
}
