package kr.swcore.sderp.gw.service;

import kr.swcore.sderp.gw.dao.GwDAO;
import kr.swcore.sderp.gw.dto.GwDTO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class GwServiceImpl implements GwService{

    @Inject
    GwDAO gwDao;

    @Override
    public List<GwDTO> listDoc2(HttpSession compNo) {
        return gwDao.listDoc2(compNo);
    }

    @Override
    public GwDTO detailDoc(int docNo) {
        return gwDao.detailDoc(docNo);
    }

    @Override
    public int insertDoc(GwDTO dto) {
        return gwDao.insertDoc(dto);
    }

    @Override
    public int updateDoc(GwDTO dto) {
        return gwDao.updateDoc(dto);
    }

    @Override
    public int deleteDoc(int docNo) {
        return gwDao.deleteDoc(docNo);
    }

    @Override
    public int insertEst(GwDTO dto) {
        return gwDao.insertEst(dto);
    }

    @Override
    public int insertEstitems(GwDTO dto) {
        return gwDao.insertEstitems(dto);
    }
}
