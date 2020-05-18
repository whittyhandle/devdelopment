package io.demo.springboot.demoapi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

// annotation tell spring boot this is the starting point for the applicaton
@SpringBootApplication
// scans the parent
// needed because HelloContoller is in a new packager
@ComponentScan(basePackages="io.demo")
public class DemoApiApplication {

    public static void main(String[] args) {
        // spring boot method to start app, create servlet, host, and make it available
        // takes in two arguments, the class with the main method, any arguments passed to main method
        // this is a basic spring boot app, it does not do anything right now http://localhost:8080/
        SpringApplication.run(DemoApiApplication.class, args);
    }
}
