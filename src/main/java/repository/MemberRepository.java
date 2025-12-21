package repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import mapper.MemberMapper;
import model.Member;

@Repository
public class MemberRepository {

    @Autowired private MemberMapper mapper;

    public Member findByUserid(String userid){ return mapper.findByUserid(userid); }
    public Member findByUseridAndPassword(String userid, String password){ return mapper.findByUseridAndPassword(userid, password); }
    public void insert(Member m){ mapper.insert(m); }
}
