package com.yogi.main.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yogi.main.entity.Course;
import com.yogi.main.repository.CourseRepo;

@Service
public class CousrseServiceImpl implements CourseService
{
	@Autowired
	private CourseRepo courseRepo;
	@Override
	public boolean addCourse(Course course)
	{
		try 
		{
			courseRepo.save(course);
			return true;
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		return false;
	}
	@Override
	public List<Course> getCourses() 
	{
		
		return courseRepo.findAll();
	}
	@Override
	public Course getCourse(int id)
	{
		Course course = new Course();
		try 
		{
			Optional<Course> optional= courseRepo.findById(id);
			course = optional.get();
			return course;
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		return course;
	}

}
