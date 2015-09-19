package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.BuildedSqlMapClient;

import vo.tbVO;
import dao.TbDao;

public class TbDaoImpl implements TbDao {
	private static TbDao dao = null;
	private SqlMapClient client;
	private TbDaoImpl(){
		client = BuildedSqlMapClient.getSqlMapClient();
	}
	
	public static TbDao getInstance(){
		if(dao==null)
			dao = new TbDaoImpl();
		return dao;
	}

	@Override
	public String insertTb(tbVO tbinfo) throws SQLException {
		return (String)client.insert("member.insertTb", tbinfo);
	}

	@Override
	public List<tbVO> selectAllTb(Map<String, String> num) throws SQLException {
		return client.queryForList("member.selectAllTb", num);
	}

	@Override
	public int deletetb(Map<String, String> deleteinfo) throws SQLException {
		return client.delete("member.deletetb", deleteinfo);
	}

	@Override
	public String checkpass(Map<String, String> deleteinfo) throws SQLException {
		return (String) client.queryForObject("member.checkpass", deleteinfo);
	}

	@Override
	public int updatetb(tbVO updateinfo) throws SQLException {
		return client.update("member.updatetb", updateinfo);
	}

	@Override
	public tbVO selectone(String tb_seq) throws SQLException {
		return (tbVO) client.queryForObject("member.selectone", tb_seq);
	}

	@Override
	public String insertComent(tbVO tbinfo) throws SQLException {
		
		return (String)client.insert("member.insertComent", tbinfo);
	}

	@Override
	public int deletecoment(Map<String, String> deleteinfo) throws SQLException {
		return client.delete("member.deletecoment", deleteinfo);
	}

	@Override
	public List<tbVO> selectSearch(String search_val) throws SQLException {
		return client.queryForList("member.selectSearch", search_val);
	}

	@Override
	public String countTotal() throws SQLException {
	
		return (String) client.queryForObject("member.counttotal");
	}

	@Override
	public String findquery(String search_val) throws SQLException {
		
		return (String) client.queryForObject("member.countfind",search_val);
	}
}
