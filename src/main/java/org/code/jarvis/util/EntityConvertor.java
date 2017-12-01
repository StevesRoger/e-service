package org.code.jarvis.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.code.jarvis.model.core.Advertisement;
import org.code.jarvis.model.core.Product;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * Created by ki.kao on 9/5/2017.
 */
public final class EntityConvertor {

    private static final ObjectMapper mapper = new ObjectMapper();

    public static List<String> getAdvertisement(Advertisement advertisement) throws JsonProcessingException {
        return getAdvertisement(new ArrayList(Arrays.asList(new Advertisement[]{advertisement})));
    }

    public static List<String> getAdvertisement(List<Advertisement> advertisements) throws JsonProcessingException {
        List<String> list = new ArrayList<>();
        for (Advertisement advertisement : advertisements) {
            advertisement.setImageId(advertisement.getImage());
            advertisement.setImage(null);
            list.add(mapper.writeValueAsString(advertisement));
        }
        Collections.shuffle(list);
        return list;
    }

    public static List<String> getProduct(Product product) throws JsonProcessingException {
        return getProduct(new ArrayList(Arrays.asList(new Product[]{product})));
    }

    public static List<String> getProduct(List<Product> products) throws JsonProcessingException {
        List<String> list = new ArrayList<>();
        for (Product product : products) {
            product.setImageIds(product.getImages());
            product.setImages(null);
            list.add(mapper.writeValueAsString(product));
        }
        Collections.shuffle(list);
        return list;
    }
}
