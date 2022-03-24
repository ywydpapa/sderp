package kr.swcore.sderp.account.dao;

import kr.swcore.sderp.account.dto.AccountDTO;

import java.util.List;

public interface AccountDAO {
    List<AccountDTO> listvat(AccountDTO dto);
	List<AccountDTO> sumBvat(AccountDTO dto);
	List<AccountDTO> sumSvat(AccountDTO dto);
	List<AccountDTO> sumBvatSearch(AccountDTO dto);
	List<AccountDTO> sumSvatSearch(AccountDTO dto);
	List<AccountDTO> listbac(int compNo);
    List<AccountDTO> listCard(int compNo);
    List<AccountDTO> listvatitem(int vatId);
    List<AccountDTO> modalVatB(int compNo);
    List<AccountDTO> modalVatS(int compNo);
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
	List<AccountDTO> listvatSearch(AccountDTO dto);
	List<AccountDTO> listvatB(AccountDTO dto);
	List<AccountDTO> listvatSearchB(AccountDTO dto);
	List<AccountDTO> listvatS(AccountDTO dto);
	List<AccountDTO> listvatSearchS(AccountDTO dto);
	List<AccountDTO> listvatT(AccountDTO dto);
	List<AccountDTO> listvatSearchT(AccountDTO dto);
	List<AccountDTO> custVatListModal(AccountDTO dto);
	List<AccountDTO> treqCardList(AccountDTO dto);
	int updatevatlinkedcheck(AccountDTO dto);
	void cancelconnect_linkedcheck(String linkDoc);
	void cancelconnect_linkDoc(String linkDoc);
	int bacCheckConnect(AccountDTO dto);
	int billInsert(AccountDTO dto);
	List<AccountDTO> vatSelectList(AccountDTO dto);
	int sVatToChange(AccountDTO dto);
}
