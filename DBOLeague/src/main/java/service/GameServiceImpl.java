package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.GameDAO;
import dao.RankingDAO;
import dto.InningsDTO;
import dto.SingleDTO;


@Service
public class GameServiceImpl implements GameService {
	
	@Autowired
	GameDAO dao;

	@Override
	public int insertSingle(SingleDTO dto) {
		dao.insertSingle(dto);
		int result = dto.getSingle_id();
		return result;
	}

	@Override
	public int updateSingle(SingleDTO dto) {
		// TODO Auto-generated method stub
		return dao.updateSingle(dto);
	}

	@Override
	public int insertInnings(InningsDTO dto) {
		// TODO Auto-generated method stub
		return dao.insertInnings(dto);
	}

	
	
}
