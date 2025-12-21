package service;

import java.util.List;
import model.Recruit;

public interface AdminRecruitService {
    List<Recruit> findAll();
    Recruit findById(int id);
    void insertRecruit(Recruit recruit);
    void updateRecruit(Recruit recruit);
    void deleteRecruit(int id);
}
