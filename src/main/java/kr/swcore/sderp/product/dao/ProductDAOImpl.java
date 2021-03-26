package kr.swcore.sderp.product.dao;
import java.util.List;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.swcore.sderp.product.dto.ProductDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ProductDTO> listProduct() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.listProduct");
	}
	
	@Override
	public List<ProductDTO> listProduct(SoppDTO soppdto) {
		return sqlSession.selectList("product.listProduct", soppdto);
	}

	@Override
	public ProductDTO detailProduct(int productNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product.detailProduct", productNo);
	}

	@Override
	public int updateProduct(ProductDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("product.updateProduct", dto);
	}

	@Override
	public int deleteProduct(int productNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("product.deleteProduct", productNo);
	}

	@Override
	public int insertProduct(ProductDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("product.insertProduct", dto);

	}

	@Override
	public String fileInfo(int productNo) {
		// TODO Auto-generated method stub
		return null;
	}

	


}
