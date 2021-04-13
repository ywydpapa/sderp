package kr.swcore.sderp;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.swcore.sderp.code.dto.CodeDTO;
import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.cont.dto.ContDTO;
import kr.swcore.sderp.cont.service.ContService;
import kr.swcore.sderp.cust.dto.CustDTO;
import kr.swcore.sderp.cust.service.CustService;
import kr.swcore.sderp.product.dto.ProductDTO;
import kr.swcore.sderp.product.service.ProductService;
import kr.swcore.sderp.sales.dto.SalesDTO;
import kr.swcore.sderp.sales.service.SalesService;
import kr.swcore.sderp.salesTarget.service.SalesTargetService;
import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.sopp.service.SoppService;
import kr.swcore.sderp.user.dto.UserDTO;
import kr.swcore.sderp.user.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	CustService custService;
	
	@Inject
	UserService userService;
	
	@Inject
	ProductService productService;
	
	@Inject 
	SoppService soppService;
	
	@Inject
	SalesService salesService;

	@Inject
	CodeService codeService;
	
	@Inject
	ContService contService;

	@Inject
	SalesTargetService salesTargetService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session) {
		
		String userId = (String)session.getAttribute("userId");
		String rtn = "user/login";
		
		if(userId != null){
			rtn = "main";
		}
		return rtn;
	}
	
	
	@RequestMapping("/testview.do")
	public String testview() {
		return "code/listview";
	}
	
	@RequestMapping("/myboard.do")
	public ModelAndView refresh(HttpSession session, ModelAndView mav) {	
		mav.addObject("sopplist", soppService.listSopp(session));
		mav.addObject("contlist", contService.listCont(session));
		mav.addObject("saleslist", salesService.listSales(session));
		mav.addObject("graph1",salesTargetService.listSalesTargetYearTotalSalesIndividual(session, null));
		mav.addObject("graph2",salesTargetService.listSalesTargetMonthIndividual(session, null));
		mav.addObject("graph3",salesTargetService.listSalesTargetYearIndividual(session, null));
		mav.addObject("graph4",contService.listSalesTargetMonthIndividual(session, null));
		mav.setViewName("board/myboard");
		return mav;
	}
	
	@RequestMapping("/sidemenu/menu1.do")
	public String menu1() {
		return "sidemenu/menu1";
	}
	
	@RequestMapping("/sidemenu/menu2.do")
	public String menu2() {
		return "sidemenu/menu2";
	}
	
	@RequestMapping("/sidemenu/menu3.do")
	public String menu3() {
		return "sidemenu/menu3";
	}
	
	@RequestMapping("/sidemenu/menu4.do")
	public String menu4() {
		return "sidemenu/menu4";
	}


	@RequestMapping("/modal/popup.do")
	public ModelAndView modal(@RequestParam Map<String, Object> params, Model model, ModelAndView mav, HttpSession session) {
		String rtn = "";
		String popId = (String)params.get("popId"); 
		if("cust".equals(popId)) {
			List<CustDTO> list=custService.listCust(session);
			model.addAttribute("list",list);
			rtn = "modal/custList";
		}
		else if("user".equals(popId)) {
			List<UserDTO> list=userService.userList(session);
			model.addAttribute("list",list);
			rtn = "modal/userList";
		}
		else if("sopp".equals(popId)) {
			List<SoppDTO> list=soppService.listSopp(session);
			model.addAttribute("list",list);
			rtn = "modal/soppList";
		}

		else if("sales".equals(popId)) {
			List<SalesDTO> list=salesService.listSales(session);
			model.addAttribute("list",list);
			rtn = "modal/salesList";
		}

		else if("buyr".equals(popId)) {
			List<CustDTO> list=custService.listBuyr(session);
			model.addAttribute("list",list);
			rtn = "modal/buyrList";
		}

		else if("ptnc".equals(popId)) {
			List<CustDTO> list=custService.listPtnc(session);
			model.addAttribute("list",list);
			rtn = "modal/ptncList";
		}

		else if("supply".equals(popId)) {
			List<CustDTO> list=custService.listSupply(session);
			model.addAttribute("list",list);
			rtn = "modal/supplyList";
		}

		else if("product".equals(popId)) {
			List<ProductDTO> list=productService.listProduct(session);
			model.addAttribute("list",list);
			rtn = "modal/productList";
		}
		
		else if("code01".equals(popId)) {
			List<CodeDTO> list=codeService.listCode01(session);
			model.addAttribute("list",list);
			rtn = "modal/code01List";
		}

		else if("code02".equals(popId)) {
			List<CodeDTO> list=codeService.listCode02(session);
			model.addAttribute("list",list);
			rtn = "modal/code02List";
		}
		
		else if("cont".equals(popId)) {
			List<ContDTO> list=contService.listCont(session);
			model.addAttribute("list",list);
			rtn = "modal/contList";
		}
		
		else if("custmem".equals(popId)) {						// ���� �˻�
			Integer compNo = Integer.valueOf((String) params.get("compNo")); 
			List<CustDTO> list = custService.listCustmember(compNo);
			model.addAttribute("list", list);
			rtn = "modal/custmemberList";
		}
		
		else if("productGoodsCategory".equals(popId)) {
			//Integer compNo = Integer.valueOf((String) params.get("compNo"));
			List<ProductDTO> list = productService.listProductGoodsCategory(session);
			model.addAttribute("list", list);
			rtn = "modal/productGoodsCategory";
		}

		logger.debug(rtn);
		
		mav.setViewName(rtn);
		return mav;
	}
}