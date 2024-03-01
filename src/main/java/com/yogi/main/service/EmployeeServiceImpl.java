package com.yogi.main.service;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yogi.main.entity.Employee;
import com.yogi.main.repository.EmployeeDao;

@Service
public class EmployeeServiceImpl implements EmployeeService
{
	@Autowired
	private EmployeeDao employeeDao; 
	@Override
	public boolean addEmployee(Employee employee) 
	{
		try 
		{
			employeeDao.save(employee);
			return true;
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		return false;
	}
	@Override
	public List<Employee> getEmployees(String sort) 
	{
		if(sort.equals("byName")) 
		{
			return employeeDao.findAllByOrderByNameAsc();
		}
		else if(sort.equals("byEmail")) 
		{
			return employeeDao.findAllByOrderByEmailAsc();
		}
		else if(sort.equals("byNewJoining")) 
		{
			return employeeDao.findAllByOrderByDateOfJoiningDesc();
		}
		else if(sort.equals("byOldJoining")) 
		{
			return employeeDao.findAllByOrderByDateOfJoiningAsc();
		}
		else if(sort.equals("bySalaryAsc")) 
		{
			return employeeDao.findAllByOrderBySalaryAsc();
		}
		else if(sort.equals("bySalaryDesc")) 
		{
			return employeeDao.findAllByOrderBySalaryDesc();
		}
		return employeeDao.findAll();
	}
	@Override
	public boolean deleteEmployee(int id) 
	{
		try 
		{
			employeeDao.deleteById(id);
			return true;
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		return false;
	}
	@Override
	public Employee findEmployeeById(int id) 
	{
		try 
		{
			Optional<Employee> optional =  employeeDao.findById(id);
			Employee employee = optional.get();
			return employee;
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public boolean updateEmployee(Employee employee) 
	{
		Employee emp = employeeDao.save(employee);
		if(emp==null)
			return false;
		return true;
	}
	@Override
	public Employee findEmployeeByEmail(String email)
	{
		Employee employee= employeeDao.findByEmail(email);
		return employee;
	}
	
}
