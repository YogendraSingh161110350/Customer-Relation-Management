package com.yogi.main.service;

import java.util.List;

import com.yogi.main.entity.Employee;

public interface EmployeeService 
{
	public boolean addEmployee(Employee employee);
	public List<Employee> getEmployees(String sort);
	public boolean deleteEmployee(int id);
	public Employee findEmployeeById(int id);
	public Employee findEmployeeByEmail(String email);
	public boolean updateEmployee(Employee employee);
}
