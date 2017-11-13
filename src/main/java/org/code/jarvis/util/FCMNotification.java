package org.code.jarvis.util;

import org.code.jarvis.component.ApplicationContextProvider;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * Created by KimChheng on 10/30/2017.
 */
public final class FCMNotification {

    private static final Environment environment = ApplicationContextProvider.getContext().getEnvironment();
    private static final Logger log = LoggerFactory.getLogger(FCMNotification.class);

    public static void pushNotification(String type, int action, Object data) {
        try {
            log.info("======>>>> Push notifcation to client");
            String fcmServerKey = environment.getProperty("fcm.server.key");
            String url = "https://fcm.googleapis.com/fcm/send";

            List<Object> list = new ArrayList();
            if (data instanceof ArrayList) {
                list.addAll((Collection<?>) data);
            } else {
                list.add(data);
            }

            RestTemplate restTemplate = new RestTemplate();
            HttpHeaders httpHeaders = new HttpHeaders();
            httpHeaders.set("Authorization", "key=" + fcmServerKey);
            httpHeaders.set("Content-Type", "application/json");

            JSONObject body = new JSONObject();
            JSONObject message = new JSONObject();

            body.put("to", "/topics/V-Printing");

            message.put("title", "V-Printing");
            message.put("body", "New Advertisement");
            message.put("type", type);
            message.put("action", action);
            message.put("data", list);

            body.put("data", message);

            HttpEntity<String> httpEntity = new HttpEntity(body.toString(), httpHeaders);
            String response = restTemplate.postForObject(url, httpEntity, String.class);
            log.info("======>>>> Push Notification FCM:" + response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
