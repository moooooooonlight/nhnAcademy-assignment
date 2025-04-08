package com.example.DailyAssignment1.bean.deliver;

import com.example.DailyAssignment1.bean.Execute;
import com.example.DailyAssignment1.bean.cook.ChefBean;
import com.example.DailyAssignment1.properties.OrderProperties;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.stereotype.Component;

@Slf4j
@Component
@ConditionalOnBean(ChefBean.class)
public class DeliveryServiceBean implements Execute {

    @Autowired
    private OrderProperties orderProperties;
    @Override
    public void execute() {
        log.info(orderProperties.getDeliver());
    }

}
