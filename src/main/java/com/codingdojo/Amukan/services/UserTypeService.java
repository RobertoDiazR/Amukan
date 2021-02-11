package com.codingdojo.Amukan.services;


import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.Amukan.models.UserType;
import com.codingdojo.Amukan.repository.UserTypeRepository;

@Service
public class UserTypeService{
	private final UserTypeRepository userTypeRepository;
	public UserTypeService(UserTypeRepository userTypeRepository) {
		this.userTypeRepository = userTypeRepository;
	}
	public UserType createUserType(UserType ut) {
		return userTypeRepository.save(ut);
	}
	public UserType findUserType(Long id) {
		Optional<UserType> ut = userTypeRepository.findById(id);
		if(ut.isPresent()) {
			return ut.get();
		}else {
			return null;
		}
	}
}
