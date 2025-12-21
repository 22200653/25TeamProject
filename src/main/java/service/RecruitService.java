package service;

import java.util.List;
import model.Recruit;

public interface RecruitService {
    List<Recruit> list();
    List<Recruit> list(String category);
    List<Recruit> list(String category, String q); // ✅ 검색 포함
    Recruit detail(int id);

    void increaseViewCount(int id);               // ✅ 조회수
    List<Recruit> top3ByLikes();                  // ✅ 랭킹
    boolean isLikedByUser(int recruitId, int memberId);
    void toggleLike(int recruitId, int memberId); // ✅ 좋아요 토글
}
