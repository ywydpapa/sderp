package kr.swcore.sderp.product;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.swcore.sderp.product.dto.ProductDTO;
import kr.swcore.sderp.product.service.ProductService;

@Controller

@RequestMapping("/product/*")
public class ProductController {
	
	@Inject
	ProductService productService;
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
		mav.setViewName("product/list");
		mav.addObject("list", productService.listProduct(session));
		return mav;
	}
	
	@RequestMapping("/detail/{productNo}")
	public ModelAndView detail(HttpSession session, @PathVariable("productNo") int productNo, ModelAndView mav) {
		mav.setViewName("product/detail");
		mav.addObject("dto", productService.detailProduct(session, productNo));
		return mav;
	}
	
	@RequestMapping("write.do")
	public String write() {
		return "product/write";
	}

	@RequestMapping("insert.do")
	public ResponseEntity<?> insert(HttpSession session, @ModelAttribute ProductDTO dto) {
		Map<String, Object> param = new HashMap<>();
		param.put("code", productService.insertProduct(session, dto));
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("update.do")
	public ResponseEntity<?> update(HttpSession session, @ModelAttribute ProductDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int result = productService.updateProduct(session, dto);
		param.put("code", (String.valueOf(result)));
		return ResponseEntity.ok(param);
	}
	
	
	@RequestMapping("delete.do")
			public ResponseEntity<?> delete(HttpSession session, @ModelAttribute ProductDTO dto) {
			Map<String, Object> param = new HashMap<>();
			int productUpdate = productService.deleteProduct(session, dto.getProductNo());
			if (productUpdate >0) {
				param.put("code","10001"); 
			}
			else {param.put("codo","20001");
			}
			return ResponseEntity.ok(param);
		}
			

}
