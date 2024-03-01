package com.yogi.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.yogi.main.entity.Customer;

@Repository
public interface CustomerRepo extends JpaRepository<Customer, Integer>
{
	public Customer findByPhone(String phone);
	public Customer findByEmail(String email);
}
