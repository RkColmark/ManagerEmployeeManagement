package com.IRonak.ManagerEmployee.Controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/")
	public String home(Principal principal) {
		if (principal != null)
			return "redirect:employee/list";

		else
			return "redirect:manager/login";
	}

}
