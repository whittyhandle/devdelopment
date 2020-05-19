package io.demo.springboot.demoapi.topics;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Array;
import java.util.Arrays;
import java.util.List;

@RestController
public class TopicController {

    // annotation to declare the dependency, makes topic service available.
    @Autowired
    // create an instance of a service or singleton
    private TopicService topicService;


    @RequestMapping(method = RequestMethod.GET, value = "/topics", produces = "application/json")
    public List<Topic> getAllTopics() {

        return
    }
}
