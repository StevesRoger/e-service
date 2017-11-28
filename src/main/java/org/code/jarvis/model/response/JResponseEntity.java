package org.code.jarvis.model.response;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import org.springframework.http.HttpStatus;

import java.util.*;

/**
 * Created by KimChheng on 5/9/2017.
 */
public final class JResponseEntity<T> {

    @JsonProperty("MESSAGE")
    private String message;
    @JsonProperty("CODE")
    private Integer code;
    @JsonProperty("STATE")
    private Boolean state;
    @JsonProperty("HTTP_STATUS")
    private HttpStatus status;
    @JsonProperty("DATA")
    private final List<Object> data = new ArrayList();
    @JsonProperty("MAP")
    private final Map<String, Object> map = new HashMap();

    public JResponseEntity() {
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Integer getCode() {
        return code == null ? (status != null ? code = status.value() : null) : code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public Boolean getState() {
        return state;
    }

    public void setState(Boolean state) {
        this.state = state;
    }

    public HttpStatus getStatus() {
        return status;
    }

    public void setStatus(HttpStatus status) {
        this.status = status;
    }

    public List<Object> getData() {
        return data;
    }

    public void addBody(Object body) {
        if (body != null) {
            if (body instanceof List)
                data.addAll((Collection<?>) body);
            else
                data.add(body);
        }
    }

    public void addBody(String key, Object body) {
        if (key != null && !key.isEmpty() && body != null) {
            if (body instanceof List) {
                addBody(body);
            } else {
                map.put(key, body);
            }
        }
    }
}
