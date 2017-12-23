package org.code.jarvis.service;

import org.code.jarvis.model.core.ICustomer;
import org.springframework.web.multipart.MultipartFile;

/**
 * Created by KimChheng on 5/19/2017.
 */
public interface CustomerEntityService extends EntityService {

    ICustomer saveOrUpdateCustomer(MultipartFile[] files, ICustomer customer) throws Exception;
}
