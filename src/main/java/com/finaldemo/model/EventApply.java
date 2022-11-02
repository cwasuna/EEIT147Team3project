package com.finaldemo.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="EventApply")
public class EventApply {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer eventApplyId;
	
	@ManyToOne(fetch = FetchType.EAGER, targetEntity = Event.class)
	@JoinColumn(name = "fk_event_id", referencedColumnName = "eventId")
	private Event event;
	
	@ManyToOne(fetch = FetchType.EAGER, targetEntity = Users.class)
	@JoinColumn(name = "fk_user_id", referencedColumnName = "userId")
	private Users joinUser;
	
	public EventApply() {
	}

	public Integer getEventApplyId() {
		return eventApplyId;
	}

	public void setEventApplyId(Integer eventApplyId) {
		this.eventApplyId = eventApplyId;
	}

	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	public Users getJoinUser() {
		return joinUser;
	}

	public void setJoinUser(Users joinUser) {
		this.joinUser = joinUser;
	}
	
	
}
