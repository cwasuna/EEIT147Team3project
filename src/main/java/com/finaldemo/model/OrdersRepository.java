package com.finaldemo.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface OrdersRepository extends JpaRepository<Orders, Integer>{
	
	// 此為小郭寫的亂刪砍手 "Select * from Orders where fk_user_id = :id"
    @Query(value = "select * from [dbo].[Users] U inner join [dbo].[Orders]O on O.fk_user_id =U.userId inner join [dbo].[OrderDetail] OD on OD.fk_order_id =O.orderId inner join [dbo].[Products]P on P.productId = OD.fk_product_id inner join [dbo].[Foundation] F on F.foundationId = P.fk_foundation_id where F.foundationId= :id", nativeQuery = true)
    public List<Orders> findOrdersByUserId(@Param("id") Integer userId);
   
    //取得每月總額
    @Query(value = "SELECT SUM(orderPrice) FROM Orders GROUP BY DATEPART(MONTH ,CONVERT(varchar(100),orderDate, 111))", nativeQuery = true)
    public List<Integer> findOrdersBySumMoney();
    
    //取得月份
    @Query(value = "SELECT DISTINCT CONVERT(varchar(7), orderDate, 126) FROM Orders", nativeQuery = true)
    public List<String> findOrdersByMonth();
    
    @Query(value = "SELECT * FROM [dbo].[Users]U inner join [dbo].[Orders]O on O.fk_user_id = U.userId  WHERE U.userId = ?1" ,nativeQuery = true)
	public List<Orders> findUsersOrders(@Param("userId") String fk_user_id);
    
}


