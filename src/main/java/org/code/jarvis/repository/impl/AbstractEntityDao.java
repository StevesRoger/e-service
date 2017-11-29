package org.code.jarvis.repository.impl;

import org.code.jarvis.model.core.AbstractEntity;
import org.code.jarvis.repository.EntityDao;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.engine.jdbc.connections.spi.ConnectionProvider;
import org.hibernate.internal.SessionImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;


/**
 * Created by KimChheng on 5/13/2017.
 */
@Transactional(readOnly = false, isolation = Isolation.DEFAULT, propagation = Propagation.REQUIRED, rollbackFor = {java.lang.Exception.class})
public abstract class AbstractEntityDao implements EntityDao {

    private final Logger log = LoggerFactory.getLogger(AbstractEntityDao.class);

    @Autowired
    private SessionFactory sessionFactory;

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    @Override
    public Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public Connection getConnection() throws SQLException {
        return getSessionFactory().getSessionFactoryOptions().getServiceRegistry().
                getService(ConnectionProvider.class).getConnection();
    }

    /**
     * It always hit the database and return the real object,
     * an object that represent the database row, not proxy.
     * If no row found , it return null.
     */
    @Override
    public <T> T getEntityById(Long id, Class<T> clazz) {
        T bean = null;
        if (id != null && id > 0 && clazz != null)
            bean = getCurrentSession().get(clazz, id);
        return bean;
    }

    /**
     * It will always return a “proxy” (Hibernate term) without hitting the database.
     * it just look like a temporary fake object.
     * If no row found , it will throws an ObjectNotFoundException.
     */
    @Override
    public <T> T loadEntityById(Long id, Class<T> clazz) {
        T bean = null;
        if (id != null && id > 0 && clazz != null)
            bean = getCurrentSession().load(clazz, id);
        return bean;
    }

    @Override
    public <T> List<T> getEntityByCode(String code, Class<T> clazz) {
        if (code != null && !code.isEmpty() && clazz != null) {
            Criteria criteria = getCurrentSession().createCriteria(clazz);
            criteria.add(Restrictions.eq("code", code));
            return criteria.list();
        }
        return null;
    }

    @Override
    public <T> List<T> list(Class<T> clazz) {
        if (clazz != null) {
            Criteria criteria = getCurrentSession().createCriteria(clazz);
            criteria.addOrder(Order.desc("updateDate"));
            return criteria.list();
        }
        return null;
    }

    @Override
    public <T extends AbstractEntity> void save(T entity) {
        if (entity != null && entity.getId() == null)
            getCurrentSession().save(entity);
    }

    @Override
    public <T extends AbstractEntity> void update(T entity) {
        if (entity != null && entity.getId() != null)
            getCurrentSession().update(entity);
    }

    @Override
    public <T> void saveOrUpdate(T entity) {
        if (entity != null)
            getCurrentSession().saveOrUpdate(entity);
    }

    @Override
    public <T extends AbstractEntity> void save(List<T> list) {
        if (list != null)
            for (T entity : list)
                save(entity);
    }

    @Override
    public <T extends AbstractEntity> void update(List<T> list) {
        if (list != null)
            for (T entity : list)
                update(entity);
    }

    @Override
    public <T> void saveOrUpdate(List<T> list) {
        if (list != null)
            for (T entity : list)
                saveOrUpdate(entity);
    }

    @Override
    public <T> void delete(T entity) {
        if (entity != null)
            getCurrentSession().delete(entity);
    }

    @Override
    public int executeSQL(String sql) {
        if (sql != null && !sql.isEmpty())
            return getCurrentSession().createSQLQuery(sql).executeUpdate();
        return 0;
    }

    @Override
    public ResultSet executeQuery(String sql) throws Exception {
        Connection connection = getConnection();
        ResultSet resultSet = null;
        if (sql != null && !sql.isEmpty()) {
            if (!connection.isClosed()) {
                resultSet = connection.prepareStatement(sql).executeQuery();
            }
        }
        return resultSet;
    }

    @Override
    public void flush() {
        getCurrentSession().flush();
    }

    @Override
    public void clear() {
        getCurrentSession().clear();
    }

    @Override
    public <T> List<T> getList(String sql, Class<T> clazz) {
        return entityManager.createNativeQuery(sql,clazz).getResultList();
    }

    @Override
    public <T> T getSingle(String sql, Class<T> clazz) {
        return (T) entityManager.createNativeQuery(sql,clazz).getSingleResult();
    }

    @Override
    public long getCount(String sql) {
        BigInteger count = (BigInteger) entityManager.createNativeQuery(sql).getSingleResult();
        return count.longValue();
    }
}
