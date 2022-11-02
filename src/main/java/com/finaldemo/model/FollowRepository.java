package com.finaldemo.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface FollowRepository extends JpaRepository<Follow, Integer> {
	
	@Query(value = "delete from Follow where fk_user_fans_id = :fansId and fk_user_follow_id = :followId", nativeQuery = true)
	@Modifying
	public void deleteFollowByFansIdAndFollowsId(@Param("fansId") Integer fansId, @Param("followId") Integer followId);
	
	@Query(value="select fk_user_fans_id from Follow where fk_user_follow_id = :fanId", nativeQuery = true)
	public List<Integer> findUpId(@Param("fanId") Integer fanId);
	
	@Query(value="select fk_user_follow_id from Follow where fk_user_fans_id = :upId", nativeQuery = true)
	public List<Integer> findfans(@Param("upId") Integer upId);
	
}
