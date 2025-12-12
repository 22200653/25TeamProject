package mapper;

import java.util.List;
import model.Application;

public interface ApplicationMapper {
    List<Application> findByRecruitId(int recruitId);
    Application findById(int id);
    void insert(Application app);
    void update(Application app);
    void delete(int id);
}
