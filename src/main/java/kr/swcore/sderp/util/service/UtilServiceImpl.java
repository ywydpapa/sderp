package kr.swcore.sderp.util.service;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
	public String getBase64FromServer(String uuid) {
		String base64Data = imageDAO.getBase64(uuid);
		if (base64Data != null) {
			return base64Data;
		} else {
			return "error";
		}
	}

	@Override
	public List<String> extractUuidsFromHtml(String htmlCode) {
		List<String> uuids = new ArrayList<>();
		String regex = "<img\\s+src\\s*=\\s*\"([^\"]+)\"[^>]*>";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(htmlCode);

		while (matcher.find()) {
			String src = matcher.group(1);
			String[] parts = src.split("/");
			String uuid = parts[parts.length - 1];
			uuids.add(uuid);
		}

		return uuids;
	}

}
