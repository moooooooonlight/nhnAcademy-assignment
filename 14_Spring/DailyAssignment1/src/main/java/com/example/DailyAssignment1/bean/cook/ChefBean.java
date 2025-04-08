package com.example.DailyAssignment1.bean.cook;

import com.example.DailyAssignment1.bean.Execute;
import org.springframework.stereotype.Component;

@Component
public class ChefBean implements Execute {
    @Override
    public void execute() {
        System.out.println("cook!");
    }
}
