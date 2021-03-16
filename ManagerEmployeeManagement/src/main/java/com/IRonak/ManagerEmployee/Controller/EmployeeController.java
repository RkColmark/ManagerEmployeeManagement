package com.IRonak.ManagerEmployee.Controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.IRonak.ManagerEmployee.Service.EmployeeService;
import com.IRonak.ManagerEmployee.model.Employee;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;

	private static Logger log = LoggerFactory.getLogger(ManagerController.class);
	private static Logger logEmp = LoggerFactory.getLogger(EmployeeService.class);

	public void initBinder(WebDataBinder binder) {
		// Date - dd/MM/yyyy
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}

	@GetMapping("/hello")
	private String getHello() {
		System.out.println("Hello,We are inside Employee class");
		return "signup";
	}

	@GetMapping("/list")
	public String login(Model model, Principal principal) {
		List<Employee> employee = employeeService.findAll();

		log.info("Current Logged in Username: " + principal.getName());

		Employee emp = new Employee();

		model.addAttribute("employees", employee);

		model.addAttribute("employee", emp);

		return "employee";
	}

	@PostMapping("/saveEmployee")
	public String saveCustomer(@ModelAttribute("employee") Employee theEmployee) {

		employeeService.saveEmployee(theEmployee);

		logEmp.info(theEmployee.getFirstname() + " " + theEmployee.getLastname() + "Saved to the Records");

		return "redirect:/employee/list";
	}

	@GetMapping("/showUpdate")
	public String showFormForUpdate(@RequestParam("id") int theId, Model theModel) {
		Employee theEmployee = employeeService.getEmployee(theId);

		// theModel.addAttribute("employee",new Employee());

		System.out.println(theEmployee);

		theModel.addAttribute("employee", theEmployee);

		return "updateemployee";
	}

	@GetMapping("/delete")
	public String deleteCustomer(@RequestParam("id") int theId) {
		employeeService.deleteEmployee(theId);

		return "redirect:/employee/list";

	}

}
