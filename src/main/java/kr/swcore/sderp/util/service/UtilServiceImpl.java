package kr.swcore.sderp.util.service;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import kr.swcore.sderp.util.dao.ImageDAO;
import kr.swcore.sderp.util.dto.ImageDTO;

@Service
public class UtilServiceImpl implements UtilService {

	@Inject
	ImageDAO imageDAO;

	@Override
	public int insertImage(ImageDTO dto) {
		return imageDAO.insertImage(dto);
	}

	@Override
	public String getBase64(String uuid) {
		return imageDAO.getBase64(uuid);
	}

}
