package com.nit.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.nit.model.Employee;

public interface IEmployeeMgmtService {
	public Page<Employee> getAllEmployees(Pageable pageable);
	
	public String saveEmployee(Employee employee);
	
	public String deleteEmployee(int id);
	
	public Employee getEmployeeById(int id);
	
	public String updateEmployee(Employee employee);
}