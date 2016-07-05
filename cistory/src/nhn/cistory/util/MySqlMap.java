package nhn.cistory.util;

import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class MySqlMap {
	private static SqlMapClient sqlMap; //변수 선언, 객체는 아직 없다
	
	static { //스태틱 초기화 블럭
		try {
	        String resource = "SqlMapConfig.xml"; 
	        Reader reader = Resources.getResourceAsReader (resource);
	        sqlMap = SqlMapClientBuilder.buildSqlMapClient(reader); 
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	} //객체 생성
			
   public static SqlMapClient getSqlMapInstance () {
	   return sqlMap;
   }
}
