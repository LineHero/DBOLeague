package service;

import dto.ExpDTO;
import dto.InningsDTO;
import dto.SingleDTO;

public interface GameService {
	int insertSingle(SingleDTO dto);
	int updateSingle(SingleDTO dto);
	int insertInnings(InningsDTO dto);
	int insertExp(ExpDTO dto);
}
