package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.Application;
import repository.ApplicationRepository;

@Service
public class ApplicationServiceImpl implements ApplicationService {

    @Autowired
    private ApplicationRepository repo;

    @Override
    public List<Application> listByRecruitId(int recruitId) {
        return repo.findByRecruitId(recruitId);
    }

    @Override
    public Application detail(int id) {
        return repo.findById(id);
    }

    @Override
    public void create(Application app) {
        repo.insert(app);
    }

    @Override
    public void edit(Application app) {
        repo.update(app);
    }

    @Override
    public void remove(int id) {
        repo.delete(id);
    }
}
