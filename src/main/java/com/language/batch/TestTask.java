package com.language.batch;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component 
public class TestTask { // 쪼개진 업무 Task < Job

	@Scheduled(cron="0 */1 * * * *") // 시간 지정. -1분마다 0분에 계속 수행을 할꺼다.   crontab 시간 설정 검색. 
	public void testTask() {
		// job 내용
		
	}
}
