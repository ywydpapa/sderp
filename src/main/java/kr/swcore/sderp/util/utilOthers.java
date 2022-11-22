package kr.swcore.sderp.util;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.swcore.sderp.cont.dto.ContDTO;
import kr.swcore.sderp.cust.dto.CustDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.user.dto.UserDTO;

public class utilOthers {
	@SuppressWarnings({ "unchecked", "null" })
	public static JSONArray jsonUser(List<UserDTO> userList) {
		JSONObject jsonObject = null;
		JSONArray jsonArray = new JSONArray();
		
		for(int i = 0; i < userList.size(); i++) {
			jsonObject = new JSONObject();
			jsonObject.put("label", userList.get(i).getUserName());
			jsonObject.put("value", userList.get(i).getUserName());
			jsonObject.put("no", userList.get(i).getUserNo());
			jsonArray.add(jsonObject);
		}
		
		return jsonArray;
	}
	
	@SuppressWarnings({ "unchecked", "null" })
	public static JSONArray jsonCust(List<CustDTO> custList) {
		JSONObject jsonObject = null;
		JSONArray jsonArray = new JSONArray();
		
		for(int i = 0; i < custList.size(); i++) {
			jsonObject = new JSONObject();
			jsonObject.put("label", custList.get(i).getCustName());
			jsonObject.put("value", custList.get(i).getCustName());
			jsonObject.put("no", custList.get(i).getCustNo());
			jsonArray.add(jsonObject);
		}
		
		return jsonArray;
	}
	
	@SuppressWarnings({ "unchecked", "null" })
	public static JSONArray jsonSopp(List<SoppDTO> soppList) {
		JSONObject jsonObject = null;
		JSONArray jsonArray = new JSONArray();
		
		for(int i = 0; i < soppList.size(); i++) {
			jsonObject = new JSONObject();
			jsonObject.put("label", soppList.get(i).getSoppTitle());
			jsonObject.put("value", soppList.get(i).getSoppTitle());
			jsonObject.put("no", soppList.get(i).getSoppNo());
			jsonArray.add(jsonObject);
		}
		
		return jsonArray;
	}
	
	@SuppressWarnings({ "unchecked", "null" })
	public static JSONArray jsonCont(List<ContDTO> contList) {
		JSONObject jsonObject = null;
		JSONArray jsonArray = new JSONArray();
		
		for(int i = 0; i < contList.size(); i++) {
			jsonObject = new JSONObject();
			jsonObject.put("label", contList.get(i).getContTitle());
			jsonObject.put("value", contList.get(i).getContTitle());
			jsonObject.put("no", contList.get(i).getContNo());
			jsonArray.add(jsonObject);
		}
		
		return jsonArray;
	}
	
	@SuppressWarnings({ "unchecked", "null" })
	public static JSONArray jsonCustMember(List<CustDTO> custMemberList) {
		JSONObject jsonObject = null;
		JSONArray jsonArray = new JSONArray();
		
		for(int i = 0; i < custMemberList.size(); i++) {
			jsonObject = new JSONObject();
			jsonObject.put("label", custMemberList.get(i).getCustMname());
			jsonObject.put("value", custMemberList.get(i).getCustMname());
			jsonObject.put("no", custMemberList.get(i).getCustData03no());
			jsonArray.add(jsonObject);
		}
		
		return jsonArray;
	}
}
