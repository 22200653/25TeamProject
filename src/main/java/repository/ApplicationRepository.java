package repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mapper.ApplicationMapper;
import model.Application;

@Repository
public class ApplicationRepository {

    @Autowired
    private ApplicationMapper mapper;

    public List<Application> findByRecruitId(int recruitId) {
        return mapper.findByRecruitId(recruitId);
    }

    public Application findById(int id) {
        return mapper.findById(id);
    }

    public void insert(Application app) {
        mapper.insert(app);
    }

    public void update(Application app) {
        mapper.update(app);
    }

    public void delete(int id) {
        mapper.delete(id);
    }
}
