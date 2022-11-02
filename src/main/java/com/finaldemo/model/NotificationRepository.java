package com.finaldemo.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface NotificationRepository extends JpaRepository<Notification, Integer> {

	@Query(value="Select * from Notification where fk_user_id = :id", nativeQuery = true)
	public List<Notification> findNotificationByUserId(@Param("id") Integer userId);
}
