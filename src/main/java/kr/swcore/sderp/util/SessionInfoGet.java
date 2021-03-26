package kr.swcore.sderp.util;

import javax.servlet.http.HttpSession;

import kr.swcore.sderp.sopp.dto.SoppDTO;

public class SessionInfoGet {
	public static SoppDTO getCompNoDto(HttpSession session) {
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		SoppDTO soppdto = new SoppDTO();
		soppdto.setCompNo(compNo);
		return soppdto;
	}
	
	public static Integer getCompNo(HttpSession session) {
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		return compNo;
	}
	//
}
