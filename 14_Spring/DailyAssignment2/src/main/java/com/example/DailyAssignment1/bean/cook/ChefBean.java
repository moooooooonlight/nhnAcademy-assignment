package com.example.DailyAssignment1.bean.cook;

import com.example.DailyAssignment1.bean.Execute;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class ChefBean implements Execute {

    @Value("${orders.cook}")
    private String chefBeanStr;

    @Override
    public void execute() {
        System.out.println(chefBeanStr);
    }
}
