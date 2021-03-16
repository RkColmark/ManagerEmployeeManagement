package com.IRonak.ManagerEmployee.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.IRonak.ManagerEmployee.model.Employee;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee,Integer> {
	

}
