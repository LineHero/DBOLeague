package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.GameDAO;
import dao.RankingDAO;


@Service
public class GameServiceImpl implements GameService {
	
	@Autowired
	GameDAO dao;

	
}
