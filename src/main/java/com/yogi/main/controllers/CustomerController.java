package com.yogi.main.controllers;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yogi.main.entity.Course;
import com.yogi.main.entity.Customer;
import com.yogi.main.entity.CustomerEnquery;
import com.yogi.main.entity.PurchaseCourse;
import com.yogi.main.service.CustomerInquiryService;
import com.yogi.main.service.CustomerService;
import com.yogi.main.service.PurchaseCourseService;

import jakarta.servlet.http.HttpSession;

@Controller
public class CustomerController
{
	@Autowired
	private PurchaseCourseService purchaseCourseService;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private CustomerInquiryService customerInquiryService;
	
	@GetMapping("/customer-login")
	public String customerLogin() 
	{
		// for opening customer login page
		return "customer-login";
	}
	@PostMapping("/customerDoLogin")
	public String customerDoLogin(
				Model model,
				HttpSession session,
				@RequestParam("email") String email,
				@RequestParam("password") String password				
			) 
	{
		Customer customer= customerService.getCustomerByEmail(email);
		if(customer!=null && customer.getPassword().equals(password)) 
		{
				session.setAttribute("customer", customer);
				System.out.println(customer.getRole());
				return "customer-profile";
		}
		model.addAttribute("errorMessage", "Username Or Password is not match!!");
		return "customer-login";
	}
	
	
	@GetMapping("/customerInquiry")
	public String customerInquiry(
			Model model,
			@RequestParam(name="failMsg",required =  false)String failMsg,
			@RequestParam(name="successMsg",required = false)String successMsg
			) 
	{
		model.addAttribute("customer", new CustomerEnquery());
		
		List<String> courses = customerService.getCourseList();
		model.addAttribute("courses", courses);
		model.addAttribute("successMsg",successMsg);
		model.addAttribute("failMsg",failMsg);
		//System.out.println("hii is calling====================");
		return "customer-inquiry-form";
	}
	@PostMapping("/addCustomerInquiry")
	public String addCustomerInquiry(
						@ModelAttribute("customer")CustomerEnquery customerInquery,
						RedirectAttributes redirectAttributes
			) 
	{
		//getting customer using mobile number
		Customer customer =   customerService.getCustomerByPhone(customerInquery.getPhone());
		//setting date and time 
		setDateAndTime(customerInquery,null) ;
		//setting customer Phone 
		
		if(customer!=null) 
		{	
			customerInquery.setCustomer(customer);
			customerInquiryService.addInquiery(customerInquery);
			redirectAttributes.addAttribute("successMsg", customerInquery.getCustomer().getName() +" record has beed saved successfully");
			return "redirect:/customerInquiry";
		}
		 customerInquery.getCustomer().setPhone(customerInquery.getPhone());
		 if(customerInquiryService.addInquiery(customerInquery))
		{
			 
			 redirectAttributes.addAttribute("successMsg", customerInquery.getCustomer().getName() +" record has beed saved successfully");
			 return "redirect:/customerInquiry";
		}
		else 
		{
			redirectAttributes.addAttribute("failMsg",customerInquery.getCustomer().getName() +" record could not saved");	
 
		}
		return "redirect:/customerInquiry";
	}
	
	private void setDateAndTime(CustomerEnquery customerInquery,PurchaseCourse purchaseCourse) 
	{
		// for setting date
		LocalDate date1 = LocalDate.now();
		DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("dd-MMM-yyyy");
		String date =date1.format(dtf1);
		// for setting time
		LocalTime time1 = LocalTime.now();
		DateTimeFormatter dtf2 = DateTimeFormatter.ofPattern("hh:mm a");
		String time = time1.format(dtf2);
		if(customerInquery!=null) 
		{
			customerInquery.setEnquiryTime(time);
			customerInquery.setEnquiryDate(date);
		}
		else if(purchaseCourse!=null) 
		{
			purchaseCourse.setTimeOfPurchase(time);;
			purchaseCourse.setDateOfPurchase(date);;
		}
		
	}
	
	@GetMapping("/checkPhoneNumber")
	@ResponseBody
	public Map<String, Object> checkPhoneNumber(@RequestParam("phoneNumber") String phone) 
	{
		Map<String, Object> inquiryData = new HashMap<>();
		if(phone.length()==10) 
		{
			Customer customer=customerService.getCustomerByPhone(phone);
			if(customer!=null) 
			{
				
				inquiryData.put("name",customer.getName());
				inquiryData.put("status", "exist");
				return inquiryData;
			}
		}
		inquiryData.put("status", "not exist");
		return 	inquiryData;
	}
	@GetMapping("/inqueryList")
	public String inqueryList(@RequestParam("phone")String phone,Model model) 
	{
		Customer customer=customerService.getCustomerByPhone(phone);
		List<CustomerEnquery> enqueryList = customer.getCustomerEnqueries();
		System.out.println("---------------------------==============================");
		model.addAttribute("enqueryList", enqueryList);
		return "customer-inquiry-list";
	}
	
	
	@PostMapping("/purchaseCourse")
	@ResponseBody
	public String purchaseCourse(
			@RequestParam("name") String courseName,
			   @RequestParam("price") String price,
			   @RequestParam("validity") String validity,
			   @RequestParam("mode") String mode
			) 
	{
		PurchaseCourse purchaseCourse = new PurchaseCourse();
		purchaseCourse.setCourseName(courseName);
		purchaseCourse.setMode(mode);
		purchaseCourse.setPrice(price);
		purchaseCourse.setValidity(validity);
		setDateAndTime(null, purchaseCourse);
		Customer customer = customerService.getCustomerById(6);
		purchaseCourse.setCustomer(customer);
		purchaseCourseService.AddPurchaseCourse(purchaseCourse);
		
		return "value inserted";
	}
	@GetMapping("/customer-logout")
	public String cutomerLogout(HttpSession session) 
	{
		session.invalidate();
		return "customer-login";
	}
	@GetMapping("/purchase-course-list")
	public String customerPurchaseCourse(HttpSession session,Model model) 
	{
		Customer customer = (Customer)session.getAttribute("customer");
		List<PurchaseCourse> purchasedCourses = customer.getPurchasedCourse();
		model.addAttribute("purchasedCourses", purchasedCourses);
		return "customer-purchase-course";
	}
}
