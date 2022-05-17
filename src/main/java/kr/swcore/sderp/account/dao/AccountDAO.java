package kr.swcore.sderp.account.dao;

import kr.swcore.sderp.account.dto.AccountDTO;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface AccountDAO {
    List<AccountDTO> listvat(AccountDTO dto);
	List<AccountDTO> sumBvat(AccountDTO dto);
	List<AccountDTO> custVatListB(AccountDTO dto);
	List<AccountDTO> ledgerListS(AccountDTO dto);
	List<AccountDTO> ledgerListB(AccountDTO dto);
	List<AccountDTO> sumSvat(AccountDTO dto);
	List<AccountDTO> custVatListS(AccountDTO dto);
	List<AccountDTO> sumBvatSearch(AccountDTO dto);
	List<AccountDTO> sumSvatSearch(AccountDTO dto);
	List<AccountDTO> listbac(int compNo);
    List<AccountDTO> listCard(int compNo);
    List<AccountDTO> listvatitem(int vatId);
    List<AccountDTO> modalVatB(AccountDTO dto);
    List<AccountDTO> modalVatS(AccountDTO dto);
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
	List<AccountDTO> cardSelectList(AccountDTO dto);
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
	int bacCheckConnect(AccountDTO dto);
	int billInsert(AccountDTO dto);

	List<AccountDTO> vatSelectList(AccountDTO dto);
	int sVatToChange(AccountDTO dto);
	
	List<AccountDTO> bac_connect_list(String bacId);
	List<AccountDTO> new_bac_connect_list(String bacId);
	void updatevatmultilinkedcheck(AccountDTO dto);
	void updatelogIdlink(AccountDTO dto);

	int connnectlist_Num(AccountDTO dto);
	void deleteconnectlist(AccountDTO dto);
	int searchserial(AccountDTO dto);
	void cancel_connect_final(AccountDTO dto);
	void cancelconnect_linkedcheck(AccountDTO dto);
	void cancelconnect_linkDoc(AccountDTO dto);
	String number_linkDoc(AccountDTO dto);
	void change_originlinkDoc(AccountDTO dto);
	List<AccountDTO> dataprice(AccountDTO dto);
	List<AccountDTO> total_price(AccountDTO dto);
	void update_s5(AccountDTO dto);
	void update_s3(AccountDTO dto);
	void update_b5(AccountDTO dto);
	void update_b3(AccountDTO dto);
	void update_vatStatus(AccountDTO dto);
	List<AccountDTO> select_vatStatus(AccountDTO dto);
	void update_vatStatus_B(AccountDTO dto);
	List<AccountDTO> endusernamelist(AccountDTO dto);
	List<AccountDTO> endusernamelist_cont(AccountDTO dto);
	List<AccountDTO> vatHtmlListB(AccountDTO dto);
	List<AccountDTO> vatHtmlListS(AccountDTO dto);
	int bacUpdateMemo(AccountDTO dto);
	int bacDrawInsert(AccountDTO dto);
	int bacDrawDelect(AccountDTO dto);
	int bacDrawAfterUpdate(AccountDTO dto);

	AccountDTO selectExcelData(AccountDTO dto);

	void bacCheckConnect_modal_update(AccountDTO dto);
	List<AccountDTO> checktotalprice_vat_and_detail(AccountDTO dto);
	int detail_Count_equal_baclogId(AccountDTO dto);
	void deleteconnectlist_sub(AccountDTO dto);
	List<AccountDTO> dataprice_secound(AccountDTO dto);
	List<AccountDTO> checktotalprice_vat_and_detail_out(AccountDTO dto);

	AccountDTO bacCalSelect(AccountDTO dto);

	List<AccountDTO> list_secound_modalVatB(AccountDTO dto);
	void bacCheckConnect_modal_baclogId_memo(AccountDTO dto);
	List<AccountDTO> list_secound_modalVatB_secound(String bacId);
	List<AccountDTO> getlicked_price(AccountDTO dto);
	List<AccountDTO> getlicked_price_secound(AccountDTO dto);
	void bacCheckConnect_modal_update_secound(AccountDTO dto);
	List<AccountDTO> check_link_vatandbac(AccountDTO dto);
	AccountDTO check_link_vatandbacCnt(AccountDTO dto);
	List<AccountDTO> check_remain_money_from_swc_vat(AccountDTO dto);
	void update_check_remain_money_from_swc_vat(AccountDTO dto);
	void update_check_remain_money_from_swc_vat_B(AccountDTO dto);
	AccountDTO cardSelectListCount(AccountDTO dto);
	List<AccountDTO> sumSvat_sub(AccountDTO dto);
	List<AccountDTO> sumBvat_sub(AccountDTO dto);
	List<AccountDTO> check_lincked_last(AccountDTO dto);
	List<AccountDTO> custSelectVatList(AccountDTO dto);
	List<AccountDTO> custVatListCount(AccountDTO dto);
	List<AccountDTO> custVatListHtmlS(AccountDTO dto);
	List<AccountDTO> custVatListHtmlB(AccountDTO dto);
	int productUpdate(AccountDTO dto);
	AccountDTO modalVatBCnt(AccountDTO dto);
	AccountDTO modalVatSCnt(AccountDTO dto);
	List<AccountDTO> modalVatB(int compNo);
	List<AccountDTO> modalVatS(int compNo);
	AccountDTO custBalanceS(AccountDTO dto);
	AccountDTO custBalanceB(AccountDTO dto);
	List<AccountDTO> listusercontribution(AccountDTO dto);
	List<AccountDTO> listusercontributionCnt(AccountDTO dto);
	void insert_contribution_percent(AccountDTO dto);
	List<AccountDTO> userList(int compNo);
	void update_card_data(AccountDTO dto);
	List<AccountDTO> Search_treqCardList(AccountDTO dto);
	List<AccountDTO> connect_cont_and_vat(AccountDTO dto);
}
