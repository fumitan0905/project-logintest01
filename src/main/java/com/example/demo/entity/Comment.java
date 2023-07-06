package com.example.demo.entity;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name="comments")
public class Comment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String title;
	private String mail;
	private String content;
	private final static DateTimeFormatter FMT
	= DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
	
	@Column(name="createdat")
	private LocalDateTime createdAt;

	public Comment() {

	}

	public Comment(String title, String mail, String content) {
		this.title = title;
		this.content = content;
		this.mail = mail;
		this.createdAt = LocalDateTime.now();
	}

	public String getCreatedAt() {
		return createdAt.format(FMT);
	}
}
