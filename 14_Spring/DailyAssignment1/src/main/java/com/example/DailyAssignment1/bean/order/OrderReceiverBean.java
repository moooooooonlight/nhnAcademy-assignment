package com.example.DailyAssignment1.bean.order;

import com.example.DailyAssignment1.bean.Execute;

public class OrderReceiverBean implements Execute {
    @Override
    public void execute() {
        System.out.println("order Receive!");
    }
}
