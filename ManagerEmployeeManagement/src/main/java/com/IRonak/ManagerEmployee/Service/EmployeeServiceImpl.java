package com.IRonak.ManagerEmployee.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.IRonak.ManagerEmployee.Repository.EmployeeRepository;
import com.IRonak.ManagerEmployee.model.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	EmployeeRepository employeerepository;

	@Override
	public List<Employee> findAll() {

		return employeerepository.findAll();
	}

	@Override
	public void saveEmployee(Employee employee) {

		employeerepository.save(employee);
	}

	@Override
	public Employee getEmployee(int id) {

		// return employeerepository.findById(id).get();
		Optional<Employee> employee = employeerepository.findById(id);

		Employee theEmployee = null;

		if (employee.isPresent()) {
			theEmployee = employee.get();
		} else {
			// we didn't find the employee
			throw new RuntimeException("Did not find employee id - " + id);
		}

		return theEmployee;
	}

	@Override
	public void deleteEmployee(int id) {

		employeerepository.deleteById(id);

	}

}
