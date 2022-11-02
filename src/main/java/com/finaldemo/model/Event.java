package com.finaldemo.model;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name="Event")
public class Event {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer eventId;
	
	private String eventName;
	
	private String eventDiscription;
	
	private String eventLocation;
	
	private Integer whoCanJoin;
	
	@JsonFormat(pattern = "yyyy/MM/dd", timezone = "Asia/Taipei") // JSON
	@DateTimeFormat(pattern = "yyyy/MM/dd") // SpringMVC
	@Temporal(TemporalType.TIMESTAMP)
	private Date eventDate;
	
	@JsonFormat(pattern = "yyyy/MM/dd", timezone = "Asia/Taipei") // JSON
	@DateTimeFormat(pattern = "yyyy/MM/dd") // SpringMVC
	@Temporal(TemporalType.TIMESTAMP)
	private Date invitationBeginDate;
	
	@JsonFormat(pattern = "yyyy/MM/dd", timezone = "Asia/Taipei") // JSON
	@DateTimeFormat(pattern = "yyyy/MM/dd") // SpringMVC
	@Temporal(TemporalType.TIMESTAMP)
	private Date invitationEndDate;
	
	
	private Integer maxNumPeople;
	
	
	private Integer minNumPeople;
	
	@ManyToOne(fetch = FetchType.EAGER, targetEntity = Users.class)
	@JoinColumn(name = "fk_user_id", referencedColumnName = "userId")
	private Users eventHost;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "event", cascade = CascadeType.ALL)
	private Set<EventApply> eventApply = new LinkedHashSet<EventApply>();
	
	public Event() {
	}

	public Integer getEventId() {
		return eventId;
	}

	public void setEventId(Integer eventId) {
		this.eventId = eventId;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public String getEventDiscription() {
		return eventDiscription;
	}

	public void setEventDiscription(String eventDiscription) {
		this.eventDiscription = eventDiscription;
	}

	public String getEventLocation() {
		return eventLocation;
	}

	public void setEventLocation(String eventLocation) {
		this.eventLocation = eventLocation;
	}

	public Date getEventDate() {
		return eventDate;
	}

	public void setEventDate(Date eventDate) {
		this.eventDate = eventDate;
	}

	public Date getInvitationBeginDate() {
		return invitationBeginDate;
	}

	public void setInvitationBeginDate(Date invitationBeginDate) {
		this.invitationBeginDate = invitationBeginDate;
	}

	public Date getInvitationEndDate() {
		return invitationEndDate;
	}

	public void setInvitationEndDate(Date invitationEndDate) {
		this.invitationEndDate = invitationEndDate;
	}

	public Integer getMaxNumPeople() {
		return maxNumPeople;
	}

	public void setMaxNumPeople(Integer maxNumPeople) {
		this.maxNumPeople = maxNumPeople;
	}

	public Integer getMinNumPeople() {
		return minNumPeople;
	}

	public void setMinNumPeople(Integer minNumPeople) {
		this.minNumPeople = minNumPeople;
	}

	public Users getEventHost() {
		return eventHost;
	}

	public void setEventHost(Users eventHost) {
		this.eventHost = eventHost;
	}

	public Set<EventApply> getEventApply() {
		return eventApply;
	}

	public void setEventApply(Set<EventApply> eventApply) {
		this.eventApply = eventApply;
	}

	public Integer getWhoCanJoin() {
		return whoCanJoin;
	}

	public void setWhoCanJoin(Integer whoCanJoin) {
		this.whoCanJoin = whoCanJoin;
	}

}
