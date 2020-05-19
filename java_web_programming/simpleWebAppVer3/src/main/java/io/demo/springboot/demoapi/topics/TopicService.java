package io.demo.springboot.demoapi.topics;

import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

// annotation for Business service or singleton
@Service
public class TopicService {

    // Create Topic, used Arrays.asList to create 3 new topic object in line to act as my Topic objects
    private List<Topic> topics = Arrays.asList(
            new Topic("spring", "Spring Framework", "Spring Framework Description"),
            new Topic("java", "Core Java", "Core Java Description"),
            new Topic("javascript", "Javascript", "Javascript Description")
    );

    public List<Topic> getAllTopic() {
        return topics;
    }
}
