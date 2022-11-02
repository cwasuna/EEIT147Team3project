package com.finaldemo.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public interface ProductsRepository extends JpaRepository<Products, Integer> {
	
	// 此為小郭寫的亂刪砍手

    @Query(value = "Select * from Products where fk_foundation_id = :id and productStatus != 0", nativeQuery = true)
    public List<Products> findProudtsByUserId(@Param("id") Integer userId);
    
   // public List<Products> findAllById();
   // public List<Products> findAllByProductId();
    
    
}
	