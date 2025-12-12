package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mapper.RecruitMapper;
import model.Recruit;
import util.MyBatisUtil;

public class RecruitDao {

    public List<Recruit> findAll() {
        SqlSession session = null;
        try {
            session = MyBatisUtil.getFactory().openSession();
            return session.getMapper(RecruitMapper.class).findAll();
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    public Recruit findById(int id) {
        SqlSession session = null;
        try {
            session = MyBatisUtil.getFactory().openSession();
            return session.getMapper(RecruitMapper.class).findById(id);
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }
}
