package com.example.demo.entity;

import java.time.LocalDate;
import java.time.LocalTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.Data;

@Data
@Entity
@Table(name = "health")
public class Health {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "player_health_id")
	private Integer playerHealthId;

	@Column(name = "wakeup_time")
	private LocalTime wakeupTime;

	@Column(name = "bedtime_time")
	private LocalTime bedtimeTime;

	@Column(name = "breakfast_id")
	private Integer breakfastId;

	@Column(name = "lunch_id")
	private Integer lunchId;

	@Column(name = "dinner_id")
	private Integer dinnerId;

	@Transient
	private String breakfastName;
	
	@Transient
	private Integer breakfastCalory;
	
	@Transient
	private String lunchName;
	
	@Transient
	private Integer lunchCalory;
	
	@Transient
	private String dinnerName;
	
	@Transient
	private Integer dinnerCalory;

	@Column(name = "eat_date")
	private LocalDate eatDate;

	public Health() {

	}

	public Health(Integer playerHealthId, LocalTime wakeupTime, LocalTime bedtimeTime, Integer breakfastId,
			Integer lunchId, Integer dinnerId, LocalDate eatDate) {
		this.playerHealthId = playerHealthId;
		this.wakeupTime = wakeupTime;
		this.bedtimeTime = bedtimeTime;
		this.breakfastId = breakfastId;
		this.lunchId = lunchId;
		this.dinnerId = dinnerId;
		this.eatDate = eatDate;

	}

}
