package kr.swcore.sderp.organiz.Service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.swcore.sderp.organiz.dao.OrganizDAO;
import kr.swcore.sderp.organiz.dto.OrganizDTO;

@Service
public class OrganizServiceImpl implements OrganizService {

	@Inject
	OrganizDAO organizDao;
	
	@Override
	public List<OrganizDTO> listDept(HttpSession session) {
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		return organizDao.listDept(compNo);
	}

}
