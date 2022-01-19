package com.newrelic.virtuoso.restapi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@SpringBootApplication
@EnableScheduling
@RestController
public class RestApiApplication extends SpringBootServletInitializer {

    //bootRun
    public static void main(String[] args) {
        SpringApplication.run(RestApiApplication.class, args);
    }

    //war
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(RestApiApplication.class);
    }

    @Scheduled(fixedRate = 10000)
    @GetMapping(value = "/hello", produces = "application/json")
    public Map<String, ?> hello() {
        return new HashMap<String, String>() {{
            put("message", "Hello! I'm a GET endpoint");
            put("timestamp", new Date().toString());
        }};
    }

}
