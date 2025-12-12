package service;

import java.util.List;
import dao.ApplicationDao;
import model.Application;

public class ApplicationServiceImpl implements ApplicationService {
    private final ApplicationDao applicationDao = new ApplicationDao();

    @Override
    public List<Application> listByRecruit(int recruitId) {
        return applicationDao.findByRecruitId(recruitId);
    }

    @Override
    public Application detail(int id) {
        return applicationDao.findById(id);
    }

    @Override
    public void create(Application app) {
        applicationDao.insert(app);
    }

    @Override
    public void edit(Application app) {
        applicationDao.update(app);
    }

    @Override
    public void remove(int id) {
        applicationDao.delete(id);
    }
}
