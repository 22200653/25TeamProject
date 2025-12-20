package repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mapper.RecruitMapper;
import model.Recruit;

@Repository
public class RecruitRepository {

    @Autowired
    private RecruitMapper mapper;

    public List<Recruit> findAll() {
        return mapper.findAll();
    }

    // ✅ 추가
    public List<Recruit> findByCategory(String category) {
        return mapper.findByCategory(category);
    }

    public Recruit findById(int id) {
        return mapper.findById(id);
    }
}
