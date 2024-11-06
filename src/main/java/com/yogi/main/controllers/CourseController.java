package com.yogi.main.controllers;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yogi.main.entity.Course;
import com.yogi.main.service.CourseService;

import jakarta.validation.Valid;

@Controller
public class CourseController
{
	@Autowired
	private CourseService courseService;
	@GetMapping("/addCourse")
	public String addCourse(
							Model model,
							@RequestParam(name="errorMsg",required =  false)String errorMsg,
							@RequestParam(name="successMsg",required = false)String successMsg
							) 
	{
		Course c = new Course();
		System.out.println("---THis is my First Commit");
		System.out.println("--How i can DO work----");
		System.out.println();
		System.out.println();
		model.addAttribute("course",c );
		model.addAttribute("successMsg", successMsg);
		model.addAttribute("errorMsg", errorMsg);
		return "add-course";
	}
	
	@PostMapping("/doAddCourse")
	public String doAddCourse(
			@Valid @ModelAttribute(name = "course")Course course,
			@RequestParam("image") MultipartFile image1,
			@RequestParam("trainer.image")MultipartFile image2,
			RedirectAttributes redirectAttributes,
			BindingResult br
			) 
	{
		if(br.hasErrors()) 
		{
			System.out.println("-------error is getting-----");
			return "add-course";
		}
		else if(courseService.addCourse(course)) 
		{
			saveImage(image1);
			saveImage(image2);
			redirectAttributes.addFlashAttribute("errorMsg", "Course has been added successfully...");
			System.out.println("-------------value is stored inside database------------");
		}
		else 
		{
			redirectAttributes.addFlashAttribute("successMsg", "Course has been added successfully...");
		}		
		return "redirect:/addCourse";
	}
	
	
	private boolean saveImage(MultipartFile file) 
	{
		try 
		{
			String fileName = file.getOriginalFilename();
			Path path = Paths.get("src\\main\\resources\\static\\uploads\\", fileName);
			Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
			return true;
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		return false;
	}
	
	@GetMapping("/courseList")
	public String courseList(Model model) 
	{
		List<Course> courses = courseService.getCourses();
		model.addAttribute("courses", courses);
		return "courses-list";
	}
	@GetMapping("/courseDetails")
	public String courseDetails(
				Model model,
				@RequestParam("id") int id
			) 
	{
		Course course = courseService.getCourse(id);
		model.addAttribute("course", course);
		return "courses-details";
	}
}
