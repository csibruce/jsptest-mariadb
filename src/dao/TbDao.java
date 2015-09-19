package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import vo.tbVO;

public interface TbDao {
	public String insertTb(tbVO tbinfo) throws SQLException;
	public List<tbVO> selectAllTb(Map<String, String> num) throws SQLException;
	public int deletetb(Map<String, String> deleteinfo) throws SQLException;
	public String checkpass(Map<String, String> deleteinfo) throws SQLException;
	public int updatetb(tbVO updateinfo) throws SQLException;
	public tbVO selectone(String tb_seq) throws SQLException;
	
	public int deletecoment(Map<String, String> deleteinfo) throws SQLException;
	public String insertComent(tbVO tbinfo) throws SQLException;
	
	public List<tbVO> selectSearch(String search_val) throws SQLException;
	
	public String countTotal() throws SQLException;
	public String findquery(String search_val) throws SQLException;
}
