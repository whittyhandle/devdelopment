package io.demo.springboot.demoapi.topics;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Array;
import java.util.Arrays;
import java.util.List;

@RestController
public class TopicController {
    @RequestMapping(method = RequestMethod.GET, value = "/topics", produces = "application/json")
    public List<Topic> getAllTopics() {
        // Create Topic, used Arrays.asList to create 3 new topic object in line to act as my Topic objects
        return Arrays.asList(
                new Topic("spring", "Spring Framework", "Spring Framework Description"),
                new Topic("java", "Core Java", "Core Java Description"),
                new Topic("javascript", "Javascript", "Javascript Description")
        );
    }
}
