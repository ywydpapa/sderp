package kr.swcore.sderp.store;

import kr.swcore.sderp.code.dto.CodeDTO;
import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.cust.service.CustService;
import kr.swcore.sderp.gw.dto.GwDTO;
import kr.swcore.sderp.organiz.dto.OrganizDTO;
import kr.swcore.sderp.store.dto.StoreDTO;
import kr.swcore.sderp.store.dto.StoreInoutDTO;
import kr.swcore.sderp.store.service.StoreInoutService;
import kr.swcore.sderp.store.service.StoreService;
import kr.swcore.sderp.user.dto.UserDTO;
import lombok.extern.slf4j.Slf4j;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/store/")
@Slf4j
public class StoreController {

	@Inject
	SqlSession sqlSession;

	@Inject
	StoreService storeService;

	@Inject
	StoreInoutService storeInoutService;

	@Inject
	CustService custService;

	@Inject
	CodeService codeService;
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);

	// 占쏙옙占쏙옙트 占쏙옙占쏙옙占쏙옙 占쏙옙회
	@RequestMapping("listStore.do")
	public ModelAndView list(HttpSession session, StoreDTO dto, ModelAndView mav,
			@RequestParam(value = "storeNo", required = false) Integer storeNo,
			@RequestParam(value = "productNo", required = false) Integer productNo,
			@RequestParam(value = "customer", required = false) String custName,
			@RequestParam(value = "productCategoryName", required = false) String productCategoryName,
			@RequestParam(value = "productName", required = false) String productName,
			@RequestParam(value = "serialNo", required = false) String serialNo) {
		
			if(storeNo != null)     dto.setStoreNo(storeNo);
			if(productNo != null)	dto.setProductNo(productNo);
			if(custName != null)	dto.setCustName(custName);
			if(productCategoryName != null)	dto.setProductCategoryName(productCategoryName);
			if(productName != null)	dto.setProductName(productName);
			if(serialNo != null)	dto.setSerialNo(serialNo);
		
		mav.addObject("store", storeService.listStore(session, dto));
		mav.setViewName("store/list");

		return mav;
	}

	// 占쏙옙占� 占쏙옙占쏙옙占쏙옙 占쏙옙회
	@RequestMapping("writeStore.do")
	public ModelAndView write(HttpSession session, CodeDTO dto, ModelAndView mav) {  
		mav.addObject("list1", codeService.listCode01(session));
		mav.addObject("list2", codeService.listCode02(session));
		mav.addObject("list3", codeService.listCode03(session));
		mav.setViewName("store/write");
		return mav;
	}

	// 占쏙옙占� insert
	@RequestMapping("insert.do")
	public ResponseEntity<?> storeInsert(HttpSession session, @ModelAttribute StoreDTO dto) {

		Map<String, Object> param = new HashMap<>();
		int storeInsert = storeService.insertStore(session, dto);
		if (storeInsert > 0) {
			param.put("code", "10001");
		} else {
			param.put("code", "20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("writeInout.do")
	public ModelAndView inoutInsert(HttpSession session, StoreDTO dto, ModelAndView mav) {
		mav.addObject("list1", codeService.listCode01(session));
		mav.addObject("list2", codeService.listCode02(session));
		mav.addObject("list3", codeService.listCode03(session));
		mav.addObject("storeList", storeService.storeList(session, dto));
		mav.setViewName("store/inoutWrite");
		return mav;
	}

	@RequestMapping("/detail/{storeNo}")
	public ModelAndView detail(HttpSession session, @PathVariable("storeNo") int storeNo, ModelAndView mav) {
		mav.addObject("custDataList", custService.getAllDataList(session));
		mav.addObject("list1", codeService.listCode01(session));
		mav.addObject("list2", codeService.listCode02(session));
		mav.addObject("list3", codeService.listCode03(session));
		//mav.addObject("dtoList", storeService.storeDetail(storeNo));
		mav.addObject("inoutList", storeInoutService.getInoutStoreList(storeNo));
		mav.setViewName("store/detail");
		return mav;
	}
	
	@RequestMapping("/update.do")
	public ResponseEntity<?> storeUpdate(HttpSession session, @ModelAttribute StoreDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int storeUpdate = storeService.updateStore(session, dto);
		if (storeUpdate > 0) {
			param.put("code", "10001");
		} else {
			param.put("code", "20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("/delete.do")
	public ResponseEntity<?> storeDelete(HttpSession session, @ModelAttribute StoreDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int storeUpdate = storeService.deleteStore(session, dto);
		if (storeUpdate > 0) {
			param.put("code", "10001");
		} else {
			param.put("code", "20001");
		}
		return ResponseEntity.ok(param);
	}


	@RequestMapping("/inOutInsert.do")
	public ResponseEntity<?> storeInOutInsert(HttpSession session, StoreDTO sdto, @RequestBody String requestbody) {
		String compNo = (String) session.getAttribute("compNo");
		Map<String, Object> param = new HashMap<>();
		String data = requestbody;
		StoreInoutDTO dto = new StoreInoutDTO();
		StoreDTO storeDto = new StoreDTO();
		int storeInoutInsert = 0;
		int storeOutSoppInsert = 0;
		int process1 = 0;
		int lastStoreNo = 0;
		int firstCount =  -1; 
		org.json.JSONArray jarr = new org.json.JSONArray(data);
		org.json.JSONObject json = null;
		for (int i = 0; i < jarr.length(); i++) {
			lastStoreNo = -1;
			json = jarr.getJSONObject(i);
			dto.setSoppNo(json.getInt("soppNo"));
			dto.setUserNo(json.getInt("userNo"));
			dto.setContNo(json.getInt("contNo"));
			dto.setInoutQty(json.getInt("inoutQty"));
			dto.setInoutAmount(BigDecimal.valueOf(json.getInt("inoutAmount")));
			dto.setInoutVat(BigDecimal.valueOf(json.getInt("inoutVat")));
			dto.setInoutNet(BigDecimal.valueOf(json.getInt("inoutNet")));
			dto.setInoutTotal(BigDecimal.valueOf(json.getInt("inoutTotal")));
			dto.setProductNo(json.getInt("productNo"));
			dto.setProductName(json.getString("productName"));
			dto.setComment(json.getString("comment"));
			dto.setInoutType(json.getString("inoutType"));
			dto.setLocationNo(json.getString("locationNo"));
			 
			//입고인 경우 
			if (json.getString("inoutType").equals("IN")) {
				storeDto.setCompNo(Integer.valueOf(compNo));
				storeDto.setProductNo(json.getInt("productNo"));
				storeDto.setStoreAmount(BigDecimal.valueOf(json.getInt("inoutAmount")));
				storeDto.setLocationNo(json.getString("locationNo"));
				storeDto.setComment(json.getString("comment"));
				storeDto.setSerialNo(json.getString("serialNo"));
				String storeNo = "0"; 
                 
				
				// 입력된 시리얼 번호가 있는경우 
			     if(!json.getString("serialNo").equals("")) {
			    	// 해당 시리얼 번호로 재고 수량이 0인 재고 생성 
			    	process1 = storeService.insertStore2(session, storeDto);
			    	// 그 재고 번호를 구함 
			    	lastStoreNo = storeService.getLastStoreNo(session, storeDto);
			    
			     
			     // 입력된 시리얼 번호가 없는 경우 
			     } else { 
			    	 // 해당 상품 + 시리얼 번호 없음으로 등록된 재고가 있는지 확인함 
			    	firstCount = storeService.getCount(json.getInt("productNo"));  
			    	// 시리얼 번호 없는 것으로 등록된 재고가 있는 경우 
			    	if (firstCount != 0) {
			    	storeNo =String.valueOf(storeService.getStoreNo(session, json.getInt("productNo")));
			    	lastStoreNo = Integer.valueOf(storeNo); 
			    	process1  = 1; 
			    	} else {
			    		// 시리얼 번호 없는 것으로 등록된 재고가 없는경우 > 재고 수량이 0 이고 시리얼 번호 없는 재고 생성 
			    	process1 = storeService.insertStore2(session, storeDto);
				    lastStoreNo = storeService.getLastStoreNo(session, storeDto);
			    	}
			    }
			     
			     // 해당하는 재고 번호로 입고 데이터 insert 
				if (process1 > 0) {
					if (lastStoreNo != -1) {
						dto.setStoreNo(lastStoreNo);
						storeInoutInsert = storeInoutService.insertInoutStore(session, dto);
						storeDto.setStoreQty(json.getInt("inoutQty"));
						storeDto.setStoreNo(lastStoreNo);
					}
				} else {
					param.put("code", "20001");
				}
				
				// 출고인 경우  데이터 insert 함 
			} else {
				dto.setStoreNo(Integer.valueOf(json.getString("storeNo")));
				storeInoutInsert = storeInoutService.insertInoutStore(session, dto);
				System.out.println(dto.toString());
				storeInoutService.outSoppInsert(session, dto);
				storeDto.setStoreQty(json.getInt("inoutQty") * -1);
				storeDto.setStoreNo(dto.getStoreNo());
			}
			
			// 기존 재고에 입고, 출고 재고 계산해서 업데이트
			if (storeInoutInsert > 0) {
				sqlSession.update("store.plusStoreQty", storeDto);
				param.put("code", "10001");
			} else {
				param.put("code", "20001");
			}
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("/inOutList.do")
	public ModelAndView storeInOutList(HttpSession session, StoreInoutDTO dto, ModelAndView mav,
			@RequestParam(value = "contTitle", required = false) String contTitle,
			@RequestParam(value = "inoutType", required = false) String inoutType,
			@RequestParam(value = "productName", required = false) String productName,
			@RequestParam(value = "storeNo", required = false) Integer storeNo,
			@RequestParam(value = "serialNo", required = false) String serialNo,
			@RequestParam(value = "locationNo", required = false) String locationNo,
			@RequestParam(value = "from", required = false) String from,
			@RequestParam(value = "to", required = false) String to) {

		String compNo = (String) session.getAttribute("compNo");
		dto.setCompNo(Integer.valueOf(compNo));

		if (inoutType != null || productName != null || storeNo != null || serialNo != null || locationNo != null
				|| from != null || to != null || contTitle != null ) {
			if(contTitle != null) {
				dto.setContTitle(contTitle);
			}
			if (inoutType != null) {
				dto.setInoutType(inoutType);
			}
			if (productName != null) {
				dto.setProductName(productName);
			}
			if (storeNo != null) {
				dto.setStoreNo(storeNo);
			}
			if (serialNo != null) {
				dto.setSerialNo(serialNo);
			}
			if (locationNo != null) {
				dto.setLocationNo(locationNo);
			}
			if (from != null) {
				dto.setFrom(from);
			}
			if (to != null) {
				dto.setTo(to);
			}
			mav.addObject("inOutAllList", storeInoutService.search(session, dto));
		} else {  

			mav.addObject("inOutAllList", storeInoutService.getAllList(session, dto));
		}
		mav.addObject("custDataList", custService.getAllDataList(session));
		mav.addObject("list1", codeService.listCode01(session));
		mav.addObject("list2", codeService.listCode02(session));
		mav.addObject("list3", codeService.listCode03(session));
		mav.setViewName("store/inoutList");
		return mav;
	} 
	
	

	@RequestMapping("/inOutUpate.do")
	   public ResponseEntity<?> storeInOutUpated(HttpSession session, StoreInoutDTO dto, StoreInoutDTO idto) {
	      Map<String, Object> param = new HashMap<>();
	      int process1 = 0;
	      String compNo = (String) session.getAttribute("compNo");
	      StoreDTO sdto = new StoreDTO();
	      idto.setCompNo(Integer.valueOf(compNo));
	      sdto.setCompNo(Integer.valueOf(compNo));
	      sdto.setStoreNo(idto.getStoreNo()); // 수정할 store 의 수량을 구함
	      sdto.setSerialNo(idto.getSerialNo());
	      // 재고 수량과 입출고 기록에 더해주면 됨
	      if (idto.getInoutType().equals("IN")) {
	         sdto.setStoreQty(dto.getInoutQty());
	      } else {
	         sdto.setStoreQty(dto.getInoutQty() * -1);
	      }
	      
	      if(sdto.getSerialNo() !=null) {
	         sqlSession.update("store.serialUpdate", sdto);
	      }
	      process1 = sqlSession.update("store.plusStoreQty", sdto);
	      process1 = storeInoutService.updateInoutStore(session, dto);
	      param.put("code", "10001");
	      
	        if (idto.getLocationNo() != null || idto.getComment() != null || idto.getInoutAmount() != null) {
	              process1 = storeInoutService.updateEtc(session, dto);
	              if(process1 > 0) {
	               param.put("code", "10001");
	              } else {
	                 param.put("code", "20001");
	              }
	        }
	         return ResponseEntity.ok(param);
	   }



	@RequestMapping("/inOutDetail/{inoutNo}")
	public ModelAndView getInoutDetail(@PathVariable int inoutNo, ModelAndView mav, HttpSession session, StoreInoutDTO dto) {
		mav.addObject("custDataList", custService.getAllDataList(session));
		mav.setViewName("store/inoutDetail");
		mav.addObject("list1", codeService.listCode01(session));
		mav.addObject("list2", codeService.listCode02(session));
		mav.addObject("list3", codeService.listCode03(session));
		String compNo = (String) session.getAttribute("compNo");
		dto.setCompNo(Integer.valueOf(compNo));
		//dto.setInoutNo(inoutNo);
		mav.addObject("detail", storeInoutService.getInout(dto));
		return mav;
	}
	
	@RequestMapping("/checkSerial") 
	@ResponseBody 
	public String checkSerial(@RequestBody StoreDTO dto) {
	    String result = null;
		 if(storeService.checkSerial(dto) > 0) {
			 result = "{\"result\": \"failure\"}"; 
		 } else {
			 result ="{\"result\": \"success\"}"; 
		 }
		return result; 
	}

}