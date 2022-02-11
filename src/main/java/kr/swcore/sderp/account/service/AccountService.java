package kr.swcore.sderp.account.service;

import kr.swcore.sderp.account.dto.AccountDTO;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface AccountService {
    List<AccountDTO> listvat(HttpSession session);
    List<AccountDTO> listbac(HttpSession session);
    List<AccountDTO> listvatitem(int vatId);
    List<AccountDTO> modalVatB(HttpSession session);
    List<AccountDTO> modalVatS(HttpSession session);
    AccountDTO checkVat(AccountDTO dto);
    AccountDTO detailvat(int vatId);
    int insertVat(AccountDTO dto);
    int insertBac(AccountDTO dto);
    int insertBacledger(AccountDTO dto);
    int insertVatitem(AccountDTO dto);
    int updvatStat(AccountDTO dto);
    AccountDTO selectVatCust(String vatNo);
	List<AccountDTO> connect_list(AccountDTO dto);
	List<AccountDTO> modalbB(String vatSerial);
	AccountDTO checkBac(AccountDTO dto);
	List<AccountDTO> bacSelectList(String bacSerial);
	int lastUpdate(AccountDTO dto);
}
