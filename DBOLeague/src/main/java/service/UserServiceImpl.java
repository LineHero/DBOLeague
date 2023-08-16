package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDAO;
import dto.MemberDTO;


@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserDAO dao;
	
	public void signUp(MemberDTO member) {
		dao.signUp(member);
	}

	
}
