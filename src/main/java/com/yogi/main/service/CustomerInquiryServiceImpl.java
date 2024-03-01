package com.yogi.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yogi.main.entity.CustomerEnquery;
import com.yogi.main.repository.CustomerInquieryRepo;

@Service
public class CustomerInquiryServiceImpl implements CustomerInquiryService
{
	@Autowired
	private CustomerInquieryRepo customerInquieryRepo;

	@Override
	public boolean addInquiery(CustomerEnquery customerEnquery) 
	{
		try 
		{
			System.out.println("-------saving Inquery in service layer-----");
			customerInquieryRepo.save(customerEnquery);
			return true;
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		return false;
	}

}
