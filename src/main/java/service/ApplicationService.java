package service;

import java.util.List;
import model.Application;

public interface ApplicationService {
    List<Application> listByRecruitId(int recruitId);
    Application detail(int id);
    void create(Application app);
    void edit(Application app);
    void remove(int id);
}
