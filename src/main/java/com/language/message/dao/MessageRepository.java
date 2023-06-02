package com.language.message.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.language.message.entity.MessageEntity;
import com.language.userJPA.entity.UserEntity;



public interface MessageRepository extends JpaRepository<MessageEntity, Integer>{
	
		List<MessageEntity> findAllByReceiver(UserEntity userEntity);
	    List<MessageEntity> findAllBySender(UserEntity userEntity);
}
