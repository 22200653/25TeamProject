package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import model.Member;
import repository.MemberRepository;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired private MemberRepository repo;

    @Override
    public Member login(String userid, String password) {
        // ✅ 교수님 지정 관리자 계정 보장
        if ("admin".equals(userid) && "admin1234".equals(password)) {
            Member admin = repo.findByUserid("admin");
            if (admin == null) {
                admin = new Member();
                admin.setUserid("admin");
                admin.setPassword("admin1234");
                admin.setUsername("관리자");
                admin.setRole("ADMIN");
                repo.insert(admin);
            }
            // 혹시 role이 잘못 들어가도 최소동작 보장
            admin.setRole("ADMIN");
            return admin;
        }
        return repo.findByUseridAndPassword(userid, password);
    }

    @Override
    public boolean signup(String userid, String password, String username) {
        if (repo.findByUserid(userid) != null) return false;
        Member m = new Member();
        m.setUserid(userid);
        m.setPassword(password);
        m.setUsername(username);
        m.setRole("USER");
        repo.insert(m);
        return true;
    }
}
