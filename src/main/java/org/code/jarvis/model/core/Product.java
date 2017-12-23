package org.code.jarvis.model.core;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by KimChheng on 5/9/2017.
 */
@Entity
@Table(name = "td_product")
@JsonPropertyOrder({"ID", "CODE", "SIZE", "PRICE", "COLOR", "CONTACT"})
public class Product extends AbstractEntity {

    @JsonProperty("COLOR")
    private String color;
    @JsonProperty("SIZE")
    private String size;
    @JsonProperty("PRICE")
    private String price;
    @JsonProperty("CONTACT")
    private ProductContact contact;
    @JsonProperty("TYPE")
    private EProductType productType;
    @JsonIgnore
    private List<Image> images;
    @JsonProperty("IMAGES")
    private List<Long> imageIds = new ArrayList<>();

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "pro_id")
    @JsonProperty("ID")
    @Override
    public Long getId() {
        return id;
    }

    @Column(name = "pro_code")
    @JsonProperty("CODE")
    @Override
    public String getCode() {
        return code;
    }

    @Column(name = "pro_desc")
    @JsonIgnore
    @Override
    public String getDesc() {
        return null;
    }

    @Column(name = "pro_color")
    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    @Column(name = "pro_size", nullable = false)
    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    @Column(name = "pro_price", nullable = false)
    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    @OneToOne(fetch = FetchType.EAGER, mappedBy = "product", cascade = CascadeType.ALL)
    public ProductContact getContact() {
        return contact;
    }

    public void setContact(ProductContact contact) {
        this.contact = contact;
    }

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "td_product_image", joinColumns = {@JoinColumn(name = "pro_id")},
            inverseJoinColumns = {@JoinColumn(name = "img_id")})
    public List<Image> getImages() {
        return images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }

    @Enumerated(EnumType.STRING)
    @Column(name = "pro_type")
    public EProductType getProductType() {
        return productType;
    }

    public void setProductType(EProductType productType) {
        this.productType = productType;
    }

    @Transient
    public List<Long> getImageIds() {
        if (images != null && !images.isEmpty()) {
            for (Image image : images) {
                imageIds.add(image.getId());
            }
        }
        return imageIds;
    }

    public void setImageIds(List<Image> images) {
        if (images != null) {
            for (Image image : images)
                imageIds.add(image.getId());
        }
    }

    @JsonProperty("TYPE")
    @Transient
    public String getType() {
        return productType.code;
    }

}
