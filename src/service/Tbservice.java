package service;

import java.util.List;
import java.util.Map;

import vo.tbVO;

public interface Tbservice {
	public String insertTb(tbVO tbinfo);
	public List<tbVO> selectAllTb(Map<String, String> num);
	public int deletetb(Map<String, String> deleteinfo);
	public String checkpass(Map<String, String> deleteinfo);
	public int updatetb(tbVO updateinfo);
	public tbVO selectone(String tb_seq);
	
	public int deletecoment(Map<String, String> deleteinfo);
	public String insertComent(tbVO tbinfo);
	
	public List<tbVO> selectSearch(String search_val);
	
	
	public String countTotal();
	public String findquery(String search_val);
}
