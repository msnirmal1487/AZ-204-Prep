package com.msnirmal.azurespringworkshop;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

//@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })
@SpringBootApplication
public class AzureSpringWorkshopApplication {

	public static void main(String[] args) {
		SpringApplication.run(AzureSpringWorkshopApplication.class, args);
	}

}
