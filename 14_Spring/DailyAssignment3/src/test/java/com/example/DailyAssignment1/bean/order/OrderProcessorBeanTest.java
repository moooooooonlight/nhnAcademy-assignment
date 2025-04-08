package com.example.DailyAssignment1.bean.order;

import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

@SpringBootTest
class OrderProcessorBeanTest {

    @Mock
    OrderReceiverBean orderReceiverBean;
    @Mock
    PaymentProcessorBean paymentProcessorBean;

    @InjectMocks
    private OrderProcessorBean orderProcessorBean;

    @Test
    void execute() {
        orderProcessorBean.execute();

        doNothing().when(orderReceiverBean).execute();
        doNothing().when(paymentProcessorBean).execute();

        verify(orderReceiverBean,times(1)).execute();
        verify(paymentProcessorBean,times(1)).execute();
    }
}