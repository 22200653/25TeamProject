package service;

import java.util.List;
import dao.RecruitDao;
import model.Recruit;

public class RecruitServiceImpl implements RecruitService {
    private final RecruitDao recruitDao = new RecruitDao();

    @Override
    public List<Recruit> list() {
        return recruitDao.findAll();
    }

    @Override
    public Recruit detail(int id) {
        return recruitDao.findById(id);
    }
}
