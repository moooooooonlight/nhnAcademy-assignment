package com.example.DailyAssignment1.bean.cook;

import com.example.DailyAssignment1.bean.Execute;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class ChefBean implements Execute {

    @Value("${orders.cook}")
    private String chefBeanStr;

    @Override
    public void execute() {
        log.info(chefBeanStr);
    }
}
