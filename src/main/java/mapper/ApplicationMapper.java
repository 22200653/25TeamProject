package mapper;

import java.util.List;
import model.Application;

public interface ApplicationMapper {
    List<Application> findByRecruitId(int recruitId);
    Application findById(int id);

    int insert(Application app);
    int update(Application app);
    int delete(int id);
}
