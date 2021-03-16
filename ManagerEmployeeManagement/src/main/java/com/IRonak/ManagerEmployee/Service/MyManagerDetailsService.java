package com.IRonak.ManagerEmployee.Service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.IRonak.ManagerEmployee.Repository.ManagerRepository;
import com.IRonak.ManagerEmployee.model.Manager;
import com.IRonak.ManagerEmployee.model.MyManagerDetails;

@Service
public class MyManagerDetailsService  implements UserDetailsService{

	@Autowired
	ManagerRepository managerrepository;
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		
		//return new MyManagerDetails(s);
		
		Optional<Manager> manager = managerrepository.findByEmail(email);
		
	//	return  manager.map(MyManagerDetails::new).orElseThrow(()-> new UsernameNotFoundException("User not Found:"+email));
		manager.orElseThrow(() -> new UsernameNotFoundException("Not found: " + email));
		
		System.out.println(new MyManagerDetails(manager.get()).getAuthorities().toString());
		
		return manager.map(MyManagerDetails::new).get();
	}

	

}
