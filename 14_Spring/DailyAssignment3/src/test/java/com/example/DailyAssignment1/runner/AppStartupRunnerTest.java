package com.example.DailyAssignment1.runner;

import com.example.DailyAssignment1.bean.cook.ChefBean;
import com.example.DailyAssignment1.bean.deliver.DeliveryServiceBean;
import com.example.DailyAssignment1.bean.order.OrderProcessorBean;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.when;

@SpringBootTest
class AppStartupRunnerTest {

    @Mock
    private OrderProcessorBean orderProcessorBean;
    @Mock
    private ChefBean chefBean;
    @Mock
    private DeliveryServiceBean deliveryServiceBean;

    @Test
    void run() {

    }
}