package kr.swcore.sderp.product.service;

import kr.swcore.sderp.product.dao.ProductdataDAO;
import kr.swcore.sderp.product.dto.ProductdataDTO;
import kr.swcore.sderp.util.SessionInfoGet;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class ProductdataServiceImpl implements ProductdataService{
    @Inject
    ProductdataDAO productdataDAO;

    @Override
    public List<ProductdataDTO> listProductdata(HttpSession session, ProductdataDTO productdataDTO) {
        productdataDTO.setCompNo(SessionInfoGet.getCompNo(session));

        return null;
    }
}
