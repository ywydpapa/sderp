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
	public List<AccountDTO> sumBvat(AccountDTO dto) {
		return sqlSession.selectList("account.sumBVat", dto);
	}

	@Override
	public List<AccountDTO> sumSvat(AccountDTO dto) {
		return sqlSession.selectList("account.sumSVat",dto);
	}

	@Override
	public List<AccountDTO> sumBvatSearch(AccountDTO dto) {
		return sqlSession.selectList("account.sumBVatSearch",dto);
	}

	@Override
	public List<AccountDTO> sumSvatSearch(AccountDTO dto) {
		return sqlSession.selectList("account.sumSVatSearch",dto);
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
	public List<AccountDTO> listvatT(AccountDTO dto) {
		return sqlSession.selectList("account.listVatT",dto);
	}

	@Override
	public List<AccountDTO> listvatSearchT(AccountDTO dto) {
		return sqlSession.selectList("account.listVatSearchT", dto);
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
	public int bacCheckConnect(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("account.bacCheckConnect", dto);
	}

	@Override
	public int billInsert(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("account.billInsert", dto);
	}

	@Override
	public List<AccountDTO> vatSelectList(AccountDTO dto) {
		return sqlSession.selectList("account.vatSelectList", dto);
	}

	@Override
	public int sVatToChange(AccountDTO dto) {
		return sqlSession.update("account.sVatToChange", dto);
	}
	
	@Override
	public List<AccountDTO> new_bac_connect_list(String bacId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.new_bac_connect_list",bacId);
	}
	
	@Override
	public List<AccountDTO> bac_connect_list(String bacId) {
		return sqlSession.selectList("account.bac_connect_list",bacId);
	}
	
	@Override
	public void updatevatmultilinkedcheck(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("account.updatevatmultilinkedcheck", dto);
	}

	@Override
	public void updatelogIdlink(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("account.updatelogIdlink", dto);
	}


	@Override
	public int connnectlist_Num(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("account.connnectlist_Num", dto);
	}

	@Override
	public void deleteconnectlist(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.delete("account.deleteconnectlist", dto);
	}

	@Override
	public int searchserial(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("account.searchserial", dto);
	}

	@Override
	public void cancel_connect_final(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("account.cancel_connect_final", dto);

	}
	@Override
	public void cancelconnect_linkedcheck(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("account.cancelconnect_linkedcheck", dto);
	}

	@Override
	public void cancelconnect_linkDoc(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.delete("account.cancelconnect_linkDoc", dto);
	}

	@Override
	public String number_linkDoc(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("account.number_linkDoc", dto);
	}

	@Override
	public void change_originlinkDoc(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.insert("account.change_originlinkDoc", dto);
	}

	@Override
	public List<AccountDTO> dataprice(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.dataprice", dto);
	}

	@Override
	public List<AccountDTO> total_price(AccountDTO dto) {
		// TODO Auto-generated method stub
		return  sqlSession.selectList("account.total_price", dto);
	}

	@Override
	public void update_s5(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("account.update_s5", dto);
	}

	@Override
	public void update_s3(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("account.update_s3", dto);
	}

	@Override
	public void update_b5(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("account.update_b5", dto);
	}

	@Override
	public void update_b3(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("account.update_b3", dto);
	}
}
