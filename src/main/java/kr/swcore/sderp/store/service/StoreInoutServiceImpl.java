package kr.swcore.sderp.store.service;

import kr.swcore.sderp.product.dto.ProductDTO;
import kr.swcore.sderp.store.dto.StoreDTO;
import kr.swcore.sderp.store.dto.StoreInoutDTO;
import kr.swcore.sderp.store.dao.StoreDAO;
import kr.swcore.sderp.store.dao.StoreInoutDAO;
import kr.swcore.sderp.util.SessionInfoGet;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class StoreInoutServiceImpl implements StoreInoutService{

    @Inject
    StoreInoutDAO storeInoutDao;

	@Override
	public List<StoreInoutDTO> listStore(HttpSession session, StoreInoutDTO dto) {
		
		return null;
	}

	@Override
	public int insertInoutStore(HttpSession session, StoreInoutDTO dto) {
	    Integer compNo = SessionInfoGet.getCompNo(session);
        dto.setCompNo(compNo);
	return storeInoutDao.insertInoutStore(dto);
	
	}

	@Override
	public int outSoppInsert(HttpSession session, StoreInoutDTO dto) {
		Integer compNo = SessionInfoGet.getCompNo(session);
		dto.setCompNo(compNo);
		return storeInoutDao.outSoppInsert(dto);
	}

	@Override
	public List<StoreInoutDTO> storeDetail(int prodcutNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateInoutStore(HttpSession session, StoreInoutDTO dto) {
		return storeInoutDao.updateInout(dto);
	}

	@Override
	public int deleteStore(HttpSession session, StoreInoutDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<StoreInoutDTO> getInoutStoreList(int inoutNo) {
		return storeInoutDao.getInoutStoreList(inoutNo);
	
	}

	@Override
	public List<StoreInoutDTO> getAllList(HttpSession session, StoreInoutDTO dto) {
		return storeInoutDao.getAllList(dto);
	
	}

	@Override
	public List<StoreInoutDTO> search(HttpSession session, StoreInoutDTO sdto) {
		Integer compNo = SessionInfoGet.getCompNo(session);
        sdto.setCompNo(compNo);
        return storeInoutDao.search(sdto);
	}

	@Override
	public StoreInoutDTO getInout(StoreInoutDTO dto) {
		  return storeInoutDao.getInOut(dto);
	}

	@Override
	public int updateEtc(HttpSession session, StoreInoutDTO idto) {
		// TODO Auto-generated method stub
		return storeInoutDao.updateEtc(idto);
	}

	@Override
	public int contInoutDelete(int inoutNo) {
		return storeInoutDao.contInoutDelete(inoutNo);
	}
}