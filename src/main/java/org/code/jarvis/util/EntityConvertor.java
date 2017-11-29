package org.code.jarvis.util;

import org.code.jarvis.model.core.Advertisement;
import org.code.jarvis.service.EntityService;
import org.json.JSONObject;

import java.util.*;

/**
 * Created by ki.kao on 9/5/2017.
 */
public final class EntityConvertor {


    public static List<Map<String, Object>> getAdvertisement(List<Advertisement>list) {
        List<Map<String, Object>> response = new ArrayList<>();
        for (Advertisement advertisement : list) {
            Map<String, Object> json = new HashMap();
            json.put("ID", advertisement.getId());
            json.put("IMAGE", advertisement.getImage().getId());
            response.add(json);
        }
        Collections.shuffle(response);
        return response;
    }
}
