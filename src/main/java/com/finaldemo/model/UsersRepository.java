package com.finaldemo.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface UsersRepository extends JpaRepository<Users, Integer> {
	//Users
	@Query(value = "select * from Users where email = :email and password = :password", nativeQuery = true) 
	public Users selectUserByNameAndPwd(@Param("email") String email, @Param("password") String password);
	
	@Query(value = "select * from Users where nickName like %:search%", nativeQuery = true) 
	public List<Users> searchPeopleByNickName(@Param("search") String search);
	
	@Query(value = "select * from Users where email like %:search%", nativeQuery = true) 
	public List<Users> searchPeopleByEmail(@Param("search") String search);
	
//<<<<<<< HEAD
//
//	@Query(value = "select * from Users where category = 2", nativeQuery = true)
//	public List<Users> findAllCharities();
//	
////	public Optional<Users> findByUserId(String userId);
////	
////	public Optional<Users> findByMemberId(Integer id);
//	
//
	@Query(value = "SELECT * FROM Users WHERE userId =?1", nativeQuery = true) 
	List<Users> findProductById(@Param("userId") String userId);
	
	@Query(value = "select * from Users where category = 2", nativeQuery = true)
	public List<Users> findAllCharities();
	
	@Query(value = "  select  *　from　[dbo].[Users]Ｕ inner join [dbo].[Orders]Ｏ on O.fk_user_id = U.userId　where U.userId = ?1", nativeQuery = true)
	public List<Users> findAllUsersOrders();
	
	@Query(value = "SELECT * FROM Users WHERE fk_foundation_id =?1", nativeQuery = true) 
	public List<Users> findFoundation(@Param("foundationId") String foundationId);
	
	public List<Users> findByEmail(String email);
	
//	圖表用
	@Query(value = "SELECT COUNT(1) FROM Users WHERE gender = :gender", nativeQuery = true) 
	public Integer gender(@Param("gender") Integer gender);
//
//
//=======
//
//>>>>>>> 20220815_4
}
