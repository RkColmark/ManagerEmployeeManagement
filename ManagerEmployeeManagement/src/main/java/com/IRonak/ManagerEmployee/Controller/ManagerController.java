package com.IRonak.ManagerEmployee.Controller;

import java.text.SimpleDateFormat;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.IRonak.ManagerEmployee.Service.EmployeeService;
import com.IRonak.ManagerEmployee.Service.ManagerService;
import com.IRonak.ManagerEmployee.model.Employee;
import com.IRonak.ManagerEmployee.model.Manager;

import ch.qos.logback.core.net.SyslogOutputStream;

@Controller
@RequestMapping("/manager")
public class ManagerController {

	@Autowired
	ManagerService managerservice;

	@Autowired
	private EmployeeService employeeService;

	private static Logger log = LoggerFactory.getLogger(ManagerController.class);

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		// Date - dd/MM/yyyy
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}

	@GetMapping("/signup")
	public String home(Model model) {
		Manager manager = new Manager();

		model.addAttribute("manager", manager);

		log.info("Signup Page Displayed");

		return "singup";
	}

	@PostMapping("/save")
	public String saveManager(@ModelAttribute("manager") Manager manager) {
		managerservice.saveManager(manager);

		log.info("Manager " + manager.getFirstname() + " " + manager.getLastname() + "Saved to the record");

		return "redirect:/manager/login";

	}

	@GetMapping("/login")
	public String showMyLoginPage() {

		return "login";

	}

}
