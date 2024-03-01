package com.yogi.main.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yogi.main.entity.Employee;
import com.yogi.main.service.EmployeeService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@Validated
public class EmployeeController
{
	private static String sort ="abc";
	private static int currentPage=1;
	@Autowired
	private EmployeeService employeeService;

	@GetMapping("/")
	public String indexPage() 
	{
		return "index";
	}

//	==================Add EMployee start===============================

	@GetMapping("/addEmployeePage")
	public String addEmployeePage(Model model)
	{
		model.addAttribute("employee", new Employee());
		return "add-employee";
	}

	@GetMapping("/admin-profile")
	public String adminProfilePage()
	{
		return "admin-profile";
	}

	@PostMapping("/doAddEmployee")
	public String doAddEmployee(
					@Valid @ModelAttribute("employee") Employee employee,
					BindingResult br,
					Model model)
	{
		
//		adding date in Employee
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy HH:mm");
		sdf.format(date);
		employee.setDateOfJoining(date);
		
		employee.setRole("employee");
		if(br.hasErrors()) 
		{
			
			return "add-employee";
		}
		else if (employeeService.addEmployee(employee)) 
		{
			model.addAttribute("successMsg", "Employee has beed added..!!!");
			employee.setEmail("");
			employee.setName("");
			employee.setPassword("");
			employee.setMobile("");
			
			return "add-employee";
		}
		
		model.addAttribute("failMsg", "Employee has not beed added..!!!");
		return "add-employee";
	}

//	==================Add EMployee End=================================	
	

	
	
//	==================Login Start======================================

	@PostMapping("/doLoginPage")
	public String doLoginPage(
			@RequestParam("email") String email,
			@RequestParam("password") String password,
			HttpSession session,
			Model model) 
	{
		//System.out.println("------do Login is called--------");
		Employee employee = employeeService.findEmployeeByEmail(email);
		if(employee!=null&&employee.getPassword().equals(password)) 
		{
			session.setAttribute("employee", employee);
			if(employee.getRole().equals("admin")) 
			{
				return "admin-profile";
			}
			else 
			{
				return "employee-profile";
			}
		}
		model.addAttribute("errorMessage", "Username Or Password is not match!!");
		return "login";
	}	
	@GetMapping("/login")
	public String loginPage()
	{
		return "login";
	}

//	==================Login End=========================================	

	
	
//	=========================== Employee List==========================
	private static int pageSize=6;
	@GetMapping("/employeeList")
	public String employeeList(
			Model model,
			@RequestParam(defaultValue = "1")int currentPage,
			@RequestParam(defaultValue = "abc")String sort,
			@RequestParam(name="successMsg",required = false)String successMsg,
			@RequestParam(name="failMsg",required = false)String failMsg
			)
	{
		EmployeeController.currentPage = currentPage;
		if(!sort.equals("abc"))
			EmployeeController.sort=sort;
		//sort is use for filter records
		List<Employee> employees= employeeService.getEmployees(EmployeeController.sort);
		
		//first record of page
		int startRecord = (currentPage-1)*pageSize;
		// End record of Page
		int endRecord = Math.min(startRecord+pageSize,employees.size());
		//total number of Page taken By A page
		int totalPage = (int)Math.ceil(employees.size()/(float)pageSize);
		
		model.addAttribute("employees", employees.subList(startRecord, endRecord));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("failMsg", failMsg);
		model.addAttribute("successMsg", successMsg);
		return "employee-list";
	}
//	=========================== Employee List End ==========================
	
	@GetMapping("/logout")
	public String logout(HttpSession session) 
	{
		session.invalidate();
		return "login";
	}
	@GetMapping("/deleteEmployee")
	public String deleteEmployee(@RequestParam("id")int id,RedirectAttributes redirectAttributes) 
	{
		System.out.println("deleye employee is called..");
		if(employeeService.deleteEmployee(id)) 
		{
			redirectAttributes.addAttribute("successMsg", "employee is deleted successfully");
		}
		else 
		{
			redirectAttributes.addAttribute("failMsg", "employee could not deleted");
		}
		return "redirect:/employeeList?currentPage="+EmployeeController.currentPage;
	}
	
	
	
	
	@GetMapping("/updateEmployee")
	public String updateEmployee(
			Model model,
			@RequestParam("id")int id) 
	{
		System.out.println(" id which is coming from update page: "+id);
		Employee employee = employeeService.findEmployeeById(id);
		model.addAttribute("employee", employee);
		return "update-employee";
	}
	@PostMapping("/doUpdateEmployee")
	public String doUpdateEmployee(
			@Valid @ModelAttribute("employee")Employee employee,
			BindingResult br,RedirectAttributes redirectAttributes) 
	{
		
		// get Employee record from database
		Employee emp = employeeService.findEmployeeById(employee.getId());
		//emp.setDateOfJoining(employee.getDateOfJoining());
		//emp.setEmail(employee.getEmail());
		emp.setMobile(employee.getMobile());
		emp.setName(employee.getName());
		emp.setPassword(employee.getPassword());
		
//		emp.setProfilePic(employee.getProfilePic());
//		emp.setRole(employee.getRole());
//		emp.setSalary(employee.getSalary());
		
		redirectAttributes.addAttribute("sort", EmployeeController.sort);
		redirectAttributes.addAttribute("currentPage", EmployeeController.currentPage);
		if(br.hasErrors()) 
		{
			return "update-employee";
		}
		
		else if(employeeService.updateEmployee(emp)) 
		{
			
			redirectAttributes.addAttribute("successMsg", "Record has been updated");
		}
		else 
		{
			redirectAttributes.addAttribute("failMsg", "record could not update");
		}
		return "redirect:/employeeList";
	}
}
