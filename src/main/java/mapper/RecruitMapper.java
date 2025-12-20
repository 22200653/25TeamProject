package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import model.Recruit;

public interface RecruitMapper {
    List<Recruit> findAll();

    // ✅ 추가: 카테고리로 조회 (전체면 findAll 쓰게 할 거라 여기서는 순수 필터만)
    List<Recruit> findByCategory(@Param("category") String category);

    Recruit findById(int id);
}
