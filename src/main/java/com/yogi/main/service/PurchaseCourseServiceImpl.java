package com.yogi.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yogi.main.entity.PurchaseCourse;
import com.yogi.main.repository.PurchaseCourseRepo;

@Service
public class PurchaseCourseServiceImpl implements PurchaseCourseService
{
	@Autowired
	private PurchaseCourseRepo purchaseCourseRepo;
	@Override
	public boolean AddPurchaseCourse(PurchaseCourse purchaseCourse) 
	{
		try 
		{
			purchaseCourseRepo.save(purchaseCourse);
			return true;
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		return false;
	}

}
