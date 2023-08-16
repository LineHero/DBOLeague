package service;

import dto.InningsDTO;
import dto.SingleDTO;

public interface GameService {
	int insertSingle(SingleDTO dto);
	int updateSingle(SingleDTO dto);
	int insertInnings(InningsDTO dto);
}
