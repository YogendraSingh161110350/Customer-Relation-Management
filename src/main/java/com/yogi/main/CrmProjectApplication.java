package com.yogi.main;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class CrmProjectApplication 
{
	public static void main(String[] args)
	{
		System.out.println("------springboot application is started---------");
		SpringApplication.run(CrmProjectApplication.class, args);
		System.out.println("------spring boot application started-----");
	}
}
