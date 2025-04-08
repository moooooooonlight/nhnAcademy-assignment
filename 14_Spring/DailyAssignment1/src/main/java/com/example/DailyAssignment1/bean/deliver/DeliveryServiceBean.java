package com.example.DailyAssignment1.bean.deliver;

import com.example.DailyAssignment1.bean.Execute;
import org.springframework.stereotype.Component;

@Component
public class DeliveryServiceBean implements Execute {
    @Override
    public void execute() {
        System.out.println("deliver!");
    }
}
