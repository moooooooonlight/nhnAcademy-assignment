package com.example.DailyAssignment1.runner;

import com.example.DailyAssignment1.bean.cook.ChefBean;
import com.example.DailyAssignment1.bean.deliver.DeliveryServiceBean;
import com.example.DailyAssignment1.bean.order.OrderProcessorBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
public class AppStartupRunner implements ApplicationRunner {

    @Autowired
    private OrderProcessorBean orderProcessorBean;
    private ChefBean chefBean;
    private DeliveryServiceBean deliveryServiceBean;

    @Autowired
    public void setChefBean(ChefBean chefBean) {
        this.chefBean = chefBean;
    }

    @Autowired
    public void setDeliveryServiceBean(DeliveryServiceBean deliveryServiceBean) {
        this.deliveryServiceBean = deliveryServiceBean;
    }

    @Override
    public void run(ApplicationArguments args) throws Exception {
        orderProcessorBean.execute();
        chefBean.execute();
        deliveryServiceBean.execute();
    }
}
