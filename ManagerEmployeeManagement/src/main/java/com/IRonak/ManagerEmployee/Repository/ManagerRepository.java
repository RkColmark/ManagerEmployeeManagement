package com.IRonak.ManagerEmployee.Repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.IRonak.ManagerEmployee.model.Manager;

@Repository
public interface ManagerRepository extends JpaRepository<Manager,Integer>{
	
	
	

//	public Optional<Manager> findByFirstName(String s);

	public Optional<Manager> findByEmail(String email); 
}
