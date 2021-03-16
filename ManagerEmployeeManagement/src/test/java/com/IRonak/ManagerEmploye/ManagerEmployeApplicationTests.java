package com.IRonak.ManagerEmploye;

import java.util.Date;
import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;

import com.IRonak.ManagerEmployee.ManagerEmployeApplication;
import com.IRonak.ManagerEmployee.Repository.EmployeeRepository;
import com.IRonak.ManagerEmployee.Repository.ManagerRepository;
import com.IRonak.ManagerEmployee.Service.EmployeeService;
import com.IRonak.ManagerEmployee.Service.ManagerService;
import com.IRonak.ManagerEmployee.model.Employee;
import com.IRonak.ManagerEmployee.model.Manager;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = ManagerEmployeApplication.class)
public class ManagerEmployeApplicationTests {

	@Autowired
	private ManagerService managerService;

	@MockBean
	private ManagerRepository managerRepository;

	@Autowired
	private EmployeeService employeeService;

	@MockBean
	private EmployeeRepository employeeRepository;

	@Test
	public void findAllTest() {

		when(employeeRepository.findAll())
				.thenReturn(Stream
						.of(new Employee("Danile", "Kal", "St Street", new java.util.Date(System.currentTimeMillis()),
								"8955623124", "LA"),
								new Employee("Kim", "Possible", "LG Street",
										new java.util.Date(System.currentTimeMillis()), "89556931245", "NYA"))
						.collect(Collectors.toList()));
		assertEquals(2, employeeService.findAll().size());
	}

	@Test
	public void deleteEmployeeTest() {
		Employee employee = new Employee("Purvi", "Naik", "Bombay Chawk",
				new java.util.Date(System.currentTimeMillis()), "6959631475", "JSG");
		employeeService.deleteEmployee(employee.getId());
		verify(employeeRepository, times(1)).deleteById(employee.getId());

	}

	@Test
	public void saveEmployeeTest() {
		Employee employee = new Employee("Purvi", "Naik", "Bombay Chawk",
				new java.util.Date(System.currentTimeMillis()), "6959631475", "JSG");
		employeeService.saveEmployee(employee);
		verify(employeeRepository, times(1)).save(employee);

	}

	@Test
	public void saveManagerTest() {
		Manager manager = new Manager("Purvi", "Naik", "pn@gmail.com", "pn@123", "Market Building",
				new java.util.Date(System.currentTimeMillis()), "BBSR");
		managerService.saveManager(manager);
		verify(managerRepository, times(1)).save(manager);

	}

}
