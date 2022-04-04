package kr.swcore.sderp.mis.service;

import kr.swcore.sderp.mis.dto.MisDTO;
import kr.swcore.sderp.util.SessionInfoGet;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class MisServiceImpl implements MisService{
    @Override
    public List<MisDTO> listHRduty(HttpSession session) {
        int compNo = SessionInfoGet.getCompNo(session);
        return null;
    }
}
