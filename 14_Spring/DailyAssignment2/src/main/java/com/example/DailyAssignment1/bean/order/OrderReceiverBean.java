package com.example.DailyAssignment1.bean.order;

import com.example.DailyAssignment1.bean.Execute;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;

public class OrderReceiverBean implements Execute {

    @Autowired
    private OrderProperties orderProperties;
    @Override
    public void execute() {
        System.out.println(orderProperties.getReceiver());
    }
}
