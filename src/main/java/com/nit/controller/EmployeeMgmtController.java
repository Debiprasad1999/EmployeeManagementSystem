package com.nit.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nit.model.Employee;
import com.nit.service.IEmployeeMgmtService;

@Controller
public class EmployeeMgmtController {
	@Autowired
	private IEmployeeMgmtService employeeService;

	@GetMapping("/")
	public String showHome() {
		return "index";
	}

	@GetMapping("/viewemployees")
	public String showEmployeesReport(@PageableDefault(page = 0, size = 5) Pageable pageable, Map<String, Object> map) {
		Page<Employee> employees = employeeService.getAllEmployees(pageable);
		map.put("employees", employees.getContent());
		map.put("pageNumber", employees.getPageable().getPageNumber());
		map.put("totalPages", employees.getTotalPages());
		map.put("isLast", employees.isLast());
		return "employee-report";
	}

	@GetMapping("/registeremployee")
	public String loadRegistrationForm(@ModelAttribute("employee") Employee employee) {
		return "registration-form";
	}
	
	@PostMapping("/registeremployee")
	public String registerEmployee(@ModelAttribute("employee") Employee employee, RedirectAttributes attributes) {
		String successMsg = employeeService.saveEmployee(employee);
		attributes.addFlashAttribute("successMsg", successMsg);
		return "redirect:/viewemployees";
	}
	
	@GetMapping("/deleteemployee")
	public String deleteEmployee(@RequestParam("id") int id, RedirectAttributes attributes) {
		String deleteMsg = employeeService.deleteEmployee(id);
		attributes.addFlashAttribute("deleteMsg", deleteMsg);
		return "redirect:/viewemployees";
	}
	
	@GetMapping("/updateemployee")
	public String loadUpdateForm(@ModelAttribute("employee") Employee employee, @RequestParam("id") int id) {
		Employee emp = employeeService.getEmployeeById(id);
		BeanUtils.copyProperties(emp, employee);
		return "update-form";
	}
	
	@PostMapping("/updateemployee")
	public String updateEmployee(@ModelAttribute("employee") Employee employee, RedirectAttributes attributes) {
		String updateMsg = employeeService.updateEmployee(employee);
		attributes.addFlashAttribute("updateMsg", updateMsg);
		return "redirect:/viewemployees";
	}
	
	@ModelAttribute("jobs")
	public List<String> getJobs() {
		List<String> jobs = List.of("MANAGER", "ANALYST", "CLERK", "SALESMAN");
		return jobs;
	}
	
	@ModelAttribute("countries")
	public List<String> getCountries() {
		List<String> countries = List.of("India", "Pakistan", "Australia", "Nepal", "Russia", "Sri Lanka");
		return countries;
	}
}