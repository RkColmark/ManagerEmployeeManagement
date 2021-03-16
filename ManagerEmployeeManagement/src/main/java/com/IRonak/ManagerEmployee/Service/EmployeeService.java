package com.IRonak.ManagerEmployee.Service;

import java.util.List;

import com.IRonak.ManagerEmployee.model.Employee;

public interface EmployeeService {
	
	List<Employee> findAll();
	
	public void saveEmployee(Employee employee);
	
	public Employee getEmployee(int id);
	
	public void deleteEmployee(int id);

	
	
	

}
