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
	public List<AccountDTO> bacSelectList(String bacSerial) {
		return accountDAO.bacSelectList(bacSerial);
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
	public List<AccountDTO> custVatListModal(AccountDTO dto) {
		return accountDAO.custVatListModal(dto);
	}

	@Override
	public List<AccountDTO> treqCardList(AccountDTO dto) {
		return accountDAO.treqCardList(dto);
	}
}
