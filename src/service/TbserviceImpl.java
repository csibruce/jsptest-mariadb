package service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import dao.TbDao;
import dao.TbDaoImpl;
import vo.tbVO;

public class TbserviceImpl implements Tbservice {
	
	private static Tbservice service = null;
	private TbDao dao = null;
	private TbserviceImpl(){
		dao = TbDaoImpl.getInstance();
	}
	
	public static Tbservice getInstance(){
		if(service==null)
			service = new TbserviceImpl();
		return service;
	}
	

	@Override
	public String insertTb(tbVO tbinfo) {
		String tb_writer = "";
		
		try {
			tb_writer = dao.insertTb(tbinfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return tb_writer;
	}

	@Override
	public List<tbVO> selectAllTb(Map<String, String> num) {
		List<tbVO> list = null;
		try {
			list = dao.selectAllTb(num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int deletetb(Map<String, String> deleteinfo) {
		int deleteCnt = -1;
		try {
			deleteCnt = dao.deletetb(deleteinfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return deleteCnt;
	}

	@Override
	public String checkpass(Map<String, String> deleteinfo) {
		String checkpass = "";
		try {
			checkpass = dao.checkpass(deleteinfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return checkpass;
	}

	@Override
	public int updatetb(tbVO updateinfo) {
		int updateCnt = -1;
		try {
			updateCnt = dao.updatetb(updateinfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return updateCnt;
	}

	@Override
	public tbVO selectone(String tb_seq) {
		tbVO tbinfo = null;
		try {
			tbinfo = dao.selectone(tb_seq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return tbinfo;
	}

	@Override
	public String insertComent(tbVO tbinfo) {
		String tb_writer = "";
		
		try {
			tb_writer = dao.insertComent(tbinfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return tb_writer;
	}

	@Override
	public int deletecoment(Map<String, String> deleteinfo) {
		int deleteCnt = -1;
		try {
			deleteCnt = dao.deletecoment(deleteinfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return deleteCnt;
	}

	
	@Override
	public List<tbVO> selectSearch(String search_val) {
		List<tbVO> list = null;
		try {
			list = dao.selectSearch(search_val);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public String countTotal() {
		String totalCnt = "";
		try {
			totalCnt = dao.countTotal();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totalCnt;
	}

	@Override
	public String findquery(String search_val) {
		String findCnt = "";
		try {
			findCnt = dao.findquery(search_val);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return findCnt;
	}

}
