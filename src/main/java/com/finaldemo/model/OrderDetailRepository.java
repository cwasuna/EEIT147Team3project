package com.finaldemo.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public interface OrderDetailRepository extends JpaRepository<OrderDetail, Integer> {
	
	@Query(value = "select\r\n"
			+ "          * \r\n"
			+ "from [dbo].[Orders]O inner join [dbo].[OrderDetail]OD on OD.fk_order_id = O.orderId\r\n"
			+ "inner join [dbo].[Products]P on OD.fk_product_id = P.productId\r\n"
			+ "inner join [dbo].[Foundation]F on P.fk_foundation_id =F.foundationId\r\n"
			+ "inner join [dbo].[Users]U on F.foundationId = U.fk_foundation_id\r\n"
			+ "\r\n"
			+ "\r\n"
			+ "\r\n"
			+ "\r\n"
			+ "where O.orderId = ?1;", nativeQuery = true)
	public List<Orders> findAllOrder(@Param("id") Integer orderId);	

}
