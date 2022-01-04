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
    public List<GwDTO> listUserAtt(HttpSession compNo) {
        return gwDao.listUserAtt(compNo);
    }

    @Override
    public List<GwDTO> listUserAttbyuser(int userNo) {
        return gwDao.listUserAttbyuser(userNo);
    }

    @Override
    public List<GwDTO> listMyDoc(HttpSession userNo) {
        return gwDao.listMyDoc(userNo);
    }

    @Override
    public List<GwDTO> listEst(HttpSession compNo) {

        return gwDao.listEst(compNo);
    }

    @Override
    public List<GwDTO> listEstitems(GwDTO dto) {

        return gwDao.listEstitems(dto);
    }

    @Override
    public GwDTO detailEst(String estId) {

        return gwDao.detailEst(estId);
    }

    @Override
    public GwDTO detailDoc(int docNo) {

        return gwDao.detailDoc(docNo);
    }

    @Override
    public GwDTO detailUserAttend(int attendId) {
        return gwDao.detailUserAtt(attendId);
    }

    @Override
    public int insertDoc(GwDTO dto) {

        return gwDao.insertDoc(dto);
    }

    @Override
    public int insertUserAtt(GwDTO dto) {
        return gwDao.insertUserAtt(dto);
    }

    @Override
    public int updateDoc(GwDTO dto) {

        return gwDao.updateDoc(dto);
    }

    @Override
    public int updateUserAtt(GwDTO dto) {
        return gwDao.updateUserAtt(dto);
    }

    @Override
    public int updateDocAppLvl(GwDTO dto) {

        return gwDao.updateDocAppLvl(dto);
    }

    @Override
    public int deleteDoc(int docNo) {

        return gwDao.deleteDoc(docNo);
    }

    @Override
    public int deleteUserAtt(int attendId) {
        return gwDao.deleteUserAtt(attendId);
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
