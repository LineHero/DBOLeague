package service;

import java.util.List;

import dto.MemberDTO;
import dto.MyItemsDTO;

public interface MyItemsService {
	public int buyitem(MyItemsDTO dto);
	public List<String> getsolditem(String member_id);
	public int minusexp(MemberDTO dto);
}
