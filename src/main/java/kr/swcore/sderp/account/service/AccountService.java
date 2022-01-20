package kr.swcore.sderp.account.service;

import kr.swcore.sderp.account.dto.AccountDTO;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface AccountService {
    List<AccountDTO> listvat(HttpSession session);
    List<AccountDTO> listvatitem(int vatId);
    AccountDTO detailvat(int vatId);
    int insertVat(AccountDTO dto);
    int insertVatitem(AccountDTO dto);
}
