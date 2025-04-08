package com.example.DailyAssignment1.config;

import com.example.DailyAssignment1.bean.order.OrderProcessorBean;
import com.example.DailyAssignment1.bean.order.OrderReceiverBean;
import com.example.DailyAssignment1.bean.order.PaymentProcessorBean;
import jakarta.annotation.Nullable;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

@Configuration
public class orderConfig {

    @Bean
    public OrderReceiverBean orderReceiverBean(){
        return new OrderReceiverBean();
    }

    @Bean
    public PaymentProcessorBean paymentProcessorBean(){
        return new PaymentProcessorBean();
    }

    @Bean
    public OrderProcessorBean orderProcessorBean(){
        return new OrderProcessorBean(orderReceiverBean(), paymentProcessorBean());
    }
}
