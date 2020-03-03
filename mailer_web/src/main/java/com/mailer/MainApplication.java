package com.mailer;

import com.mailer.service.ServiceProperties;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

@SpringBootApplication(scanBasePackages = "com.mailer")
@EnableConfigurationProperties( {ServiceProperties.class, DataAccessProperties.class})
public class MainApplication {


	public static void main(String[] args) {
		
		SpringApplication.run(MainApplication.class, args);
			
	}

}
