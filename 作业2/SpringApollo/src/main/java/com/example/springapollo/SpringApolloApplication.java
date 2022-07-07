package com.example.springapollo;

import com.ctrip.framework.apollo.Config;
import com.ctrip.framework.apollo.ConfigService;
import com.ctrip.framework.apollo.spring.annotation.ApolloConfig;
import com.ctrip.framework.apollo.spring.annotation.EnableApolloConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@EnableApolloConfig //启动apollo配置注解
public class SpringApolloApplication {
    @ApolloConfig("appnamespace") //指定具体的namespace
    private static Config configSwitch;

    public static void main(String[] args) {
        SpringApplication.run(SpringApolloApplication.class, args);

        //获取方式一
        Config appConfig = ConfigService.getAppConfig(); //默认的namespace是application
        String password = appConfig.getProperty("username", "");
        System.out.println("姓名:"+password);

        //获取方式二  直接指定namespace
        Config appnamespace = ConfigService.getConfig("config");
        String unionpayflag1 = appnamespace.getProperty("password", "");
        System.out.println("密码:"+unionpayflag1);

    }
}
