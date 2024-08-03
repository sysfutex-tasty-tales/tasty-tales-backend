package com.github.sysfutextastytales.tastytalesbackend;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@SpringBootApplication(exclude = {SecurityAutoConfiguration.class}) // TODO
public class TastyTalesBackendApplication {
    public static void main(String[] args) {
        SpringApplication.run(TastyTalesBackendApplication.class, args);
    }
}
