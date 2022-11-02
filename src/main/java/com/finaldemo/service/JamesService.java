package com.finaldemo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finaldemo.model.Users;
import com.finaldemo.model.UsersRepository;


//@Service
@Transactional
public class JamesService {
	
	@Autowired
	private UsersRepository memReps;
	
	public List<Users> findAll() {
		return memReps.findAll();
	}

	public Users findByUserId(Users memBean) {
		
		Integer userId = memBean.getUserId();
		Optional<Users> op1 = memReps.findById(userId);
		
		if (op1.isPresent()) {
			Users mem = op1.get();
			
			if (mem.getPassword().equals(memBean.getPassword())) {
				return mem;
			} else {
				return null;
			}
			
		}
		return null;
	}

	public Users insertMember(Users mbBean) {
		
		return memReps.save(mbBean);
	}
	
	public void deleteById(Integer id) {
		memReps.deleteById(id);
	}


	public Users findById(Integer id) {
		Optional<Users> op1 = memReps.findById(id);
		if (op1.isPresent()) {
			Users mem = op1.get();
			return mem;
		}
		
		return null;
	}
	
	
	public Users findByMemberId(Integer id) {
		
		Optional<Users> op1 = memReps.findById(id);
		
		if (op1.isPresent()) {
			Users mem = op1.get();
			return mem;
		}
		
		return null;
	}
	
	public Users updateMember(Users mbBean) {
		return memReps.save(mbBean);
	}
	

	
//	public Users findCheckId(String userId) {
//		return memReps.findCheckId(userId);
//	}
//
//	public Users findEmail(String email) {
//		return memReps.findEmail(email);
//	}

}
