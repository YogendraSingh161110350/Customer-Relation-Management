package com.yogi.main.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yogi.main.entity.Customer;
import com.yogi.main.repository.CourseRepo;
import com.yogi.main.repository.CustomerRepo;
@Service
public class CustomerServiceImpl implements CustomerService
{
	@Autowired
	private CourseRepo courseRepo;
	@Autowired
	private CustomerRepo customerRepo;
	@Override
	public List<String> getCourseList() 
	{
		
		return courseRepo.getCoursesName();
	}
	@Override
	public boolean addCustomer(Customer customer)
	{
		try 
		{
			customerRepo.save(customer);
			return true;
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		return false;
	}
	@Override
	public Customer getCustomerByPhone(String phone) 
	{
		try 
		{
			Customer customer = customerRepo.findByPhone(phone);
			return customer;
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public Customer getCustomerById(int id) 
	{
		Customer customer = customerRepo.findById(id).orElse(null);
		return customer;
	}
	
	@Override
	public Customer getCustomerByEmail(String email) 
	{
		Customer customer = customerRepo.findByEmail(email);
		return customer;
	}
}
