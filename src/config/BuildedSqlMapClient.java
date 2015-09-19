package config;
import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class BuildedSqlMapClient{
	
	private static SqlMapClient client = null;
	
	static{
		try{
		  //System.out.println("-------------------------------------------------------------");
		  Charset ch = Charset.forName("utf-8");
		  Resources.setCharset(ch); 
		  Reader reader = Resources.getResourceAsReader("/config/SqlMapConfig.xml");
		  client = SqlMapClientBuilder.buildSqlMapClient(reader);
		  reader.close(); 
		}catch(IOException e){
			//System.out.println("========================================================");
			throw new RuntimeException("SqlMapClient 생성 실패" + e, e);
		}
	}
	
	public static SqlMapClient getSqlMapClient(){
		return client;
	}

}
