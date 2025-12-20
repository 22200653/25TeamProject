package service;

import java.util.List;
import model.Recruit;

public interface RecruitService {
    List<Recruit> list();                 // 전체
    List<Recruit> list(String category);  // ✅ 추가: 분야별
    Recruit detail(int id);
}
