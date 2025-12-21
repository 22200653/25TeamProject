package service;

import model.Member;

public interface MemberService {
    Member login(String userid, String password);
    boolean signup(String userid, String password, String username);
}
