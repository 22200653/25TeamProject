package service;

import java.util.List;
import model.Recruit;

public interface RecruitService {
    List<Recruit> list();
    Recruit detail(int id);
}
