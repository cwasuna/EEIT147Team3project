package com.finaldemo.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface FoundationRepository extends JpaRepository<Foundation, Integer> {

	@Query(value = "SELECT * FROM Products P INNER JOIN Foundation F ON F.foundationId = P.fk_foundation_Id INNER JOIN Users U ON U.fk_foundation_id = F.foundationId WHERE F.foundationId =?1 ORDER BY P.productId asc", nativeQuery = true)
	public List<Foundation> findAllFoundationProducts(@Param("foundationId") String foundationId);	
}
