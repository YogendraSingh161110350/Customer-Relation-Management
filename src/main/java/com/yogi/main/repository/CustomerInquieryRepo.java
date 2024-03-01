package com.yogi.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.yogi.main.entity.CustomerEnquery;

public interface CustomerInquieryRepo extends JpaRepository<CustomerEnquery, Integer>
{
	
}
