package com.example.DailyAssignment1.bean.order;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Getter
@Setter
@Component
@ConfigurationProperties("orders")
public class OrderProperties {
    private String payment;
    private String receiver;
    private String deliver;
}
