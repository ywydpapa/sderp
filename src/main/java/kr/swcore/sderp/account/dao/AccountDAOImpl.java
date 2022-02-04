package kr.swcore.sderp.account.dao;

import kr.swcore.sderp.account.dto.AccountDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class AccountDAOImpl implements AccountDAO {
    @Inject
    SqlSession sqlSession;


    @Override
    public List<AccountDTO> listvat(int compNo) {
        return sqlSession.selectList("account.listVat", compNo);
    }

    @Override
    public List<AccountDTO> listvatitem(int vatId) {
        return sqlSession.selectList("account.listVatitem", vatId);
    }

    @Override
    public List<AccountDTO> modalVatB(int compNo) {
        return sqlSession.selectList("account.modalVatB",compNo);
    }

    @Override
    public List<AccountDTO> modalVatS(int compNo) {
        return sqlSession.selectList("account.modalVatS",compNo);
    }

    @Override
    public AccountDTO checkVat(AccountDTO dto) {
        return sqlSession.selectOne("account.checkVat", dto);
    }

    @Override
    public AccountDTO detailvat(int vatId) {
        return sqlSession.selectOne("account.detailVat", vatId);
    }

    @Override
    public int insertVat(AccountDTO dto) {
        return sqlSession.insert("account.insertVat", dto);
    }

    @Override
    public int insertVatitem(AccountDTO dto) {
        return sqlSession.insert("account.insertVatItem", dto);
    }
}
