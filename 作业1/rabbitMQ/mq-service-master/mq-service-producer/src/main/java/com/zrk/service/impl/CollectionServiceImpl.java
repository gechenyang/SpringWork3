package com.zrk.service.impl;

import com.zrk.bindings.OutputMessageBinding;
import com.zrk.model.CollectionRequest;
import com.zrk.service.CollectionService;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
@EnableBinding(OutputMessageBinding.class)
public class CollectionServiceImpl implements CollectionService{

    @Resource
    private OutputMessageBinding outputMessageBinding;

    /**
     * @param schoolName
     * @param content
     */
    @Override
    public void getCollection(String schoolName, String content) {

        CollectionRequest request = new CollectionRequest();
        request.setSchoolName(schoolName);
        request.setContent(content);

        outputMessageBinding.output().send(MessageBuilder.withPayload(request).setHeader("x-delay", 5000).build());
    }
}
