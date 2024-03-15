package kr.swcore.sderp.util.service;

import kr.swcore.sderp.util.dto.ImageDTO;

public interface UtilService {
	int insertImage(ImageDTO dto);

	String getBase64(String uuid);
}