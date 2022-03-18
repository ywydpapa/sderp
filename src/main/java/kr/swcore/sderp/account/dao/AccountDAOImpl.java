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
    public List<AccountDTO> listvat(AccountDTO dto) {
        return sqlSession.selectList("account.listVat", dto);
    }

    @Override
    public List<AccountDTO> listbac(int compNo) {
        return sqlSession.selectList("account.baclist", compNo);
    }
    
    @Override
    public List<AccountDTO> listCard(int compNo) {
        return sqlSession.selectList("account.listCard", compNo);
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
    public int insertBac(AccountDTO dto) {
        return sqlSession.insert("account.insertbac",dto);
    }
    
    @Override
    public int insertCard(AccountDTO dto) {
        return sqlSession.insert("account.insertCard",dto);
    }

    @Override
    public int insertBacledger(AccountDTO dto) {
        return sqlSession.insert("account.insertbacledger",dto);
    }
    
    @Override
    public int insertCardLedger(AccountDTO dto) {
        return sqlSession.insert("account.insertCardLedger",dto);
    }

    @Override
    public int insertVatitem(AccountDTO dto) {
        return sqlSession.insert("account.insertVatItem", dto);
    }

    @Override
    public int updvatStat(AccountDTO dto) {
        return sqlSession.update("account.updVatStatus", dto);
    }

	@Override
	public AccountDTO selectVatCust(String vatNo) {
		return sqlSession.selectOne("account.selectVatCust", vatNo);
	}

	@Override
	public List<AccountDTO> connect_list(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.connect_list",dto);
	}

	@Override
	public List<AccountDTO> modalbB(String vatSerial) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.connect_list", vatSerial);
	}

	@Override
	public AccountDTO checkBac(AccountDTO dto) {
		return sqlSession.selectOne("account.checkBac", dto);
	}
	
	@Override
	public AccountDTO cardCheck(AccountDTO dto) {
		return sqlSession.selectOne("account.cardCheck", dto);
	}

	@Override
	public List<AccountDTO> bacSelectList(AccountDTO dto) {
		return sqlSession.selectList("account.bacSelectList", dto);
	}
	
	@Override
	public AccountDTO bacSelectListCnt(AccountDTO dto) {
		return sqlSession.selectOne("account.bacSelectListCnt", dto);
	}
	
	@Override
	public List<AccountDTO> cardSelectList(String cardSerial) {
		return sqlSession.selectList("account.cardSelectList", cardSerial);
	}

	@Override
	public int lastUpdate(AccountDTO dto) {
		return sqlSession.update("account.lastUpdate", dto);
	}
	
	@Override
	public int lastUpdateCard(AccountDTO dto) {
		return sqlSession.update("account.lastUpdateCard", dto);
	}

	@Override
	public int bacSerialUpdate(AccountDTO dto) {
		return sqlSession.update("account.bacSerialUpdate", dto);
	}

	@Override
	public List<AccountDTO> listvatSearch(AccountDTO dto) {
		return sqlSession.selectList("account.listVatSearch", dto);
	}

	@Override
	public List<AccountDTO> listvatB(AccountDTO dto) {
		return sqlSession.selectList("account.listVatB", dto);
	}

	@Override
	public List<AccountDTO> listvatSearchB(AccountDTO dto) {
		return sqlSession.selectList("account.listVatSearchB", dto);
	}

	@Override
	public List<AccountDTO> listvatS(AccountDTO dto) {
		return sqlSession.selectList("account.listVatS", dto);
	}

	@Override
	public List<AccountDTO> listvatSearchS(AccountDTO dto) {
		return sqlSession.selectList("account.listVatSearchS", dto);
	}

	@Override
	public List<AccountDTO> custVatListModal(AccountDTO dto) {
		return sqlSession.selectList("account.custVatListModal", dto);
	}

	@Override
	public List<AccountDTO> treqCardList(AccountDTO dto) {
		return sqlSession.selectList("account.treqCardList", dto);
	}

	@Override
	public int updatevatlinkedcheck(AccountDTO dto) {
		// TODO Auto-generated method stub
		 return sqlSession.update("account.updatevatlinkedcheck", dto);
	}

	@Override
	public void cancelconnect(String linkDoc) {
		// TODO Auto-generated method stub
		sqlSession.update("account.cancelconnect", linkDoc);
	}

	@Override
	public void cancelconnect2(String linkDoc) {
		// TODO Auto-generated method stub
		sqlSession.delete("account.cancelconnect2", linkDoc);
	}
	
}
