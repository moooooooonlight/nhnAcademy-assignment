package com.example.DailyAssignment1.bean.order;

import com.example.DailyAssignment1.bean.Execute;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.context.properties.ConfigurationProperties;

@RequiredArgsConstructor
@Getter
@ConfigurationProperties("order")
@ConditionalOnBean({OrderReceiverBean.class, PaymentProcessorBean.class})
public class OrderProcessorBean implements Execute {

    private final OrderReceiverBean orderReceiverBean;
    private final PaymentProcessorBean paymentProcessorBean;
    @Override
    public void execute() {
        orderReceiverBean.execute();
        paymentProcessorBean.execute();
    }
}
