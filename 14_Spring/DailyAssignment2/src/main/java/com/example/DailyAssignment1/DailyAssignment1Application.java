package com.example.DailyAssignment1;

import com.example.DailyAssignment1.bean.order.OrderProperties;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

@SpringBootApplication
@EnableConfigurationProperties(OrderProperties.class)
public class DailyAssignment1Application {

	public static void main(String[] args) {
		SpringApplication.run(DailyAssignment1Application.class, args);
	}

}
