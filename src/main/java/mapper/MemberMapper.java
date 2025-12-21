package mapper;

import org.apache.ibatis.annotations.Param;
import model.Member;

public interface MemberMapper {
    Member findByUserid(@Param("userid") String userid);
    Member findByUseridAndPassword(@Param("userid") String userid, @Param("password") String password);
    int insert(Member m);
}
