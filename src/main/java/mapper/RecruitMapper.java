package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import model.Recruit;

public interface RecruitMapper {

    // ====== 조회 ======
    List<Recruit> findAll();

    List<Recruit> findByCategory(@Param("category") String category);

    // 검색(제목에 q 포함)
    List<Recruit> findBySearch(@Param("q") String q);

    // 카테고리 + 검색 동시에
    List<Recruit> findByCategoryAndSearch(@Param("category") String category, @Param("q") String q);

    Recruit findById(@Param("id") int id);

    // 랭킹(좋아요 수 기준)
    List<Recruit> findTop3ByLikes();

    // ====== 조회수 ======
    void increaseViewCount(@Param("id") int id);

    // ====== 좋아요(유저별 토글) ======
    int existsLike(@Param("recruitId") int recruitId, @Param("memberId") int memberId);

    void insertLike(@Param("recruitId") int recruitId, @Param("memberId") int memberId);

    void deleteLike(@Param("recruitId") int recruitId, @Param("memberId") int memberId);

    void increaseLikeCount(@Param("recruitId") int recruitId);

    void decreaseLikeCount(@Param("recruitId") int recruitId);

    // ====== 관리자 CRUD ======
    void insertRecruit(Recruit recruit);
    void updateRecruit(Recruit recruit);
    void deleteRecruit(@Param("id") int id);
}
