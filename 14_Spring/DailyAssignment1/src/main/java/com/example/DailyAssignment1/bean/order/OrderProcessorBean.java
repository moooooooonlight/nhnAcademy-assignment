package com.example.DailyAssignment1.bean.order;

import com.example.DailyAssignment1.bean.Execute;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class OrderProcessorBean implements Execute {

    private final OrderReceiverBean orderReceiverBean;
    private final PaymentProcessorBean paymentProcessorBean;
    @Override
    public void execute() {
        orderReceiverBean.execute();
        paymentProcessorBean.execute();
    }
}
