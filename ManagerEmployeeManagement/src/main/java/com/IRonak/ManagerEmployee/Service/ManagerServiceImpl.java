package com.IRonak.ManagerEmployee.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.IRonak.ManagerEmployee.Repository.ManagerRepository;
import com.IRonak.ManagerEmployee.model.Manager;

@Service
public class ManagerServiceImpl implements ManagerService{

	@Autowired
	ManagerRepository managerrepository;
	
	@Override
	public void saveManager(Manager data) {
		
		System.out.print(data.getAddress()+ "" +data.getCompany());
		managerrepository.save(data);
		
		
		
	}
	
	

}
