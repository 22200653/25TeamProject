package mapper;

import java.util.List;
import model.Recruit;

public interface RecruitMapper {
    List<Recruit> findAll();
    Recruit findById(int id);
}
