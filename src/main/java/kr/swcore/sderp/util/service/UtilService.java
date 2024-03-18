package kr.swcore.sderp.util.service;

import java.util.List;

import kr.swcore.sderp.util.dto.ImageDTO;

public interface UtilService {
	int insertImage(ImageDTO dto);

	String getBase64FromServer(String uuid);

	List<String> extractUuidsFromHtml(String htmlCode);
}