package com.finaldemo.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface PetsRepository extends JpaRepository<Pets, Integer> {
	
//	@Query(value = "SELECT * FROM Pets WHERE petType =:petType", nativeQuery = true) 
//	public List<Pets> petTypeCat(@Param("petType") Integer petType);
	@Query(value = "SELECT COUNT(1) FROM [Pets] WHERE petType = :petType", nativeQuery = true) 
	public Integer petType(@Param("petType") Integer petType);
	
}