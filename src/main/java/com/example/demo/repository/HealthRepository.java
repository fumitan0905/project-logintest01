package com.example.demo.repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.entity.Health;

public interface HealthRepository extends JpaRepository<Health, Integer> {
	
	List<Health> findByPlayerHealthId(Integer playerHealthId);
	
	@Query(value = "SELECT id, player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date FROM health WHERE id >= ?1", nativeQuery = true)
	List<Health> findAllWhereId(Integer Id);

	List<Health> findByEatDateOrderByIdAsc(LocalDate eatDate);

	Optional<Health> findByPlayerHealthIdAndEatDate(Integer playerHealthId, LocalDate eatDate);

	Optional<Health> findByEatDateAndPlayerHealthId(LocalDate eatDate, Integer playerHealthId);
	
//	Optional<Health> findByPlayerHealthId(Integer playerHealthId);
//
//	@Query(value = "SELECT id, player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date FROM health WHERE id >= ?1", nativeQuery = true)
//	List<Health> findAllWhereId(Integer Id);
//
//	List<Health> findByEatDateOrderByIdAsc(LocalDate eatDate);
//	Optional<Health> findByPlayerHealthIdAndEatDate(Integer playerHealthId, LocalDate eatDate);
//
//	Optional<Health> findByEatDateAndPlayerHealthId(LocalDate eatDate, Integer playerHealthId);
	
}
