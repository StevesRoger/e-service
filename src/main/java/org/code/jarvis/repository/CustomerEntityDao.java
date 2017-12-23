package org.code.jarvis.repository;

import org.code.jarvis.model.core.ICustomer;
import org.springframework.web.multipart.MultipartFile;

/**
 * Created by KimChheng on 5/18/2017.
 */
public interface CustomerEntityDao extends EntityDao {

    ICustomer saveOrUpdateCustomer(MultipartFile[] files, ICustomer customer) throws Exception;

}
