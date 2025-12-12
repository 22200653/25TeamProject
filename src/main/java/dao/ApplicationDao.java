package dao;

import java.util.List;

import model.Application;
import mapper.ApplicationMapper;
import util.MyBatisUtil;

import org.apache.ibatis.session.SqlSession;

public class ApplicationDao {

    public List<Application> findByRecruitId(int recruitId) {
        SqlSession session = null;
        try {
            session = MyBatisUtil.getFactory().openSession();
            return session.getMapper(ApplicationMapper.class).findByRecruitId(recruitId);
        } finally {
            if (session != null) session.close();
        }
    }

    public Application findById(int id) {
        SqlSession session = null;
        try {
            session = MyBatisUtil.getFactory().openSession();
            return session.getMapper(ApplicationMapper.class).findById(id);
        } finally {
            if (session != null) session.close();
        }
    }

    public void insert(Application app) {
        SqlSession session = null;
        try {
            session = MyBatisUtil.getFactory().openSession();
            session.getMapper(ApplicationMapper.class).insert(app);
            session.commit();
        } catch (RuntimeException e) {
            if (session != null) session.rollback();
            throw e;
        } finally {
            if (session != null) session.close();
        }
    }

    public void update(Application app) {
        SqlSession session = null;
        try {
            session = MyBatisUtil.getFactory().openSession();
            session.getMapper(ApplicationMapper.class).update(app);
            session.commit();
        } catch (RuntimeException e) {
            if (session != null) session.rollback();
            throw e;
        } finally {
            if (session != null) session.close();
        }
    }

    public void delete(int id) {
        SqlSession session = null;
        try {
            session = MyBatisUtil.getFactory().openSession();
            session.getMapper(ApplicationMapper.class).delete(id);
            session.commit();
        } catch (RuntimeException e) {
            if (session != null) session.rollback();
            throw e;
        } finally {
            if (session != null) session.close();
        }
    }
}
