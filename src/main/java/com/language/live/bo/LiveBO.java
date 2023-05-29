package com.language.live.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.language.common.FileManagerService;
import com.language.live.dao.LiveMapper;

@Service
public class LiveBO {

	
	
	@Autowired
	private LiveMapper liveMapper;
	
	@Autowired
	private FileManagerService fileManager;
	
	// insert
	public int addLive(
			int userId,
			String content,
			MultipartFile file) {
		
		
		String ImagePath = null;
		if (file != null) {
			ImagePath = fileManager.saveFile(ImagePath, file);
		}
		
		return liveMapper.insertLive(userId, content, ImagePath);
	}
	
	
}
