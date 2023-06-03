package com.language.message.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.UpdateTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;


@ToString // 객체 예쁘게 출력
@Getter
@AllArgsConstructor // 모든 값이 있는 생성자
@NoArgsConstructor // 기본 생성자
@Builder(toBuilder = true) // 수정 시 기존 객체 그대로, 세팅한 값만 변경
@Table(name = "message") //엔티티와 매핑할 테이블을 지정.
@Entity
public class MessageEntity {
		@Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private int id;
		
		@Column(name="userId") // naems - 객체 필드를 테이블의 컬럼에 매핑시켜주는 어노테이션
		private int userId;
		
		@Column(name="receiverId")
		private Integer receiverId;

	    
	    private String title;

	   
	    private String content;

	    @UpdateTimestamp
		@Column(name="createdAt", updatable = false)
		private Date createdAt;
		
		@UpdateTimestamp
		@Column(name="updatedAt")
		private Date updatedAt;
	    
		
}
