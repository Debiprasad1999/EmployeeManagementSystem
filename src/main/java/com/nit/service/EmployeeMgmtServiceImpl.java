package com.nit.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.nit.model.Employee;
import com.nit.repository.IEmployeeRepository;

@Service
public class EmployeeMgmtServiceImpl implements IEmployeeMgmtService {
	@Autowired
	private IEmployeeRepository employeeRepo;

	@Override
	public Page<Employee> getAllEmployees(Pageable pageable) {
		return employeeRepo.findAll(pageable);
	}

	@Override
	public String saveEmployee(Employee employee) {
		employeeRepo.save(employee);
		return "Employee saved successfully!!!";
	}

	@Override
	public String deleteEmployee(int id) {
		employeeRepo.deleteById(id);
		return "Employee deleted successfully!!!";
	}

	@Override
	public Employee getEmployeeById(int id) {
		Optional<Employee> employee = employeeRepo.findById(id);
		return employee.get();
	}

	@Override
	public String updateEmployee(Employee employee) {
		employeeRepo.save(employee);
		return "Employee updated successfully!!!";
	}
}
