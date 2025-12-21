package service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import model.Recruit;
import repository.RecruitRepository;

@Service
public class RecruitServiceImpl implements RecruitService {

    @Autowired
    private RecruitRepository repo;

    @Override
    public List<Recruit> list() {
        return repo.findAll();
    }

    @Override
    public List<Recruit> list(String category) {
        return list(category, null);
    }

    @Override
    public List<Recruit> list(String category, String q) {
        boolean all = (category == null || category.trim().isEmpty() || "전체".equals(category));
        boolean hasQ = (q != null && !q.trim().isEmpty());

        if (!hasQ && all) return repo.findAll();
        if (!hasQ) return repo.findByCategory(category);
        if (all) return repo.searchAll(q);
        return repo.searchByCategory(category, q);
    }

    @Override
    public Recruit detail(int id) {
        return repo.findById(id);
    }

    @Override
    public void increaseViewCount(int id) {
        repo.increaseViewCount(id);
    }

    @Override
    public List<Recruit> top3ByLikes() {
        return repo.top3ByLikes();
    }

    @Override
    public boolean isLikedByUser(int recruitId, int memberId) {
        return repo.existsLike(recruitId, memberId);
    }

    @Override
    public void toggleLike(int recruitId, int memberId) {
        boolean exists = repo.existsLike(recruitId, memberId);
        if (exists) {
            repo.deleteLike(recruitId, memberId);
            repo.decreaseLikeCount(recruitId);
        } else {
            repo.insertLike(recruitId, memberId);
            repo.increaseLikeCount(recruitId);
        }
    }
}
