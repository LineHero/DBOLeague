package dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import dto.InningsDTO;
import dto.SingleDTO;

@Repository
@Mapper
public interface GameDAO {
	int insertSingle(SingleDTO dto);
	int updateSingle(SingleDTO dto);
	int insertInnings(InningsDTO dto);
}
