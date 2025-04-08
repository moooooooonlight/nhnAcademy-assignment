package com.example.DailyAssignment1.bean.deliver;

import com.example.DailyAssignment1.bean.Execute;
import com.example.DailyAssignment1.bean.cook.ChefBean;
import com.example.DailyAssignment1.bean.order.OrderProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConditionalOnBean(ChefBean.class)
public class DeliveryServiceBean implements Execute {

    @Autowired
    private OrderProperties orderProperties;
    @Override
    public void execute() {
        System.out.println(orderProperties.getDeliver());
    }

}
