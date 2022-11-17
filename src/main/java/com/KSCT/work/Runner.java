package com.KSCT.work;

import java.sql.Connection;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

// 연결이 잘되는지 테스트용
// @Slf4j : 객체 생성없이 바로 log.debug() 로그를 찍어볼수 있음
// @Component : 개발자가 직접 작성한 Class를 Bean으로 등록
@Slf4j
@Component
public class Runner implements ApplicationRunner {

	@Autowired
	DataSource dataSource;
	
	@Override
	public void run(ApplicationArguments args) throws Exception{
		Connection connection = dataSource.getConnection();
		log.info("Url : " + connection.getMetaData().getURL());
		log.info("User name : " + connection.getMetaData().getUserName());
	}
}
