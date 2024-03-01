package com.yogi.main.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.yogi.main.entity.Employee;

@Repository
@Transactional
public interface EmployeeDao extends JpaRepository<Employee, Integer>
{
	public List<Employee> findAllByOrderByNameAsc();
	public List<Employee> findAllByOrderByEmailAsc();
	public List<Employee> findAllByOrderByDateOfJoiningAsc();
	public List<Employee> findAllByOrderByDateOfJoiningDesc();
	public List<Employee> findAllByOrderBySalaryAsc();
	public List<Employee> findAllByOrderBySalaryDesc();
	public void deleteById(int id);
	public Employee findByEmail(String email);
	
}
