package com.language.userJPA.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.language.user.model.User;
import com.language.userJPA.entity.UserEntity;

public interface UserRepository extends JpaRepository<User, Integer>{

			UserEntity findByLoginId(String loginId);
}
