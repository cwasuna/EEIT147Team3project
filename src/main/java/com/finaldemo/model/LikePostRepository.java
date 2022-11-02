package com.finaldemo.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface LikePostRepository extends JpaRepository<LikePost, Integer> {

	@Query(value="Select * from LikePost where fk_user_id = :userId and fk_post_id = :postId", nativeQuery = true)
	public LikePost findLikedPost(@Param("userId") Integer userId, @Param("postId") Integer postId);
	
	@Query(value="Select * from LikePost where fk_post_id = :postId", nativeQuery = true)
	public List<LikePost> findLikedPostByPostId(@Param("postId") Integer postId);
}
