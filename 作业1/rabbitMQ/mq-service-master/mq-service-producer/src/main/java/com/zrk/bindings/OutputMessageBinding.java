package com.zrk.bindings;

import org.springframework.cloud.stream.annotation.Output;
import org.springframework.messaging.MessageChannel;

public interface OutputMessageBinding {

    /**
     * Topic 名称
     */
    String OUTPUT = "message-center-out";

    @Output(OUTPUT)
    MessageChannel output();

}
