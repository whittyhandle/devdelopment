package io.demo.springboot.demoapi.hello;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

// annotation for a rest controller
@RestController
public class HelloController {

    // annotation for request mappings takes in a parameter for the mapping
    // this is only good for a GET
    // spring scans and adds automatically
    @RequestMapping(method = RequestMethod.GET, value = "/hello", produces = "text/html")
//    public ResponseEntity<String> hello() {
//        System.out.println("Odin");
//        return new ResponseEntity<String>("Hello, you!", HttpStatus.OK);
//    }

    public String sayHi(){
        return "Hi";
    }
}
