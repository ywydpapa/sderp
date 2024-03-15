package kr.swcore.sderp.util.dao;

import kr.swcore.sderp.util.dto.ImageDTO;

public interface ImageDAO {

	int insertImage(ImageDTO dto);

	String getBase64(String uuid);
}
