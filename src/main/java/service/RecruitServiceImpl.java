package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.Recruit;
import repository.RecruitRepository;

@Service
public class RecruitServiceImpl implements RecruitService {

    @Autowired
    private RecruitRepository repo;

    @Override
    public List<Recruit> list() {
        return repo.findAll();
    }

    @Override
    public List<Recruit> list(String category) {
        if (category == null || category.trim().isEmpty() || "전체".equals(category)) {
            return repo.findAll();
        }
        return repo.findByCategory(category);
    }

    @Override
    public Recruit detail(int id) {
        return repo.findById(id);
    }
}
