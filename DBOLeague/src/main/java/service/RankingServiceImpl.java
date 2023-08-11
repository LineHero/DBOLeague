package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.RankingDAO;


@Service
public class RankingServiceImpl implements RankingService {
	
	@Autowired
	RankingDAO dao;

	
}
