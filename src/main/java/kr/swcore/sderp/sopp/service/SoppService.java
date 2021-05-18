package kr.swcore.sderp.sopp.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.swcore.sderp.common.dto.PageDTO;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.sopp.dto.SoppFileDataDTO;

public interface SoppService {
	
		List<SoppDTO> listSopp();
		List<SoppDTO> listSopp(HttpSession session, PageDTO pageDTO);
		Object listSopp(HttpSession session, String param, HttpServletRequest request, HttpServletResponse response);
		Object listSopp2(HttpSession session, String param, HttpServletRequest request, HttpServletResponse response);
		List<SoppDTO> listconSopp(HttpSession session, SoppDTO dto);
		List<SoppDTO> listSopp2();
		List<SoppDTO> listSopp2(HttpSession session);
		List<SoppDTO> listconSopp2(HttpSession session, SoppDTO dto);
		List<SoppDTO> listFile(int soppNo);
		SoppDTO detailSopp(int soppNo);
		int updateSopp(SoppDTO dto);
		int deleteSopp(int soppNo);
		int insertSopp(SoppDTO dto);
		int insertSopp(HttpSession session, SoppDTO dto);
		int update2Sopp(SoppDTO dto);
		int uploadFile(HttpSession session, int soppNo, MultipartHttpServletRequest fileList) throws IOException;
		SoppFileDataDTO downloadFile(SoppFileDataDTO dto);
}
