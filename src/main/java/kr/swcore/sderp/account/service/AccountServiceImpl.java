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
    public List<AccountDTO> listvat(HttpSession session) {
        int compNo = SessionInfoGet.getCompNo(session);
        return accountDAO.listvat(compNo);
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
    public int insertVatitem(AccountDTO dto) {
        return accountDAO.insertVatitem(dto);
    }

    @Override
    public int updvatStat(AccountDTO dto) {
        return accountDAO.updvatStat(dto);
    }
}
