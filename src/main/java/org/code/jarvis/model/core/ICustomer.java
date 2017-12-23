package org.code.jarvis.model.core;

import java.util.Date;
import java.util.List;

/**
 * Created by ki.kao on 12/20/2017.
 */
public interface ICustomer {

    Date getCreateDate();

    Date getUpdateDate();

    void setCreateDate(Date createDate);

    void setUpdateDate(Date updateDate);

    void setImages(List<Image> images);
}
