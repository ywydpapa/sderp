package kr.swcore.sderp.account.service;

import kr.swcore.sderp.account.dao.AccountDAO;
import kr.swcore.sderp.account.dto.AccountDTO;
import kr.swcore.sderp.util.SessionInfoGet;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class AccountServiceImpl implements AccountService {

    @Inject
    AccountDAO accountDAO;

    @Override
    public List<AccountDTO> listvat(HttpSession session, AccountDTO dto) {
        int compNo = SessionInfoGet.getCompNo(session);
        String listDateFrom = SessionInfoGet.getlistDateFrom(session);
        dto.setCompNo(compNo);
        dto.setListDateFrom(listDateFrom);
        return accountDAO.listvat(dto);
    }

	@Override
	public List<AccountDTO> sumBvat(HttpSession session, AccountDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		String listDateFrom = SessionInfoGet.getlistDateFrom(session);
		dto.setCompNo(compNo);
		dto.setListDateFrom(listDateFrom);
		return accountDAO.sumBvat(dto);
	}

	@Override
	public List<AccountDTO> sumSvat(HttpSession session, AccountDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		String listDateFrom = SessionInfoGet.getlistDateFrom(session);
		dto.setCompNo(compNo);
		dto.setListDateFrom(listDateFrom);
		return accountDAO.sumSvat(dto);
	}

	@Override
	public List<AccountDTO> sumBvatSearch(HttpSession session, AccountDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		String listDateFrom = SessionInfoGet.getlistDateFrom(session);
		dto.setCompNo(compNo);
		dto.setListDateFrom(listDateFrom);
		return accountDAO.sumBvatSearch(dto);
	}

	@Override
	public List<AccountDTO> sumSvatSearch(HttpSession session, AccountDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		String listDateFrom = SessionInfoGet.getlistDateFrom(session);
		dto.setCompNo(compNo);
		dto.setListDateFrom(listDateFrom);
		return accountDAO.sumSvatSearch(dto);
	}

	@Override
    public List<AccountDTO> listbac(HttpSession session) {
        int compNo = SessionInfoGet.getCompNo(session);
        return accountDAO.listbac(compNo);
    }
    
    @Override
    public List<AccountDTO> listCard(HttpSession session) {
        int compNo = SessionInfoGet.getCompNo(session);
        return accountDAO.listCard(compNo);
    }

    @Override
    public List<AccountDTO> listvatitem(int vatId) {
        return accountDAO.listvatitem(vatId);
    }

    @Override
    public List<AccountDTO> modalVatB(HttpSession session) {
        int compNo = SessionInfoGet.getCompNo(session);
        return accountDAO.modalVatB(compNo);
    }

    @Override
    public List<AccountDTO> modalVatS(HttpSession session) {
        int compNo = SessionInfoGet.getCompNo(session);
        return accountDAO.modalVatS(compNo);
    }

    @Override
    public AccountDTO checkVat(AccountDTO dto) {
        return accountDAO.checkVat(dto);
    }

    @Override
    public AccountDTO detailvat(int vatId) {
        return accountDAO.detailvat(vatId);
    }

    @Override
    public int insertVat(AccountDTO dto) {
        return accountDAO.insertVat(dto);
    }

    @Override
    public int insertBac(AccountDTO dto) {
        return accountDAO.insertBac(dto);
    }
    
    @Override
    public int insertCard(AccountDTO dto) {
        return accountDAO.insertCard(dto);
    }

    @Override
    public int insertBacledger(AccountDTO dto) {
        return accountDAO.insertBacledger(dto);
    }
    
    @Override
    public int insertCardLedger(AccountDTO dto) {
        return accountDAO.insertCardLedger(dto);
    }

    @Override
    public int insertVatitem(AccountDTO dto) {
        return accountDAO.insertVatitem(dto);
    }

    @Override
    public int updvatStat(AccountDTO dto) {
        return accountDAO.updvatStat(dto);
    }

	@Override
	public AccountDTO selectVatCust(String vatNo) {
		return accountDAO.selectVatCust(vatNo);
	}

	@Override
	public List<AccountDTO> connect_list(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.connect_list(dto);
	}

	@Override
	public List<AccountDTO> modalbB(String vatSerial) {
    	return accountDAO.modalbB(vatSerial);
	}

	@Override
	public AccountDTO checkBac(AccountDTO dto) {
		return accountDAO.checkBac(dto);
	}
	
	@Override
	public AccountDTO cardCheck(AccountDTO dto) {
		return accountDAO.cardCheck(dto);
	}

	@Override
	public List<AccountDTO> bacSelectList(AccountDTO dto) {
		return accountDAO.bacSelectList(dto);
	}
	
	@Override
	public AccountDTO bacSelectListCnt(AccountDTO dto) {
		return accountDAO.bacSelectListCnt(dto);
	}
	
	@Override
	public List<AccountDTO> cardSelectList(String cardSerial) {
		return accountDAO.cardSelectList(cardSerial);
	}

	@Override
	public int lastUpdate(AccountDTO dto) {
		return accountDAO.lastUpdate(dto);
	}
	
	@Override
	public int lastUpdateCard(AccountDTO dto) {
		return accountDAO.lastUpdateCard(dto);
	}

	@Override
	public int bacSerialUpdate(AccountDTO dto) {
		return accountDAO.bacSerialUpdate(dto);
	}

	@Override
	public List<AccountDTO> listvatSearch(HttpSession session, AccountDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		String listDateFrom = SessionInfoGet.getlistDateFrom(session);
        dto.setCompNo(compNo);
        dto.setListDateFrom(listDateFrom);
		return accountDAO.listvatSearch(dto);
	}

	@Override
	public List<AccountDTO> listvatB(HttpSession session, AccountDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
        String listDateFrom = SessionInfoGet.getlistDateFrom(session);
        dto.setCompNo(compNo);
        dto.setListDateFrom(listDateFrom);
        return accountDAO.listvatB(dto);
	}

	@Override
	public List<AccountDTO> listvatSearchB(HttpSession session, AccountDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		String listDateFrom = SessionInfoGet.getlistDateFrom(session);
        dto.setCompNo(compNo);
        dto.setListDateFrom(listDateFrom);
		return accountDAO.listvatSearchB(dto);
	}

	@Override
	public List<AccountDTO> listvatS(HttpSession session, AccountDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
        String listDateFrom = SessionInfoGet.getlistDateFrom(session);
        dto.setCompNo(compNo);
        dto.setListDateFrom(listDateFrom);
        return accountDAO.listvatS(dto);
	}

	@Override
	public List<AccountDTO> listvatSearchS(HttpSession session, AccountDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		String listDateFrom = SessionInfoGet.getlistDateFrom(session);
        dto.setCompNo(compNo);
        dto.setListDateFrom(listDateFrom);
		return accountDAO.listvatSearchS(dto);
	}

	@Override
	public List<AccountDTO> listvatT(HttpSession session, AccountDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		String listDateFrom = SessionInfoGet.getlistDateFrom(session);
		dto.setCompNo(compNo);
		dto.setListDateFrom(listDateFrom);
		return accountDAO.listvatT(dto);
	}

	@Override
	public List<AccountDTO> listvatSearchT(HttpSession session, AccountDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		String listDateFrom = SessionInfoGet.getlistDateFrom(session);
		dto.setCompNo(compNo);
		dto.setListDateFrom(listDateFrom);
		return accountDAO.listvatSearchT(dto);
	}

	@Override
	public List<AccountDTO> custVatListModal(AccountDTO dto) {
		return accountDAO.custVatListModal(dto);
	}

	@Override
	public List<AccountDTO> treqCardList(AccountDTO dto) {
		return accountDAO.treqCardList(dto);
	}

	@Override
	public int updatevatlinkedcheck(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.updatevatlinkedcheck(dto);
	}

	@Override
	public int bacCheckConnect(AccountDTO dto) {
		return accountDAO.bacCheckConnect(dto);
	}

	@Override
	public int billInsert(AccountDTO dto) {
		return accountDAO.billInsert(dto);
	}

	@Override

	public List<AccountDTO> vatSelectList(int contNo) {
		AccountDTO dto = new AccountDTO();
		dto.setContNo(contNo);
		
		return accountDAO.vatSelectList(dto);
	}

	@Override
	public int sVatToChange(AccountDTO dto) {
		return accountDAO.sVatToChange(dto);
	}
	
	@Override
	public List<AccountDTO> bac_connect_list(String bacId) {
        return accountDAO.bac_connect_list(bacId);
	}
	
	@Override
	public List<AccountDTO> new_bac_connect_list(String bacId) {
		// TODO Auto-generated method stub
		 return accountDAO.new_bac_connect_list(bacId);
	}
	
	@Override
	public void cancelconnect_linkedcheck(AccountDTO dto) {
		// TODO Auto-generated method stub
		accountDAO.cancelconnect_linkedcheck(dto);
	}
	@Override
	public void cancelconnect_linkDoc(AccountDTO dto) {
		// TODO Auto-generated method stub
		accountDAO.cancelconnect_linkDoc(dto);
	}

	@Override
	public void updatevatmultilinkedcheck(AccountDTO dto) {
		// TODO Auto-generated method stub
		accountDAO.updatevatmultilinkedcheck(dto);
	}

	@Override
	public void updatelogIdlink(AccountDTO dto) {
		// TODO Auto-generated method stub
		accountDAO.updatelogIdlink(dto);
	}


	@Override
	public int connnectlist_Num(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.connnectlist_Num(dto);
	}

	@Override
	public void deleteconnectlist(AccountDTO dto) {
		// TODO Auto-generated method stub
		accountDAO.deleteconnectlist(dto);
	}

	@Override
	public int searchserial(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.searchserial(dto);
	}
	
	@Override
	public void cancel_connect_final(AccountDTO dto) {
		// TODO Auto-generated method stub
		accountDAO.cancel_connect_final(dto);

	}

	@Override
	public String number_linkDoc(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.number_linkDoc(dto);
	}

	@Override
	public void change_originlinkDoc(AccountDTO dto) {
		// TODO Auto-generated method stub
		accountDAO.change_originlinkDoc(dto);
	}

	@Override
	public List<AccountDTO> dataprice(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.dataprice(dto);
	}

	@Override
	public List<AccountDTO> total_price(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.total_price(dto);
	}

	@Override
	public void update_s5(AccountDTO dto) {
		// TODO Auto-generated method stub
		accountDAO.update_s5(dto);
	}
	@Override
	public void update_s3(AccountDTO dto) {
		// TODO Auto-generated method stub
		accountDAO.update_s3(dto);
	}

	@Override
	public void update_b5(AccountDTO dto) {
		// TODO Auto-generated method stub
		accountDAO.update_b5(dto);
	}

	@Override
	public void update_b3(AccountDTO dto) {
		// TODO Auto-generated method stub
		accountDAO.update_b3(dto);
	}
}
