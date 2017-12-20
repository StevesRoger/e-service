package org.code.jarvis.model.core;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.util.SerializationUtils;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by ki.kao on 12/20/2017.
 */
@Entity
@Table(name = "td_entities")
public class Entities extends AbstractEntity implements ICustomer {

    @JsonIgnore
    private byte[] object;
    @JsonProperty("PRODUCT")
    private Product product;
    @JsonProperty("TYPE")
    private EProductType productType;
    @JsonProperty("ENTITIES")
    private Map<String, Object> data;
    @JsonIgnore
    private List<Image> images;


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ent_id")
    @JsonProperty("ID")
    @Override
    public Long getId() {
        return id;
    }

    @Override
    @Transient
    @JsonIgnore
    public String getCode() {
        return code;
    }

    @Override
    @Transient
    @JsonIgnore
    public String getDesc() {
        return desc;
    }

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "pro_id", nullable = false)
    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Enumerated(EnumType.STRING)
    @Column(name = "pro_type")
    public EProductType getProductType() {
        return productType;
    }

    public void setProductType(EProductType productType) {
        this.productType = productType;
    }

    @Column(name = "obj_serializable")
    public byte[] getObject() {
        if (object == null && data != null) {
            object = SerializationUtils.serialize(data);
        }
        return object;
    }

    public void setObject(byte[] object) {
        this.object = object;
    }

    @Transient
    public Map<String, Object> getData() {
        if (data == null && object != null) {
            data = (Map<String, Object>) SerializationUtils.deserialize(object);
        }
        return data;
    }

    public void setData(Map<String, Object> data) {
        this.data = data;
    }

    @Transient
    @JsonIgnore
    public Object getByKey(String key) {
        return data.get(key);
    }

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "td_entities_image", joinColumns = {@JoinColumn(name = "ent_id")},
            inverseJoinColumns = {@JoinColumn(name = "img_id")})
    public List<Image> getImages() {
        return images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }

    @JsonProperty("IMAGES")
    @Transient
    public List<Long> getImageId() {
        List<Long> list = new ArrayList<>();
        if (images != null && !images.isEmpty()) {
            for (Image image : images) {
                list.add(image.getId());
            }
        }
        return list;
    }
}
