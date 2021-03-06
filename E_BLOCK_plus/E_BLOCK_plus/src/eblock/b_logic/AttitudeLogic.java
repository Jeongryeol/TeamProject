package eblock.b_logic;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import eblock.c_dao.AttitudeDao;

public class AttitudeLogic {
	Logger logger = Logger.getLogger(AttitudeLogic.class);
	AttitudeDao attitudeDao = null;
	
	public AttitudeLogic() {
		 attitudeDao = new AttitudeDao();
	}

	
	int result = 0;
	List<Map<String, Object>> list = null;
	
	public int my_ask(Map<String, Object> pMap) {
		pMap.put("e_no", Integer.parseInt(pMap.get("c_eno").toString()));
		pMap.put("d_no", Integer.parseInt(pMap.get("c_dno").toString()));
		result = attitudeDao.my_ask(pMap);
		return result;
	}

	public int my_askUpd(Map<String, Object> pMap) {
		result = attitudeDao.my_askUpd(pMap);
		return result;
	}

	public List<Map<String, Object>> my_list(Map<String, Object> pMap) {
		list = attitudeDao.attd_list(pMap);
		return list;
	}

	public int toMe_sign(Map<String, Object> pMap) {
		logger.info("pMap.get(\"param\") : "+pMap.get("param"));
		//넘어온 파람을 분할한다.
		String[] words = pMap.get("param").toString().split(",");
		//넘어온걸 반복문을 위해 리스트로 작성한다.
		List<Map<String,Object>> newList = new ArrayList<>();
		Map<String,Object> newMap = null;
		for(int i=1;i<words.length;i++) {
			newMap = new HashMap<>();
			newMap.put("sign_rs",words[0]);//상태값
			logger.info(newMap.get("sign_rs"));
			newMap.put("at_no",words[i]);//변경해야함//
			newMap.put("e_no", pMap.get("c_eno"));//결재자번호 10.. 쿠키에서 얻어야함.
			newList.add(newMap);
		}
		logger.info("newList : "+newList);
		//작성한 리스트를 넘김
		result = attitudeDao.toMe_sign(newList);
		logger.info("result : "+result);
		return result;
	}

	public List<Map<String, Object>> toMe_list(Map<String, Object> pMap) {
		pMap.put("sign_eno", pMap.get("c_eno"));
		logger.info(pMap);
		list = attitudeDao.attd_list(pMap);
		return list;
	}

	public List<Map<String, Object>> list_attdAllList(Map<String, Object> pMap) {
		list = attitudeDao.attd_list(pMap);
		return list;
	}
}
