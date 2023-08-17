package service;

import dto.MemberDTO;

public interface UserService {
	void signUp(MemberDTO member);
	public MemberDTO signIn(MemberDTO dto);
}
