package kr.swcore.sderp.account.dao;

import kr.swcore.sderp.account.dto.AccountDTO;

import java.util.List;

public interface AccountDAO {
    List<AccountDTO> listvat(int compNo);
    List<AccountDTO> listbac(int compNo);
    List<AccountDTO> listvatitem(int vatId);
    List<AccountDTO> modalVatB(int compNo);
    List<AccountDTO> modalVatS(int compNo);
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
	int bacSerialUpdate(AccountDTO dto);
	List<AccountDTO> listvatSearch(AccountDTO dto);
}
