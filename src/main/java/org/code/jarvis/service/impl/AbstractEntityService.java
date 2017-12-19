package org.code.jarvis.service.impl;

import org.code.jarvis.hql.Association;
import org.code.jarvis.hql.BaseCriteria;
import org.code.jarvis.model.core.AbstractEntity;
import org.code.jarvis.repository.EntityDao;
import org.code.jarvis.service.EntityService;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by KimChheng on 5/14/2017.
 */
public abstract class AbstractEntityService implements EntityService {

    public abstract EntityDao getDao();

    @Override
    public SessionFactory getSessionFactory() {
        return getDao().getSessionFactory();
    }

    @Override
    public Session getCurrentSession() {
        return getDao().getCurrentSession();
    }

    @Override
    public Connection getConnection() throws SQLException {
        return getDao().getConnection();
    }

    @Override
    public <T> T getEntityById(Long id, Class<T> clazz) {
        return getDao().getEntityById(id, clazz);
    }

    @Override
    public <T> T loadEntityById(Long id, Class<T> clazz) {
        return getDao().loadEntityById(id, clazz);
    }

    @Override
    public <T> List<T> getEntityByCode(String code, Class<T> clazz) {
        return getDao().getEntityByCode(code, clazz);
    }

    @Override
    public <T> List<T> list(Class<T> clazz) {
        return getDao().list(clazz);
    }

    @Override
    public <T extends AbstractEntity> void save(T entity) {
        getDao().save(entity);
    }

    @Override
    public <T extends AbstractEntity> void update(T entity) {
        getDao().update(entity);
    }

    @Override
    public <T> void saveOrUpdate(T entity) {
        getDao().saveOrUpdate(entity);
    }

    @Override
    public <T extends AbstractEntity> void save(List<T> list) {
        getDao().save(list);
    }

    @Override
    public <T extends AbstractEntity> void update(List<T> list) {
        getDao().update(list);
    }

    @Override
    public <T> void saveOrUpdate(List<T> list) {
        getDao().saveOrUpdate(list);
    }

    @Override
    public <T> void delete(T entity) {
        getDao().delete(entity);
    }

    @Override
    public int executeSQL(String sql) {
        return getDao().executeSQL(sql);
    }

    @Override
    public ResultSet executeQuery(String sql) throws Exception {
        return getDao().executeQuery(sql);
    }

    @Override
    public <T> List<T> getList(String sql, Class<T> clazz) {
        return getDao().getList(sql, clazz);
    }

    @Override
    public <T> T getSingle(String sql, Class<T> clzz) {
        return getDao().getSingle(sql, clzz);
    }

    @Override
    public <T> List<T> list(BaseCriteria<T> criteria) {
        return getDao().list(criteria);
    }

    @Override
    public <T> List<T> list(Class<T> clazz, boolean isDistinctRootEntity, List<Association> associations, List<Criterion> criterions, List<Projection> projections, Integer firstResult, Integer maxResults, List<Order> orders) {
        return getDao().list(clazz, isDistinctRootEntity, associations, criterions, projections, firstResult, maxResults, orders);
    }

    @Override
    public void flush() {
        getDao().flush();
    }

    @Override
    public void clear() {
        getDao().clear();
    }

    @Override
    public long getCount(String sql) {
        return getDao().getCount(sql);
    }
}
