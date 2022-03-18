package kr.swcore.sderp.account.service;

import kr.swcore.sderp.account.dto.AccountDTO;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface AccountService {
    List<AccountDTO> listvat(HttpSession session, AccountDTO dto);
    List<AccountDTO> listbac(HttpSession session);
    List<AccountDTO> listCard(HttpSession session);
    List<AccountDTO> listvatitem(int vatId);
    List<AccountDTO> modalVatB(HttpSession session);
    List<AccountDTO> modalVatS(HttpSession session);
    AccountDTO checkVat(AccountDTO dto);
    AccountDTO cardCheck(AccountDTO dto);
    AccountDTO detailvat(int vatId);
    int insertVat(AccountDTO dto);
    int insertBac(AccountDTO dto);
    int insertCard(AccountDTO dto);
    int insertBacledger(AccountDTO dto);
    int insertCardLedger(AccountDTO dto);
    int insertVatitem(AccountDTO dto);
    int updvatStat(AccountDTO dto);
    AccountDTO selectVatCust(String vatNo);
	List<AccountDTO> connect_list(AccountDTO dto);
	List<AccountDTO> modalbB(String vatSerial);
	AccountDTO checkBac(AccountDTO dto);
	List<AccountDTO> bacSelectList(AccountDTO dto);
	AccountDTO bacSelectListCnt(AccountDTO dto);
	List<AccountDTO> cardSelectList(String cardSerial);
	int lastUpdate(AccountDTO dto);
	int lastUpdateCard(AccountDTO dto);
	int bacSerialUpdate(AccountDTO dto);
	List<AccountDTO> listvatSearch(HttpSession session, AccountDTO dto);
	List<AccountDTO> listvatB(HttpSession session, AccountDTO dto);
	List<AccountDTO> listvatSearchB(HttpSession session, AccountDTO dto);
	List<AccountDTO> listvatS(HttpSession session, AccountDTO dto);
	List<AccountDTO> listvatSearchS(HttpSession session, AccountDTO dto);
	List<AccountDTO> custVatListModal(AccountDTO dto);
	List<AccountDTO> treqCardList(AccountDTO dto);
	int updatevatlinkedcheck(AccountDTO dto);
	void cancelconnect(String linkDoc);
	void cancelconnect2(String linkDoc);
}
