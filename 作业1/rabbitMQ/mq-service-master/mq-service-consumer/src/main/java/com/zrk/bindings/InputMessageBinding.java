package com.zrk.bindings;

import org.springframework.cloud.stream.annotation.Input;
import org.springframework.messaging.SubscribableChannel;

/**
 * @Description: 定义绑定(即消息发布者/订阅者)
 */
public interface InputMessageBinding {

    String INPUT = "message-center-input";

    @Input(INPUT)
    SubscribableChannel input();
}
