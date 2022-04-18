package kr.swcore.sderp.mis.service;

import kr.swcore.sderp.mis.dao.MisDAO;
import kr.swcore.sderp.mis.dto.MisDTO;
import kr.swcore.sderp.util.SessionInfoGet;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class MisServiceImpl implements MisService{
    @Inject
    MisDAO misDAO;
    @Override
    public List<MisDTO> listHRduty(HttpSession session, MisDTO dto) {
        int compNo = SessionInfoGet.getCompNo(session);
        dto.setCompNo(compNo);
        return misDAO.listHRduty(dto);
    }

    @Override
    public List<MisDTO> listHRcost(HttpSession session, MisDTO dto) {
        int compNo = SessionInfoGet.getCompNo(session);
        dto.setCompNo(compNo);
        return misDAO.listHRcost(dto);
    }

    @Override
    public List<MisDTO> listSopp(HttpSession session, MisDTO dto) {
        int compNo = SessionInfoGet.getCompNo(session);
        dto.setCompNo(compNo);
        return misDAO.listSopp(dto);
    }

    @Override
    public List<MisDTO> listSoppcost(HttpSession session, MisDTO dto) {
        int compNo = SessionInfoGet.getCompNo(session);
        dto.setCompNo(compNo);
        return misDAO.listSoppcost(dto);
    }

    @Override
    public List<MisDTO> listSoppmargin(HttpSession session, MisDTO dto) {
        int compNo = SessionInfoGet.getCompNo(session);
        dto.setCompNo(compNo);
        return misDAO.listSoppmargin(dto);
    }

    @Override
    public List<MisDTO> listBacinout(HttpSession session, MisDTO dto) {
        int compNo = SessionInfoGet.getCompNo(session);
        dto.setCompNo(compNo);
        return misDAO.listBacinout(dto);
    }

    @Override
    public List<MisDTO> listBacstatus(HttpSession session, MisDTO dto) {
        int compNo = SessionInfoGet.getCompNo(session);
        dto.setCompNo(compNo);
        return misDAO.listBacstatus(dto);
    }
}
