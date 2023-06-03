package com.language.message;

import org.springframework.web.bind.annotation.RestController;

import com.language.message.bo.MessageBO;
import com.language.user.bo.UserBO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class MessageController {

	   private final MessageBO messageService;
	   private final UserBO userBO;
	
	   
}
