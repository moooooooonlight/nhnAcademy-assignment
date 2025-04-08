package com.example.DailyAssignment1.bean.order;

import com.example.DailyAssignment1.bean.Execute;
import com.example.DailyAssignment1.properties.OrderProperties;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;


@Slf4j
public class PaymentProcessorBean implements Execute {

    @Autowired
    private OrderProperties orderProperties;

    @Override
    public void execute() {
        log.info(orderProperties.getPayment());
    }
}
