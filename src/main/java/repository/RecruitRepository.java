package repository;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import mapper.RecruitMapper;
import model.Recruit;

@Repository
public class RecruitRepository {

    @Autowired
    private RecruitMapper mapper;

    public List<Recruit> findAll() { return mapper.findAll(); }
    public List<Recruit> findByCategory(String category) { return mapper.findByCategory(category); }
    public Recruit findById(int id) { return mapper.findById(id); }

    // ✅ Mapper 이름에 맞추기
    public List<Recruit> searchAll(String q){ return mapper.findBySearch(q); }

    public List<Recruit> searchByCategory(String category, String q){
        return mapper.findByCategoryAndSearch(category, q);
    }

    public void increaseViewCount(int id){ mapper.increaseViewCount(id); }

    // ✅ Mapper 이름에 맞추기
    public List<Recruit> top3ByLikes(){ return mapper.findTop3ByLikes(); }

    public boolean existsLike(int recruitId, int memberId){ return mapper.existsLike(recruitId, memberId) > 0; }
    public void insertLike(int recruitId, int memberId){ mapper.insertLike(recruitId, memberId); }
    public void deleteLike(int recruitId, int memberId){ mapper.deleteLike(recruitId, memberId); }

    public void increaseLikeCount(int recruitId){ mapper.increaseLikeCount(recruitId); }
    public void decreaseLikeCount(int recruitId){ mapper.decreaseLikeCount(recruitId); }
}
