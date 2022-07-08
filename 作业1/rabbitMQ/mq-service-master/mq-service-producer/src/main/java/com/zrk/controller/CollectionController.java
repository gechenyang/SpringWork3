package com.zrk.controller;

import com.zrk.service.CollectionService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("collection")
public class CollectionController {

    @Resource
    private CollectionService collectionService;

    @GetMapping("getCollection")
    public String getCollection(@RequestParam("schoolName") String schoolName,@RequestParam("content") String content){

        collectionService.getCollection(schoolName,content);

        return "success";
    }

}
