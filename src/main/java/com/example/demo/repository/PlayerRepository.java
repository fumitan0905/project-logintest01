package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entity.Player;

public interface PlayerRepository extends JpaRepository<Player,Integer>{
//	Optional<Player> findByPlayerHealthId(Integer playerHealthId);
	
	List<Player> findByOrderById();
}
