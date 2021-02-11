package com.codingdojo.Amukan;

import org.apache.catalina.connector.Connector;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class AmukanApplication {

	public static void main(String[] args) {
		SpringApplication.run(AmukanApplication.class, args);
	}
	

}
