package com.fw.s1;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class FwccApplication {

	public static void main(String[] args) {
		SpringApplication.run(FwccApplication.class, args);
	}

}
