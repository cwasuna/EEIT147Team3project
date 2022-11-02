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
public interface PostImgRepository extends JpaRepository<PostImg, Integer> {

	@Transactional
	@Modifying
	@Query(value = "insert into PostImg (fk_post_id, postImgPath) values (:fk_post_id, :postImgPath)", nativeQuery = true)
	public void addPostImgs(@Param("fk_post_id") Integer fk_post_id, @Param("postImgPath") String postImgPath);
	
	@Query(value = "select * from PostImg where fk_post_id = :fk_post_id", nativeQuery = true)
	public List<PostImg> findPostImgsByPostId(@Param("fk_post_id") Integer postId);
	
	@Transactional
	@Modifying
	@Query(value = "delete from PostImg where fk_post_id = :postId", nativeQuery = true)
	public void deleteImgByPostId(@Param("postId") Integer postId);
	
	@Query(value = "select * from PostImg  where fk_post_id = :postId order by postImgId Desc", nativeQuery = true)
	public List<PostImg> findByFk_post_idOrderByPostImgIdDesc(@Param("postId") Integer postId);
}
