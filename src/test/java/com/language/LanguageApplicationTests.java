package com.language;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
// import org.mybatis.logging.LoggerFactory; - 사용 불가. 
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class LanguageApplicationTests {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//@Test
	void contextLoads() {
	}
	
	@Test
	void 더하기테스트() {
		logger.info("####### 더하기 테스트 #########");
		int a = 10;
		int b = 20;
		assertEquals(20, sum(a, b));
		
	}
	
	int sum(int x, int y) {
		return x + y;
	}

}
