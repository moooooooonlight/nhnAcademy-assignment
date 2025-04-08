package com.example.DailyAssignment1.bean.order;

import com.example.DailyAssignment1.bean.Execute;

public class PaymentProcessorBean implements Execute {
    @Override
    public void execute() {
        System.out.println("process payment!");
    }
}
