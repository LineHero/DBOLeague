package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MypageDAO;

@Service	
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	MypageDAO dao;
	
	
}
