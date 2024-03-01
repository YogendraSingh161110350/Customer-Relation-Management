package com.yogi.main.service;

import java.util.List;

import com.yogi.main.entity.Customer;

public interface CustomerService
{
	public List<String> getCourseList();
	public boolean addCustomer(Customer customer);
	public Customer getCustomerByPhone(String phone);
	public Customer getCustomerById(int id);
	public Customer getCustomerByEmail(String email);
}
