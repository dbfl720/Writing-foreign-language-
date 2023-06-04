package com.language.message.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.language.message.entity.MessageEntity;
import com.language.user.model.User;


@Repository
public interface MessageRepository extends JpaRepository<MessageEntity, Integer>{
	
	
	public List<MessageEntity> findByReceiverId(int receiverId); 
	
}
