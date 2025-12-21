package service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import mapper.RecruitMapper;
import model.Recruit;

@Service
public class AdminRecruitServiceImpl implements AdminRecruitService {

    @Autowired private RecruitMapper recruitMapper;

    @Override public List<Recruit> findAll(){ return recruitMapper.findAll(); }
    @Override public Recruit findById(int id){ return recruitMapper.findById(id); }

    @Override public void insertRecruit(Recruit recruit){ recruitMapper.insertRecruit(recruit); }
    @Override public void updateRecruit(Recruit recruit){ recruitMapper.updateRecruit(recruit); }
    @Override public void deleteRecruit(int id){ recruitMapper.deleteRecruit(id); }
}
