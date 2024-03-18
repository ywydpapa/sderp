package kr.swcore.sderp.store.service;

import kr.swcore.sderp.store.dto.StoreInoutDTO;

import javax.servlet.http.HttpSession;
import java.util.List;
public interface StoreInoutService {

    List<StoreInoutDTO> listStore(HttpSession session,StoreInoutDTO dto);

    int insertInoutStore(HttpSession session,StoreInoutDTO dto);
	int outSoppInsert(HttpSession session,StoreInoutDTO dto);

    List<StoreInoutDTO> storeDetail(int prodcutNo);

	int updateInoutStore(HttpSession session, StoreInoutDTO dto);

	int deleteStore(HttpSession session, StoreInoutDTO dto);

	List<StoreInoutDTO> getInoutStoreList(int inoutNo);

	List<StoreInoutDTO> getAllList(HttpSession session, StoreInoutDTO dto);

	List<StoreInoutDTO> search(HttpSession session, StoreInoutDTO sdto);

	StoreInoutDTO getInout(StoreInoutDTO dto);

	int updateEtc(HttpSession session, StoreInoutDTO idto);
	int contInoutDelete(int inoutNo);
}
 