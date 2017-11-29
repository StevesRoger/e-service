package org.code.jarvis.component;

import com.fasterxml.jackson.core.JsonProcessingException;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * Created by ki.kao on 9/26/2017.
 */
@Component
public class FCMNotification {

    private final Logger log = LoggerFactory.getLogger(FCMNotification.class);

    @Autowired
    private HttpHeaders httpHeaders;

    @Autowired
    private String fcmUrl;


    public <T> String pushNotification(String message, String type, int action, T data) throws JsonProcessingException {
        log.info("======>>>> Push notification to client");
        List<T> list = new ArrayList();
        if (data != null) {
            if (data instanceof List)
                list.addAll((Collection<? extends T>) data);
            else
                list.add(data);
        }
        RestTemplate restTemplate = new RestTemplate();
        JSONObject json = new JSONObject();
        json.put("title", "V-Printing");
        json.put("message", message);
        json.put("type", type);
        json.put("action", action);
        json.put("data", list);

        log.info("======>>>> " + json.toString());

        JSONObject body = new JSONObject();
        body.put("to", "/topics/V-Printing");
        body.put("data", json);

        String response = restTemplate.postForObject(fcmUrl, new HttpEntity(json.toString(), httpHeaders), String.class);
        log.info("======>>>> Push Notification FCM:" + response);
        return response;
    }
}
