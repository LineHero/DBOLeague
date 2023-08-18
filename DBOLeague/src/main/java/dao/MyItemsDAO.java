package dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import dto.MemberDTO;
import dto.MyItemsDTO;


@Repository
@Mapper
public interface MyItemsDAO {
	public int buyitem(MyItemsDTO dto);
	public List<String> getsolditem(String member_id);
	public int minusexp(MemberDTO dto);
}
