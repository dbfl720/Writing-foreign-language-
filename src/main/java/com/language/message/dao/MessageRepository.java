package com.language.message.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.language.message.entity.MessageEntity;


@Repository
public interface MessageRepository extends JpaRepository<MessageEntity, Integer>{
	
	
	public List<MessageEntity> findByReceiverId(int receiverId); 
	
	
	public List<MessageEntity> findAllByUserId(int userId);
	
	
	public Optional<MessageEntity> findById(int messageId);
}
