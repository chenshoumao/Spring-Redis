package com.csm.util;


import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Order;
import org.hibernate.metadata.ClassMetadata;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Dao
  implements Serializable
{
  private static final long serialVersionUID = 1L;

  @Autowired
  private SessionFactory sessionFactory;

  public Session getSession()
  {
    Session session = this.sessionFactory.getCurrentSession();
    return session;
  }

  public SessionFactory getSessionFactory() {
    return this.sessionFactory;
  }

  public Transaction beginTran() {
    return getSession().beginTransaction();
  }

  public void commit() {
    getSession().getTransaction().commit();
  }

  public void rollback() {
    getSession().getTransaction().rollback();
  }

  public Serializable save(Object object) {
    return getSession().save(object);
  }

  public void save(List<?> object) {
    for (int i = 0; i < object.size(); i++)
    {
      save(object.get(i));
      if (i % 50 == 0) {
        getSession().flush();
        getSession().clear();
      }
    }
  }

  public void save(Object[] objects) {
    save(Arrays.asList(objects));
  }

  public void update(Object object) {
    getSession().update(object);
  }

  public void update(List<?> object) {
    for (int i = 0; i < object.size(); i++)
    {
      update(object.get(i));
      if (i % 50 == 0) {
        getSession().flush();
        getSession().clear();
      }
    }
  }

  public void update(Object[] objects) {
    update(Arrays.asList(objects));
  }

  public <T> T merge(T obj) {
    return (T) getSession().merge(obj);
  }

  public <T> T findById(Class<T> c, Serializable id) {
    Object obj = getSession().get(c, id);
    if (obj != null) {
      getSession().evict(obj);
    }
    return (T) obj;
  }

  public <T> T load(Class<T> cls, Serializable id)
  {
    Object obj = getSession().get(cls, id);
    return (T) obj;
  }

  public <T> List<T> find(String hql) {
    Query q = getSession().createQuery(hql);
    return q.list();
  }

  public <T> List<T> findAll(Class<T> c) {
    String hql = "from " + c.getSimpleName();
    return find(hql);
  }

  public <T> List<T> findAllByOrder(Class<T> c, String orderBy) {
    String hql = "from " + c.getSimpleName() + " order by " + orderBy;
    return find(hql);
  }

  public <T> List<T> findPageByOrder(Class<T> clazz, String orderBy, int page, int rows)
  {
    String hql = "from " + clazz.getSimpleName() + " order by " + orderBy;
    return findByPage(hql, page, rows);
  }

  public <T> List<T> findPageFromByOrder(Class<T> clazz, String orderBy, int start, int rows)
  {
    String hql = "from " + clazz.getSimpleName() + " order by " + orderBy;
    Query q = getSession().createQuery(hql);
    return pageFrom(q, start, rows);
  }

  public <T> List<T> findExample(T c) {
    return getSession().createCriteria(c.getClass().getName())
      .add(Example.create(c)).list();
  }

  public <T> List<T> findExampleByOrder(T c, String orderCol, String orderType)
  {
    Order order; 
    if (orderType.equalsIgnoreCase("desc"))
      order = Order.desc(orderCol);
    else {
      order = Order.asc(orderCol);
    }
    return getSession().createCriteria(c.getClass().getName())
      .add(Example.create(c)).addOrder(order).list();
  }

  public <T> List<T> findExampleByPageFrom(T c, int start, int limit) {
    return pageFrom(getSession().createCriteria(c.getClass().getName())
      .add(Example.create(c)), start, limit);
  }

  public <T> List<T> findExampleByPage(T c, int page, int rows)
  {
    return page(
      getSession().createCriteria(c.getClass().getName()).add(
      Example.create(c)), page, rows);
  }

  public List<Object[]> findByMoreField(String hql)
  {
    Query q = getSession().createQuery(hql);
    return q.list();
  }

  public <T> List<T> findByPage(Class<T> c, int page, int rows) {
    String queryString = "from " + c.getSimpleName();
    return findByPage(queryString, page, rows);
  }

  public <T> List<T> findByPageFrom(Class<T> c, int start, int rows) {
    String hql = "from " + c.getSimpleName();
    Query q = getSession().createQuery(hql);
    return pageFrom(q, start, rows);
  }

  private static <T> List<T> pageFrom(Query query, int start, int rows) {
    query.setFirstResult(start);
    query.setMaxResults(rows);
    return query.list();
  }

  private static <T> List<T> pageFrom(Criteria criteria, int start, int rows) {
    criteria.setFirstResult(start);
    criteria.setMaxResults(rows);
    return criteria.list();
  }

  private static <T> List<T> page(Query query, int page, int rows) {
    page = Math.abs(page);
    if (page > 1)
      page = (page - 1) * rows;
    else {
      page = 0;
    }
    query.setFirstResult(page);
    query.setMaxResults(rows);
    return query.list();
  }

  private static <T> List<T> page(Criteria criteria, int page, int rows) {
    page = Math.abs(page);
    if (page > 1)
      page = (page - 1) * rows;
    else {
      page = 0;
    }
    criteria.setFirstResult(page);
    criteria.setMaxResults(rows);
    return criteria.list();
  }

  public <T> List<T> findByPage(String hql, int page, int rows) {
    Query q = getSession().createQuery(hql);
    return page(q, page, rows);
  }

  public <T> long countAll(Class<T> c)
  {
    String hql = "select count(*) from " + c.getSimpleName();
    Query q = getSession().createQuery(hql);
    return ((Long)q.uniqueResult()).longValue();
  }

  public Long count(String hql, int rowcount) {
    Query q = getSession().createQuery(hql);
    List list = q.list();
    if (list.size() == 0)
      return null;
    Long f = Long.valueOf(((Long)list.get(0)).longValue() % rowcount);
    if (f.longValue() == 0L) {
      return Long.valueOf(((Long)list.get(0)).longValue() / rowcount);
    }
    return Long.valueOf(((Long)list.get(0)).longValue() / rowcount + 1L);
  }

  public void delete(Object[] objects)
  {
    for (Object object : objects)
      getSession().delete(object);
  }

  public <T> void delete(List<T> objects)
  {
    for (Object object : objects)
      getSession().delete(object);
  }

  public int deleteById(Class<?> c, Serializable id)
  {
    String hql = "delete from " + c.getSimpleName() + " where " + 
      getEntityIdName(c) + " = :idValue";
    Query query = getSession().createQuery(hql);
    query.setParameter("idValue", id);
    int result = query.executeUpdate();
    return result;
  }

  public int deleteByHql(String hql, Object[] params) {
    Query query = getSession().createQuery(hql);
    if ((params != null) && (params.length > 0)) {
      for (int i = 0; i < params.length; i++) {
        query.setParameter(i, params[i]);
      }
    }
    int result = query.executeUpdate();
    return result;
  }

  public void deleteByRoleId(Class<?> c, String id)
  {
    String hql = "delete from " + c.getSimpleName() + 
      " o where o.roleId = :idValue";
    Query query = getSession().createQuery(hql);
    query.setParameter("idValue", id);
    query.executeUpdate();
  }

  public int deleteByIds(Class<?> c, Serializable[] ids) {
    return deleteByIds(c, Arrays.asList(ids));
  }

  public int deleteByIds(Class<?> c, List<Serializable> ids) {
    int count = 0;
    for (Serializable id : ids) {
      Object entity = findById(c, id);
      if (entity != null) {
        delete(new Object[] { entity });
        count++;
      }
    }
    return count;
  }

  public <T> void deleteByExample(T object) {
    for (Object _obj : findExample(object))
      delete(new Object[] { _obj });
  }

  private String getEntityIdName(Class<?> c)
  {
    return this.sessionFactory.getClassMetadata(c).getIdentifierPropertyName();
  }

  public <T> List<T> queryHQL(String hql) {
    return getSession().createQuery(hql).list();
  }

  public <T> List<T> queryHQL(String hql, Object[] params) {
    Query query = getSession().createQuery(hql);
    if ((params != null) && (params.length > 0)) {
      for (int i = 0; i < params.length; i++) {
        query.setParameter(i, params[i]);
      }
    }
    return query.list();
  }

  public <T> List<T> queryHQLByPage(String hql, int page, int pageSize, List<Object> params)
  {
    Query query = getSession().createQuery(hql);
    if ((params != null) && (params.size() > 0)) {
      for (int i = 0; i < params.size(); i++) {
        query.setParameter(i, params.get(i));
      }
    }
    if (page <= 1) {
      page = 1;
    }

    if (pageSize <= 0) {
      pageSize = 10;
    }

    page--;
    if (page != 0) {
      page = pageSize * page;
    }
    query.setFirstResult(page);
    query.setMaxResults(pageSize);
    return query.list();
  }

  public <T> List<T> queryHQLByList(String sql, List<?> params)
  {
    Query query = getSession().createQuery(sql);
    if ((params != null) && (params.size() > 0)) {
      for (int i = 0; i < params.size(); i++)
      {
        query.setParameter(i, params.get(i));
      }
    }
    return query.list();
  }

  public void saveOrUpdate(Object object) {
    getSession().saveOrUpdate(object);
  }

  public int executeJDBCSql(String sql) {
    return getSession().createSQLQuery(sql).executeUpdate();
  }

  public int executeJDBCSql(String sql, List<Object> params) {
    SQLQuery rs = getSession().createSQLQuery(sql);
    rs.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
    if (!params.isEmpty()) {
      for (int i = 0; i < params.size(); i++) {
        rs.setParameter(i, params.get(i));
      }
    }
    return rs.executeUpdate();
  }

  public List executeJDBCSqlQuery(String sql, int page, int pageSize, List<Object> params)
  {
    SQLQuery rs = getSession().createSQLQuery(sql);
    rs.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
    if (!params.isEmpty()) {
      for (int i = 0; i < params.size(); i++) {
        rs.setParameter(i, params.get(i));
      }
    }
    if (page <= 1) {
      page = 1;
    }

    if (pageSize <= 0) {
      pageSize = 10;
    }

    page--;
    if (page != 0) {
      page = pageSize * page;
    }
    rs.setFirstResult(page);
    rs.setMaxResults(pageSize);
    return rs.list();
  }

  public List executeJDBCSqlQuery(String sql, List<Object> params) {
    SQLQuery rs = getSession().createSQLQuery(sql);
    rs.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
    if (!params.isEmpty()) {
      for (int i = 0; i < params.size(); i++) {
        rs.setParameter(i, params.get(i));
      }
    }
    return rs.list();
  }

  public List executeJDBCSqlQuery(String sql) {
    SQLQuery rs = getSession().createSQLQuery(sql);
    rs.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
    return rs.list();
  }

  public <T> List<T> findByPage(String hql, int page, int pageSize, Object[] params)
  {
    Query query = getSession().createQuery(hql);
    if ((params != null) && (params.length > 0)) {
      for (int i = 0; i < params.length; i++) {
        query.setParameter(i, params[i]);
      }
    }

    if (page <= 1) {
      page = 1;
    }

    if (pageSize <= 0) {
      pageSize = 10;
    }

    page--;
    if (page != 0) {
      page = pageSize * page;
    }

    query.setFirstResult(page);
    query.setMaxResults(pageSize);
    return query.list();
  }

  public <T> List<T> findByPageSQl(String hql, int page, int pageSize, Object[] params)
  {
    Query query = getSession().createSQLQuery(hql);
    if ((params != null) && (params.length > 0)) {
      for (int i = 0; i < params.length; i++) {
        query.setParameter(i, params[i]);
      }
    }
    if (page <= 1) {
      page = 1;
    }

    if (pageSize <= 0) {
      pageSize = 10;
    }

    page--;
    if (page != 0) {
      page = pageSize * page;
    }

    query.setFirstResult(page);
    query.setMaxResults(pageSize);
    return query.list();
  }

  public long count(String hql, Object[] params)
  {
    Query query = getSession().createQuery("select count(*) " + hql);
    if ((params != null) && (params.length > 0)) {
      for (int i = 0; i < params.length; i++) {
        query.setParameter(i, params[i]);
      }
    }
    return ((Long)query.uniqueResult()).longValue();
  }

  public <T> long countByList(String hql, List<Object> params) {
    Query query = getSession().createQuery("select count(*) " + hql);
    if ((params != null) && (params.size() > 0)) {
      for (int i = 0; i < params.size(); i++) {
        query.setParameter(i, params.get(i));
      }
    }
    return ((Long)query.uniqueResult()).longValue();
  }

  public long countSql(String hql, Object[] params) {
    Query query = getSession().createSQLQuery("select count(*) " + hql);
    if ((params != null) && (params.length > 0)) {
      for (int i = 0; i < params.length; i++) {
        query.setParameter(i, params[i]);
      }
    }
    return ((BigDecimal)query.uniqueResult()).longValue();
  }

  public long countSql(String hql, List<Object> conditions) {
    Query query = getSession().createSQLQuery("select count(*) " + hql);
    if ((conditions != null) && (!conditions.isEmpty()) && 
      (!conditions.isEmpty())) {
      for (int i = 0; i < conditions.size(); i++) {
        query.setParameter(i, conditions.get(i));
      }
    }

    return ((BigDecimal)query.uniqueResult()).longValue();
  }

  public long countSqlWithIn(String hql, Map<String, List<Object>> conditions)
  {
    Query query = getSession().createQuery("select count(*) " + hql);
    if ((conditions != null) && (!conditions.isEmpty())) {
      for (String key : conditions.keySet()) {
        query.setParameterList(key, (Collection)conditions.get(key));
      }
    }
    return ((Long)query.uniqueResult()).longValue();
  }

  public <T> List<T> executeJDBCSqlQuery(String sql, Class clazz, List<Object> params)
  {
    SQLQuery sqlQuery = getSession().createSQLQuery(sql);
    for (int i = 0; i < params.size(); i++) {
      sqlQuery.setParameter(i, params.get(i));
    }
    return sqlQuery.addEntity(clazz).list();
  }
}