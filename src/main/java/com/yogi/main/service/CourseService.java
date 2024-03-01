package com.yogi.main.service;

import java.util.List;

import com.yogi.main.entity.Course;

public interface CourseService
{
	public boolean addCourse(Course course);
	public List<Course> getCourses();
	public Course getCourse(int id);
}
