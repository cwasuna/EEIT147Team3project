package com.finaldemo.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public interface ShoppingCarRepository extends JpaRepository<ShoppingCar, Integer> {

	@Query(value = "SELECT * FROM ShoppingCar S INNER JOIN Products P on S.fk_product_Id = P.productId  WHERE S.fk_user_id= ?1" ,nativeQuery = true)
	public List<ShoppingCar> findAllShoppingCarProducts(@Param("userId") String fk_user_id);	
	
	//刪除   SELECT SQL 語法 但可以用JPA解決
	@Transactional
	@Modifying   //Modifying註解用於增強@Query註解，這樣我們不僅可以執行SELECT查詢，還可以執行INSERT、UPDATE、DELETE甚至DDL查詢 不使用@Modifying註解的結果得到一個InvalidDataAccessApiUsage異常
	@Query(value = "DELETE FROM ShoppingCar WHERE shoppingCarId = ?1" ,nativeQuery = true)
	public void deleteShoppingCarProducts(@Param("shoppingCarId") Integer shoppingCarId);	
	
	
	@Query(value = " SELECT * FROM ShoppingCar  shoppingCarId WHERE shoppingCarId =?1" ,nativeQuery = true)
	public ShoppingCar findShoppingCarProducts(@Param("shoppingCarId")  Integer shoppingCarId);	
	
	@Transactional
	@Modifying 
	@Query(value = " UPDATE ShoppingCar SET quantity=?1  WHERE shoppingCarId =?2" ,nativeQuery = true)
	public void  updatequantityShoppingCarProducts(@Param("quantity") Integer quantity,@Param("shoppingCarId") Integer shoppingCarId);	
	

	@Query(value = " SELECT * FROM ShoppingCar shoppingCarId WHERE shoppingCarId IN(?1)" ,nativeQuery = true)
	public List<ShoppingCar> findShoppingCarProductsToOrders(@Param("shoppingCarId")  List<String> strId);	
}
