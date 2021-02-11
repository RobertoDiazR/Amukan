package com.codingdojo.Amukan.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.Amukan.models.UserType;

@Repository
public interface UserTypeRepository extends CrudRepository<UserType, Long> {
	

}
