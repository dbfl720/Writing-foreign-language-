package com.language.userJPA.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@ToString // 객체 예쁘게 출력
@Data // 
@NoArgsConstructor // 기본 생성자
@AllArgsConstructor // 모든 값이 있는 생성자
@Table(name = "user")
@Entity
public class UserEntity {

	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY) // MYSQL auto_increment
	    private int id;

	    @Column(nullable = false)
	    private String nativeCategoryId;
	    
	    @Column(nullable = false)
		private String foreignCategoryId;
	    
	    @Column(nullable = false, unique = true)
	    private String loginId;

	    @JsonIgnore // 데이터를 주고 받을때 해당 데이터는 결과창에서 응답값이 보이지 않게 한다.
	    @Column(nullable = false) //엔티티 필드의 null을 검증하기 위해
	    private String password;
	    
	    @JsonIgnore 
	    @Column(nullable = false)
	    private String salt;
	    
	  
		private String email;
		
		@Column(nullable = false)
		private String selfIntroduction;
		
		@Column(nullable = false)
		private String languageGoals;
		
		@Column(nullable = false)
		private String ImagePath;
	    
	    
	    @UpdateTimestamp
		@Column(name="createdAt", updatable = false)
		private Date createdAt;
		
		@UpdateTimestamp
		@Column(name="updatedAt")
		private Date updatedAt;

}
