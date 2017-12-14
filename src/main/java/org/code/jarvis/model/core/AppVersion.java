package org.code.jarvis.model.core;

import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;

/**
 * Created by ki.kao on 12/8/2017.
 */
@Entity
@Table(name = "td_app_detail")
public class AppVersion extends AbstractEntity {

    private String version;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "app_id")
    @JsonProperty("APP_ID")
    @Override
    public Long getId() {
        return id;
    }

    @Column(name = "app_code")
    @JsonProperty("APP_CODE")
    @Override
    public String getCode() {
        return code;
    }

    @Column(name = "app_des")
    @JsonProperty("APP_DESC")
    @Override
    public String getDesc() {
        return desc;
    }

    @Column(name = "app_version")
    @JsonProperty("APP_VERSION")
    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }
}
