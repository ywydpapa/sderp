package kr.swcore.sderp.account;

import kr.swcore.sderp.account.dto.AccountDTO;

import kr.swcore.sderp.account.service.AccountService;
import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.cust.dto.CustDTO;
import kr.swcore.sderp.cust.service.CustService;
import kr.swcore.sderp.store.dto.StoreDTO;
import kr.swcore.sderp.store.dto.StoreInoutDTO;
import kr.swcore.sderp.store.service.StoreInoutService;
import kr.swcore.sderp.store.service.StoreService;
import kr.swcore.sderp.util.SessionInfoGet;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/acc/*")
public class AccountController {

    @Inject
    AccountService accountService;

    @Inject
    CodeService codeService;
    
    @Inject
    CustService custService;

    @RequestMapping("vatlist.do")
    public ModelAndView vatList(HttpSession session, ModelAndView mav, 
    							@RequestParam(value = "vatSellerCustNo", required = false) Integer vatSellerCustNo,
								 @RequestParam(value = "vatType", required = false) String vatType,
								 @RequestParam(value = "vatIssueDateFrom", required = false) String vatIssueDateFrom,
								 @RequestParam(value = "vatIssueDateTo", required = false) String vatIssueDateTo,
								 @RequestParam(value = "vatSerial", required = false) String vatSerial,
								 @RequestParam(value = "vatRemark", required = false) String vatRemark) {
    	if(vatSellerCustNo != null || vatType != null || vatIssueDateFrom != null || vatIssueDateTo != null || vatSerial != null || vatRemark != null){
			AccountDTO dto = new AccountDTO();
			if(vatSellerCustNo != null) dto.setVatSellerCustNo(vatSellerCustNo);
			if(vatType != null) dto.setVatType(vatType);
			if(vatIssueDateFrom != null) dto.setVatIssueDateFrom(vatIssueDateFrom);
			if(vatIssueDateTo != null) dto.setVatIssueDateTo(vatIssueDateTo);
			if(vatSerial != null) dto.setVatSerial(vatSerial);
			if(vatRemark != null) dto.setVatRemark(vatRemark);
			mav.addObject("vatList", accountService.listvatSearch(session, dto));
		} else {
			AccountDTO dto = new AccountDTO();
			mav.addObject("vatList", accountService.listvat(session, dto));
		}
        mav.setViewName("settle/vatlist");
        return mav;
    }

    @RequestMapping("sumBvatlist.do")
    public ModelAndView sumBvatList(HttpSession session, ModelAndView mav,
                                @RequestParam(value = "vatSellerCustNo", required = false) Integer vatSellerCustNo,
                                @RequestParam(value = "vatIssueDateFrom", required = false) String vatIssueDateFrom,
                                @RequestParam(value = "vatIssueDateTo", required = false) String vatIssueDateTo,
                                @RequestParam(value = "selectYear", required = false) Integer selectYear) {
        if(vatSellerCustNo != null || vatIssueDateFrom != null || vatIssueDateTo != null){
            AccountDTO dto = new AccountDTO();
            LocalDate now = LocalDate.now();
            int year = now.getYear();
            if(vatSellerCustNo != null) dto.setVatSellerCustNo(vatSellerCustNo);
            if(vatIssueDateFrom != null) {
            	dto.setVatIssueDateFrom(vatIssueDateFrom);
            }else {
            	dto.setVatIssueDateFrom(year + "-01-01");
            }
            
            if(vatIssueDateTo != null) {
            	dto.setVatIssueDateTo(vatIssueDateTo);
            }else {
            	dto.setVatIssueDateTo(year + "-12-31");
            }
            
            if(selectYear != null) {
            	dto.setSelectYear(selectYear);
            }else {
            	dto.setSelectYear(year);
            }
            List <AccountDTO> vatList =  accountService.sumBvatSearch(session, dto);
            List <AccountDTO> sumBvat_sub = accountService.sumBvat_sub(session, dto);
            for(int i = 0; i < sumBvat_sub.size(); i++) {
            	for(int s = 0; s < vatList.size(); s++) {
            		if(sumBvat_sub.get(i).getCustNo() == vatList.get(s).getCustNo()) {
            			vatList.get(s).setSerialTotalB(sumBvat_sub.get(i).getModal_receive_data());
            		}
            	}
            }
            mav.addObject("vatList", vatList);
        } else {
            AccountDTO dto = new AccountDTO();
            LocalDate now = LocalDate.now();
            int year = now.getYear();
            dto.setVatIssueDateFrom(year + "-01-01");
            dto.setVatIssueDateTo(year + "-12-31");
            dto.setSelectYear(year);
            
            List <AccountDTO> vatList =  accountService.sumBvat(session, dto);
            List <AccountDTO> sumBvat_sub = accountService.sumBvat_sub(session, dto);
            for(int i = 0; i < sumBvat_sub.size(); i++) {
            	for(int s = 0; s < vatList.size(); s++) {
            		if(sumBvat_sub.get(i).getCustNo() == vatList.get(s).getCustNo()) {
            			vatList.get(s).setSerialTotalB(sumBvat_sub.get(i).getModal_receive_data());
            		}
            	}
            }
            
            mav.addObject("vatList", vatList);
        }
        mav.addObject("listCust", custService.listCust(session));
        mav.setViewName("settle/sumBvatlist");
        return mav;
    }
    
    @RequestMapping("sumSvatlist.do")
    public ModelAndView sumSvatlist(HttpSession session, ModelAndView mav,
            @RequestParam(value = "vatBuyerCustNo", required = false) Integer vatBuyerCustNo,
            @RequestParam(value = "vatIssueDateFrom", required = false) String vatIssueDateFrom,
            @RequestParam(value = "vatIssueDateTo", required = false) String vatIssueDateTo, 
            @RequestParam(value = "selectYear", required = false) Integer selectYear) {
		if(vatBuyerCustNo != null || vatIssueDateFrom != null || vatIssueDateTo != null){
			AccountDTO dto = new AccountDTO();
			LocalDate now = LocalDate.now();
			int year = now.getYear();
			if(vatBuyerCustNo != null) dto.setVatBuyerCustNo(vatBuyerCustNo);
			if(vatIssueDateFrom != null) {
				dto.setVatIssueDateFrom(vatIssueDateFrom);
			}else {
				dto.setVatIssueDateFrom(year + "-01-01");
			}
		
			if(vatIssueDateTo != null) {
				dto.setVatIssueDateTo(vatIssueDateTo);
			}else {
				dto.setVatIssueDateTo(year + "-12-31");
			}
		
			if(selectYear != null) {
				dto.setSelectYear(selectYear);
			}else {
				dto.setSelectYear(year);
			}
			List <AccountDTO> vatList = accountService.sumSvatSearch(session, dto);
			List <AccountDTO> sumSvat_sub = accountService.sumSvat_sub(session, dto);
			for(int i = 0; i < sumSvat_sub.size(); i++) {
				for(int s = 0; s < vatList.size(); s++) {
					if(sumSvat_sub.get(i).getCustNo() == vatList.get(s).getCustNo()) {
						vatList.get(s).setSerialTotalS(sumSvat_sub.get(i).getModal_receive_data());
					}
				}
			}
			mav.addObject("vatList", vatList);
		
			} else {
				AccountDTO dto = new AccountDTO();
				LocalDate now = LocalDate.now();
				int year = now.getYear();
				dto.setVatIssueDateFrom(year + "-01-01");
				dto.setVatIssueDateTo(year + "-12-31");
				dto.setSelectYear(year);
				List <AccountDTO> sumSvat_sub = accountService.sumSvat_sub(session, dto);
				List <AccountDTO> vatList = accountService.sumSvat(session, dto);
		
				for(int i = 0; i < sumSvat_sub.size(); i++) {
					for(int s = 0; s < vatList.size(); s++) {
						if(sumSvat_sub.get(i).getCustNo() == vatList.get(s).getCustNo()) {
							vatList.get(s).setSerialTotalS(sumSvat_sub.get(i).getModal_receive_data());
						}
					}
				}
			mav.addObject("vatList", vatList);
		}
	
		mav.addObject("listCust", custService.listCust(session));
		mav.setViewName("settle/sumSvatlist");
		return mav;
	}

    @RequestMapping("custVatListS.do")
    public ModelAndView custVatListS(HttpSession session, ModelAndView mav,
                                    @RequestParam(value = "vatBuyerCustNo", required = false) Integer vatBuyerCustNo,
                                    @RequestParam(value = "vatIssueDateFrom", required = false) String vatIssueDateFrom,
                                    @RequestParam(value = "vatIssueDateTo", required = false) String vatIssueDateTo, 
                                    @RequestParam(value = "selectYear", required = false) Integer selectYear) {
        if(vatBuyerCustNo != null || vatIssueDateFrom != null || vatIssueDateTo != null){
            AccountDTO dto = new AccountDTO();
            LocalDate now = LocalDate.now();
            int year = now.getYear();
            if(vatBuyerCustNo != null) dto.setVatBuyerCustNo(vatBuyerCustNo);
            if(vatIssueDateFrom != null) {
            	dto.setVatIssueDateFrom(vatIssueDateFrom);
            }else {
            	dto.setVatIssueDateFrom(year + "-01-01");
            }
            
            if(vatIssueDateTo != null) {
            	dto.setVatIssueDateTo(vatIssueDateTo);
            }else {
            	dto.setVatIssueDateTo(year + "-12-31");
            }
            
            if(selectYear != null) {
            	dto.setSelectYear(selectYear);
            }else {
            	dto.setSelectYear(year);
            }
            List <AccountDTO> vatList = accountService.sumSvatSearch(session, dto);
            List <AccountDTO> sumSvat_sub = accountService.sumSvat_sub(session, dto);
            for(int i = 0; i < sumSvat_sub.size(); i++) {
            	for(int s = 0; s < vatList.size(); s++) {
            		if(sumSvat_sub.get(i).getCustNo() == vatList.get(s).getCustNo()) {
            			vatList.get(s).setSerialTotalS(sumSvat_sub.get(i).getModal_receive_data());
            		}
            	}
            }
            mav.addObject("vatList", vatList);
            
        } else {
            AccountDTO dto = new AccountDTO();
            LocalDate now = LocalDate.now();
            int year = now.getYear();
            dto.setVatIssueDateFrom(year + "-01-01");
            dto.setVatIssueDateTo(year + "-12-31");
            dto.setSelectYear(year);
            List <AccountDTO> sumSvat_sub = accountService.sumSvat_sub(session, dto);
            List <AccountDTO> vatList = accountService.custVatListS(session, dto);
            
            for(int i = 0; i < sumSvat_sub.size(); i++) {
            	for(int s = 0; s < vatList.size(); s++) {
            		if(sumSvat_sub.get(i).getCustNo() == vatList.get(s).getCustNo()) {
            			vatList.get(s).setSerialTotalS(sumSvat_sub.get(i).getModal_receive_data());
            		}
            	}
            }
            mav.addObject("vatList", vatList);
        }
        
        mav.addObject("listCust", custService.listCust(session));
        mav.setViewName("settle/custVatListS");
        return mav;
    }
    
    @RequestMapping("custVatListB.do")
    public ModelAndView custVatListB(HttpSession session, ModelAndView mav,
                                @RequestParam(value = "vatSellerCustNo", required = false) Integer vatSellerCustNo,
                                @RequestParam(value = "vatIssueDateFrom", required = false) String vatIssueDateFrom,
                                @RequestParam(value = "vatIssueDateTo", required = false) String vatIssueDateTo,
                                @RequestParam(value = "selectYear", required = false) Integer selectYear) {
        if(vatSellerCustNo != null || vatIssueDateFrom != null || vatIssueDateTo != null){
            AccountDTO dto = new AccountDTO();
            LocalDate now = LocalDate.now();
            int year = now.getYear();
            if(vatSellerCustNo != null) dto.setVatSellerCustNo(vatSellerCustNo);
            if(vatIssueDateFrom != null) {
            	dto.setVatIssueDateFrom(vatIssueDateFrom);
            }else {
            	dto.setVatIssueDateFrom(year + "-01-01");
            }
            
            if(vatIssueDateTo != null) {
            	dto.setVatIssueDateTo(vatIssueDateTo);
            }else {
            	dto.setVatIssueDateTo(year + "-12-31");
            }
            
            if(selectYear != null) {
            	dto.setSelectYear(selectYear);
            }else {
            	dto.setSelectYear(year);
            }
            List <AccountDTO> vatList =  accountService.sumBvatSearch(session, dto);
            List <AccountDTO> sumBvat_sub = accountService.sumBvat_sub(session, dto);
            for(int i = 0; i < sumBvat_sub.size(); i++) {
            	for(int s = 0; s < vatList.size(); s++) {
            		if(sumBvat_sub.get(i).getCustNo() == vatList.get(s).getCustNo()) {
            			vatList.get(s).setSerialTotalB(sumBvat_sub.get(i).getModal_receive_data());
            		}
            	}
            }
            mav.addObject("vatList", vatList);
        } else {
            AccountDTO dto = new AccountDTO();
            LocalDate now = LocalDate.now();
            int year = now.getYear();
            dto.setVatIssueDateFrom(year + "-01-01");
            dto.setVatIssueDateTo(year + "-12-31");
            dto.setSelectYear(year);
            
            List <AccountDTO> vatList =  accountService.custVatListB(session, dto);
            List <AccountDTO> sumBvat_sub = accountService.sumBvat_sub(session, dto);
            for(int i = 0; i < sumBvat_sub.size(); i++) {
            	for(int s = 0; s < vatList.size(); s++) {
            		if(sumBvat_sub.get(i).getCustNo() == vatList.get(s).getCustNo()) {
            			vatList.get(s).setSerialTotalB(sumBvat_sub.get(i).getModal_receive_data());
            		}
            	}
            }
            
            mav.addObject("vatList", vatList);
        }
        
        mav.addObject("listCust", custService.listCust(session));
        mav.setViewName("settle/custVatListB");
        return mav;
    }
    
    @RequestMapping("vatDeduction.do")
    public ModelAndView vatDeduction(HttpSession session, ModelAndView mav, 
            @RequestParam(value = "searchYear", required = false) Integer searchYear,
            @RequestParam(value = "searchChoice", required = false) Integer searchChoice) {
    	if(searchYear != null || searchChoice != null){
    		AccountDTO dto = new AccountDTO();
			
    		if(searchYear == 0) {
    			LocalDate now = LocalDate.now();
    			int year = now.getYear();
    			searchYear = year;
    		}
    		
    		if(searchChoice == 0) {
    			for(int i = 1; i <= 12; i++) {
    				if(i < 10) {
    					dto.setVatIssueDateFrom(searchYear + "-" + "0" + i + "-01");
    					dto.setVatIssueDateTo(searchYear + "-" + "0" + i + "-31");
    				}else {
    					dto.setVatIssueDateFrom(searchYear + "-" + i + "-01");
    					dto.setVatIssueDateTo(searchYear + "-" + i + "-31");
    				}
    				
    				mav.addObject("vatListB" + i, accountService.listvatB(session, dto));
    				mav.addObject("vatListS" + i, accountService.listvatS(session, dto));
    			}
    			
    			dto.setVatIssueDateFrom(searchYear + "-01-01");
    			dto.setVatIssueDateTo(searchYear + "-12-31");
    			mav.addObject("vatListB", accountService.listvatB(session, dto));
    			mav.addObject("vatListS", accountService.listvatS(session, dto));
    		}else if(searchChoice == 3) {
    			for(int i = 1; i <= 3; i++) {
					dto.setVatIssueDateFrom(searchYear + "-" + "0" + i + "-01");
					dto.setVatIssueDateTo(searchYear + "-" + "0" + i + "-31");
    				mav.addObject("vatListB" + i, accountService.listvatB(session, dto));
    				mav.addObject("vatListS" + i, accountService.listvatS(session, dto));
    			}
    			
    			dto.setVatIssueDateFrom(searchYear + "-01-01");
    			dto.setVatIssueDateTo(searchYear + "-03-31");
    			mav.addObject("vatListB", accountService.listvatB(session, dto));
    			mav.addObject("vatListS", accountService.listvatS(session, dto));
    		}else if(searchChoice == 6) {
    			for(int i = 4; i <= 6; i++) {
					dto.setVatIssueDateFrom(searchYear + "-" + "0" + i + "-01");
					dto.setVatIssueDateTo(searchYear + "-" + "0" + i + "-31");
    				mav.addObject("vatListB" + i, accountService.listvatB(session, dto));
    				mav.addObject("vatListS" + i, accountService.listvatS(session, dto));
    			}
    			
    			dto.setVatIssueDateFrom(searchYear + "-04-01");
    			dto.setVatIssueDateTo(searchYear + "-06-30");
    			mav.addObject("vatListB", accountService.listvatB(session, dto));
    			mav.addObject("vatListS", accountService.listvatS(session, dto));
    		}else if(searchChoice == 9) {
    			for(int i = 7; i <= 9; i++) {
					dto.setVatIssueDateFrom(searchYear + "-" + "0" + i + "-01");
					dto.setVatIssueDateTo(searchYear + "-" + "0" + i + "-31");
    				mav.addObject("vatListB" + i, accountService.listvatB(session, dto));
    				mav.addObject("vatListS" + i, accountService.listvatS(session, dto));
    			}
    			
    			dto.setVatIssueDateFrom(searchYear + "-07-01");
    			dto.setVatIssueDateTo(searchYear + "-09-30");
    			mav.addObject("vatListB", accountService.listvatB(session, dto));
    			mav.addObject("vatListS", accountService.listvatS(session, dto));
    		}else if(searchChoice == 12) {
    			for(int i = 10; i <= 12; i++) {
					dto.setVatIssueDateFrom(searchYear + "-" + i + "-01");
					dto.setVatIssueDateTo(searchYear + "-" + i + "-31");
    				mav.addObject("vatListB" + i, accountService.listvatB(session, dto));
    				mav.addObject("vatListS" + i, accountService.listvatS(session, dto));
    			}
    			
    			dto.setVatIssueDateFrom(searchYear + "-10-01");
    			dto.setVatIssueDateTo(searchYear + "-12-31");
    			mav.addObject("vatListB", accountService.listvatB(session, dto));
    			mav.addObject("vatListS", accountService.listvatS(session, dto));
    		}else if(searchChoice == 1) {
    			for(int i = 1; i <= 6; i++) {
					dto.setVatIssueDateFrom(searchYear + "-" + "0" + i + "-01");
					dto.setVatIssueDateTo(searchYear + "-" + "0" + i + "-31");
    				mav.addObject("vatListB" + i, accountService.listvatB(session, dto));
    				mav.addObject("vatListS" + i, accountService.listvatS(session, dto));
    			}
    			
    			dto.setVatIssueDateFrom(searchYear + "-01-01");
    			dto.setVatIssueDateTo(searchYear + "-06-30");
    			mav.addObject("vatListB", accountService.listvatB(session, dto));
    			mav.addObject("vatListS", accountService.listvatS(session, dto));
    		}else if(searchChoice == 2) {
    			for(int i = 7; i <= 12; i++) {
    				if(i < 10) {
    					dto.setVatIssueDateFrom(searchYear + "-" + "0" + i + "-01");
    					dto.setVatIssueDateTo(searchYear + "-" + "0" + i + "-31");
    				}else {
    					dto.setVatIssueDateFrom(searchYear + "-" + i + "-01");
    					dto.setVatIssueDateTo(searchYear + "-" + i + "-31");
    				}
    				
    				mav.addObject("vatListB" + i, accountService.listvatB(session, dto));
    				mav.addObject("vatListS" + i, accountService.listvatS(session, dto));
    			}
    			
    			dto.setVatIssueDateFrom(searchYear + "-07-01");
    			dto.setVatIssueDateTo(searchYear + "-12-31");
    			mav.addObject("vatListB", accountService.listvatB(session, dto));
    			mav.addObject("vatListS", accountService.listvatS(session, dto));
    		}
			
		}else {
			AccountDTO dto = new AccountDTO();
			LocalDate now = LocalDate.now();
			int year = now.getYear();
			
			for(int i = 1; i <= 12; i++) {
				if(i < 10) {
					dto.setVatIssueDateFrom(year + "-" + "0" + i + "-01");
					dto.setVatIssueDateTo(year + "-" + "0" + i + "-31");
				}else {
					dto.setVatIssueDateFrom(year + "-" + i + "-01");
					dto.setVatIssueDateTo(year + "-" + i + "-31");
				}
				
				mav.addObject("vatListB" + i, accountService.listvatB(session, dto));
				mav.addObject("vatListS" + i, accountService.listvatS(session, dto));
			}
			
			dto.setVatIssueDateFrom(year + "-01-01");
			dto.setVatIssueDateTo(year + "-12-31");
			mav.addObject("vatListB", accountService.listvatB(session, dto));
			mav.addObject("vatListS", accountService.listvatS(session, dto));
		}
    	mav.addObject("listCust", custService.listCust(session));
        mav.setViewName("settle/vatDeduction");
        return mav;
    }
    
    @ResponseBody
    @RequestMapping("vatDeductionUpdate.do")
    public ResponseEntity<Object> vatDeductionUpdate(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int bacIns = accountService.vatDeductionUpdate(dto);
        if(bacIns > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("vatlistB.do")
    public ModelAndView vatListB(HttpSession session, ModelAndView mav, 
            @RequestParam(value = "vatSellerCustNo", required = false) Integer vatSellerCustNo,
            @RequestParam(value = "vatIssueDateFrom", required = false) String vatIssueDateFrom,
            @RequestParam(value = "vatIssueDateTo", required = false) String vatIssueDateTo,
            @RequestParam(value = "vatTotalFrom", required = false) BigDecimal vatTotalFrom,
            @RequestParam(value = "vatTotalTo", required = false) BigDecimal vatTotalTo) {
    	if(vatSellerCustNo != null || vatIssueDateFrom != null || vatIssueDateTo != null || vatTotalFrom != null || vatTotalTo != null){
			AccountDTO dto = new AccountDTO();
			if(vatSellerCustNo != null) dto.setVatSellerCustNo(vatSellerCustNo);
			if(vatIssueDateFrom != null) dto.setVatIssueDateFrom(vatIssueDateFrom);
			if(vatIssueDateTo != null) dto.setVatIssueDateTo(vatIssueDateTo);
			if(vatTotalFrom != null) dto.setVatTotalFrom(vatTotalFrom);
			if(vatTotalTo != null) dto.setVatTotalTo(vatTotalTo);
			mav.addObject("vatList", accountService.listvatSearchB(session, dto));
		} else {
			AccountDTO dto = new AccountDTO();
            LocalDate now = LocalDate.now();
            int year = now.getYear();
            dto.setVatIssueDateFrom(year + "-01-01");
            dto.setVatIssueDateTo(year + "-12-31");
			mav.addObject("vatList", accountService.listvatB(session, dto));
		}
    	mav.addObject("listCust", custService.listCust(session));
        mav.setViewName("settle/vatListB");
        return mav;
    }
    
    @RequestMapping("vatlistS.do")
    public ModelAndView vatListS(HttpSession session, ModelAndView mav, 
            @RequestParam(value = "vatBuyerCustNo", required = false) Integer vatBuyerCustNo,
            @RequestParam(value = "vatIssueDateFrom", required = false) String vatIssueDateFrom,
            @RequestParam(value = "vatIssueDateTo", required = false) String vatIssueDateTo,
            @RequestParam(value = "vatTotalFrom", required = false) BigDecimal vatTotalFrom,
            @RequestParam(value = "vatTotalTo", required = false) BigDecimal vatTotalTo) {
    	if(vatBuyerCustNo != null || vatIssueDateFrom != null || vatIssueDateTo != null || vatTotalFrom != null || vatTotalTo != null){
			AccountDTO dto = new AccountDTO();
			if(vatBuyerCustNo != null) dto.setVatBuyerCustNo(vatBuyerCustNo);
			if(vatIssueDateFrom != null) dto.setVatIssueDateFrom(vatIssueDateFrom);
			if(vatIssueDateTo != null) dto.setVatIssueDateTo(vatIssueDateTo);
			if(vatTotalFrom != null) dto.setVatTotalFrom(vatTotalFrom);
			if(vatTotalTo != null) dto.setVatTotalTo(vatTotalTo);
			mav.addObject("vatList", accountService.listvatSearchS(session, dto));
		} else {
			AccountDTO dto = new AccountDTO();
            LocalDate now = LocalDate.now();
            int year = now.getYear();
            dto.setVatIssueDateFrom(year + "-01-01");
            dto.setVatIssueDateTo(year + "-12-31");
			mav.addObject("vatList", accountService.listvatS(session, dto));
		}
    	mav.addObject("listCust", custService.listCust(session));
        mav.setViewName("settle/vatListS");
        return mav;
    }
    
    @RequestMapping("vatlistDocB.do")
    public ModelAndView vatlistDocB(HttpSession session, ModelAndView mav, 
            @RequestParam(value = "vatSellerCustNo", required = false) Integer vatSellerCustNo,
            @RequestParam(value = "vatIssueDateFrom", required = false) String vatIssueDateFrom,
            @RequestParam(value = "vatIssueDateTo", required = false) String vatIssueDateTo,
            @RequestParam(value = "vatTotalFrom", required = false) BigDecimal vatTotalFrom,
            @RequestParam(value = "vatTotalTo", required = false) BigDecimal vatTotalTo) {
    	if(vatSellerCustNo != null || vatIssueDateFrom != null || vatIssueDateTo != null || vatTotalFrom != null || vatTotalTo != null){
			AccountDTO dto = new AccountDTO();
			if(vatSellerCustNo != null) dto.setVatSellerCustNo(vatSellerCustNo);
			if(vatIssueDateFrom != null) dto.setVatIssueDateFrom(vatIssueDateFrom);
			if(vatIssueDateTo != null) dto.setVatIssueDateTo(vatIssueDateTo);
			if(vatTotalFrom != null) dto.setVatTotalFrom(vatTotalFrom);
			if(vatTotalTo != null) dto.setVatTotalTo(vatTotalTo);
			mav.addObject("vatList", accountService.listvatSearchB(session, dto));
		} 
//    	else {
//			AccountDTO dto = new AccountDTO();
//            LocalDate now = LocalDate.now();
//            int year = now.getYear();
//            dto.setVatIssueDateFrom(year + "-01-01");
//            dto.setVatIssueDateTo(year + "-12-31");
//			mav.addObject("vatList", accountService.listvatB(session, dto));
//		}
    	mav.addObject("listCust", custService.listCust(session));
        mav.setViewName("settle/vatListDocB");
        return mav;
    }
    
    @RequestMapping("vatlistDocS.do")
    public ModelAndView vatlistDocS(HttpSession session, ModelAndView mav, 
            @RequestParam(value = "vatBuyerCustNo", required = false) Integer vatBuyerCustNo,
            @RequestParam(value = "vatIssueDateFrom", required = false) String vatIssueDateFrom,
            @RequestParam(value = "vatIssueDateTo", required = false) String vatIssueDateTo,
            @RequestParam(value = "vatTotalFrom", required = false) BigDecimal vatTotalFrom,
            @RequestParam(value = "vatTotalTo", required = false) BigDecimal vatTotalTo) {
    	if(vatBuyerCustNo != null || vatIssueDateFrom != null || vatIssueDateTo != null || vatTotalFrom != null || vatTotalTo != null){
			AccountDTO dto = new AccountDTO();
			if(vatBuyerCustNo != null) dto.setVatBuyerCustNo(vatBuyerCustNo);
			if(vatIssueDateFrom != null) dto.setVatIssueDateFrom(vatIssueDateFrom);
			if(vatIssueDateTo != null) dto.setVatIssueDateTo(vatIssueDateTo);
			if(vatTotalFrom != null) dto.setVatTotalFrom(vatTotalFrom);
			if(vatTotalTo != null) dto.setVatTotalTo(vatTotalTo);
			mav.addObject("vatList", accountService.listvatSearchS(session, dto));
		} 
//    	else {
//			AccountDTO dto = new AccountDTO();
//            LocalDate now = LocalDate.now();
//            int year = now.getYear();
//            dto.setVatIssueDateFrom(year + "-01-01");
//            dto.setVatIssueDateTo(year + "-12-31");
//			mav.addObject("vatList", accountService.listvatS(session, dto));
//		}
    	mav.addObject("listCust", custService.listCust(session));
        mav.setViewName("settle/vatListDocS");
        return mav;
    }

    @RequestMapping("vatlistT.do")
    public ModelAndView vatListT(HttpSession session, ModelAndView mav,
                                 @RequestParam(value = "vatSellerCustNo", required = false) Integer vatSellerCustNo,
                                 @RequestParam(value = "vatType", required = false) String vatType,
                                 @RequestParam(value = "vatIssueDateFrom", required = false) String vatIssueDateFrom,
                                 @RequestParam(value = "vatIssueDateTo", required = false) String vatIssueDateTo,
                                 @RequestParam(value = "vatSerial", required = false) String vatSerial,
                                 @RequestParam(value = "vatRemark", required = false) String vatRemark) {
        if(vatSellerCustNo != null || vatType != null || vatIssueDateFrom != null || vatIssueDateTo != null || vatSerial != null || vatRemark != null){
            AccountDTO dto = new AccountDTO();
            if(vatSellerCustNo != null) dto.setVatSellerCustNo(vatSellerCustNo);
            if(vatType != null) dto.setVatType(vatType);
            if(vatIssueDateFrom != null) dto.setVatIssueDateFrom(vatIssueDateFrom);
            if(vatIssueDateTo != null) dto.setVatIssueDateTo(vatIssueDateTo);
            if(vatSerial != null) dto.setVatSerial(vatSerial);
            if(vatRemark != null) dto.setVatRemark(vatRemark);
            mav.addObject("vatList", accountService.listvatSearchT(session, dto));
        } else {
            AccountDTO dto = new AccountDTO();
            mav.addObject("vatList", accountService.listvatT(session, dto));
        }
        mav.setViewName("settle/vatListT");
        return mav;
    }
    
	/*
	 * @RequestMapping("custVatList.do") public ModelAndView custVatList(HttpSession
	 * session, ModelAndView mav) { mav.setViewName("settle/custVatList"); return
	 * mav; }
	 */
    
    @ResponseBody
    @RequestMapping("custVatListCount.do")
    public List<AccountDTO> custVatListCount(ModelAndView mav, @ModelAttribute AccountDTO dto)
    {
    	List<AccountDTO> count = accountService.custVatListCount(dto);
        return count;
    }
    
    @ResponseBody
    @RequestMapping("custSelectVatList.do")
    public List<AccountDTO> custSelectVatList(@ModelAttribute AccountDTO dto)
    {
    	System.out.println("占쎈쑓占쎌뵠占쎈뱜 : " + dto.getVatIssueDateFrom());
    	LocalDate now = LocalDate.now();
        int year = now.getYear();
        
    	if(dto.getVatIssueDateFrom() == null) {
    		dto.setVatIssueDateFrom(year + "-01-01");
    	}
    	
    	if(dto.getVatIssueDateTo() == null) {
    		dto.setVatIssueDateTo(year + "-12-31");
    	}
    	
    	List<AccountDTO> count = accountService.custSelectVatList(dto);
        return count;
    }
    
    @ResponseBody
    @RequestMapping("baccheck.do")
    public AccountDTO baccheck(ModelAndView mav, @ModelAttribute AccountDTO dto)
    {
        AccountDTO vserial = accountService.checkBac(dto);
        return vserial;
    }
    
    @ResponseBody
    @RequestMapping("cardCheck.do")
    public AccountDTO cardCheck(ModelAndView mav, @ModelAttribute AccountDTO dto)
    {
        AccountDTO cardserial = accountService.cardCheck(dto);
        return cardserial;
    }

    @RequestMapping("baclist.do")
    public ModelAndView bacList(HttpSession session, ModelAndView mav) {
        mav.addObject("vatList", accountService.listbac(session));
        mav.setViewName("settle/baclist");
        return mav;
    }

    @RequestMapping("regbac.do")
    public ModelAndView regbac(HttpSession session, ModelAndView mav) {
        mav.addObject("vatList", accountService.listbac(session));
        mav.addObject("bnkcd", codeService.listCode003("BANKCD"));
        mav.addObject("baccd", codeService.listCode003("BACTYPE"));
        mav.setViewName("settle/regbaclist");
        return mav;
    }
    
    @RequestMapping("regCard.do")
    public ModelAndView regCard(HttpSession session, ModelAndView mav) {
        mav.addObject("cardList", accountService.listCard(session));
        mav.addObject("userList", accountService.userList(session));
        mav.addObject("bnkcd", codeService.listCode003("BANKCD"));
        mav.addObject("baccd", codeService.listCode003("BACTYPE"));
        mav.setViewName("settle/regcardlist");
        return mav;
    }

    @RequestMapping("bacdetail.do")
    public ModelAndView bacDetail(HttpSession session, ModelAndView mav) {
        mav.addObject("bacList", accountService.listbac(session));
        mav.setViewName("settle/bacdetail");
        return mav;
    }
    
    @RequestMapping("check_connect.do")
    public ModelAndView check_connect(HttpSession session, ModelAndView mav) {
//    	AccountDTO dto = new AccountDTO();
//    	Integer compNo = SessionInfoGet.getCompNo(session);
//    	dto.setCompNo(compNo);
//    	mav.addObject("list", accountService.check_link_vatandbac(dto));
    	mav.addObject("listCust", custService.listCust(session));
        mav.setViewName("settle/check_connect");
        return mav;
    }
    
    @ResponseBody
    @RequestMapping("check_connect_json.do")
    public Map<String, Object> check_connect_json(HttpSession session, HttpServletRequest request, @ModelAttribute AccountDTO dto) {
    	int firstLimit = 0;
    	int pageLength = 0;
    	firstLimit = Integer.parseInt(request.getParameter("start"));
    	pageLength = Integer.parseInt(request.getParameter("length"));
    	Integer compNo = SessionInfoGet.getCompNo(session);
    	dto.setCompNo(compNo);
    	dto.setFirstLimit(firstLimit);
    	dto.setLastLimit(pageLength);
    	List<AccountDTO> list = accountService.check_link_vatandbac(dto);
    	AccountDTO listLength = accountService.check_link_vatandbacCnt(dto);
    	Map<String, Object> mapList = new HashMap<String, Object>();
    	mapList.put("data", list);
    	mapList.put("recordsTotal", listLength.getResultCount());
    	mapList.put("recordsFiltered", listLength.getResultCount());
        return mapList;
    }
    
    @RequestMapping("cardDetail.do")
    public ModelAndView cardDetail(HttpSession session, ModelAndView mav) {
        mav.addObject("cardList", accountService.listCard(session));
        mav.setViewName("settle/carddetail");
        return mav;
    }

    @RequestMapping("bacupdate.do")
    public ModelAndView bacUpload(HttpSession session, ModelAndView mav, @ModelAttribute AccountDTO dto) {
        mav.setViewName("settle/bacupload");
        return mav;
    }
    
    @RequestMapping("cardUpload.do")
    public ModelAndView cardUpload(HttpSession session, ModelAndView mav, @ModelAttribute AccountDTO dto) {
//        mav.addObject("vatList", accountService.listvat(session, dto));
        mav.setViewName("settle/cardupload");
        return mav;
    }
    
    @ResponseBody
    @RequestMapping("listVatBCnt.do")
    public AccountDTO listVatBCnt(@ModelAttribute AccountDTO dto){
    	AccountDTO count = accountService.listVatBCnt(dto);
    	
    	return count;
    }
    
    @ResponseBody
    @RequestMapping("selectVatCust/{vatNo}")
    public AccountDTO selectVatCust(@PathVariable("vatNo") String vatNo) {
    	AccountDTO dto = accountService.selectVatCust(vatNo);
    	
		return dto;
    }

    @ResponseBody
    @RequestMapping("vatcheck.do")
    public AccountDTO vchk(ModelAndView mav, @ModelAttribute AccountDTO dto)
    {
        AccountDTO vserial = accountService.checkVat(dto);
        return vserial;
    }

    @ResponseBody
    @RequestMapping("bacSelectList.do")
    public List<AccountDTO> bacSelectList(@ModelAttribute AccountDTO dto){
    	List<AccountDTO> accList = accountService.bacSelectList(dto);
    	
    	return accList;
    }
    
    @ResponseBody
    @RequestMapping("bacCalSelect.do")
    public AccountDTO bacCalSelect(@ModelAttribute AccountDTO dto){
    	AccountDTO accList = accountService.bacCalSelect(dto);
    	
    	return accList;
    }
    
    @ResponseBody
    @RequestMapping("bacSelectListCnt.do")
    public AccountDTO bacSelectListCnt(@ModelAttribute AccountDTO dto){
    	AccountDTO count = accountService.bacSelectListCnt(dto);
    	
    	return count;
    }
    
    @ResponseBody
    @RequestMapping("cardSelectList.do")
    public List<AccountDTO> cardSelectList(@ModelAttribute AccountDTO dto){
    	List<AccountDTO> accList = accountService.cardSelectList(dto);
    	
    	return accList;
    }
    
    @ResponseBody
    @RequestMapping("cardSelectListCount.do")
    public AccountDTO cardSelectListCount(@ModelAttribute AccountDTO dto){
    	AccountDTO count = accountService.cardSelectListCount(dto);
    	
    	return count;
    }
    
    @RequestMapping("vatupload.do")
    public ModelAndView vatUpload(HttpSession session, ModelAndView mav, @ModelAttribute AccountDTO dto) {
		/* mav.addObject("vatList", accountService.listvat(session, dto)); */
        mav.setViewName("settle/vatupload");
        return mav;
    }

    @RequestMapping("vatdetail/{vatId}")
    public ModelAndView vatDetail(@PathVariable("vatId") int vatId, ModelAndView mav) {
        mav.addObject("vatdetail", accountService.detailvat(vatId));
        mav.setViewName("settle/vatdetail");
        return mav;
    }

    @RequestMapping("insertvat.do")
    public ResponseEntity<Object> insertvat(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int vatIns = accountService.insertVat(dto);
        if(vatIns > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }

    @RequestMapping("insertbac.do")
    public ResponseEntity<Object> insertbac(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int vatIns = accountService.insertBac(dto);
        if(vatIns > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("insertCard.do")
    public ResponseEntity<Object> insertCard(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int cardIns = accountService.insertCard(dto);
        if(cardIns > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }

    @RequestMapping("insertbacledger.do")
    public ResponseEntity<Object> insertbacledger(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int vatIns = accountService.insertBacledger(dto);
        if(vatIns > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("insertCardLedger.do")
    public ResponseEntity<Object> insertCardLedger(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int cardIns = accountService.insertCardLedger(dto);
        if(cardIns > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }

    @RequestMapping("vatStatuschg.do")
    public ResponseEntity<Object> chgvat(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int chgVat = accountService.updvatStat(dto);
        if(chgVat > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("/totalamount/{vatSerial}")
    public String totalamount(@PathVariable("vatSerial") String vatSerial, AccountDTO dto, Model model) {
    	dto.setVatSerial(vatSerial);
    	List<AccountDTO> connect_list = accountService.connect_list(dto);
    	model.addAttribute("connect_list", connect_list);
    	return "settle/totalamount";
    }
    
    @RequestMapping("lastUpdate.do")
    public ResponseEntity<Object> lastUpdate(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int bacIns = accountService.lastUpdate(dto);
        if(bacIns > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("lastUpdateCard.do")
    public ResponseEntity<Object> lastUpdateCard(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int cardIns = accountService.lastUpdateCard(dto);
        if(cardIns > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("bacSerialUpdate.do")
    public ResponseEntity<Object> bacSerialUpdate(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int bacIns = accountService.bacSerialUpdate(dto);
        accountService.updatevatlinkedcheck(dto);
        if(bacIns > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("billInsert.do")
    public ResponseEntity<Object> billInsert(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int billIns = accountService.billInsert(dto);
        if(billIns > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("sVatToChange.do")
	public ResponseEntity<?> sVatToChange(@ModelAttribute AccountDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int vatUpdate = accountService.sVatToChange(dto);
		if (vatUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
    @RequestMapping("bacCheckConnect.do")
    public ResponseEntity<Object> bacCheckConnect(HttpSession session, @ModelAttribute AccountDTO dto){
    	
        Map<String,Object> param = new HashMap<>();
        //swc_bacledger占쎌벥 linkDoc 揶쏅�れ뵠 y揶쏉옙 占쎈툡占쎈빍�⑨옙 ''揶쏅�れ뵠 占쎈툡占쎈빜占쎈르
        String datalinkDocno = dto.getLinkDocno();
        String number_linkDoc = accountService.number_linkDoc(dto);
        
        if(!number_linkDoc.equals("y")) {
        	if(!number_linkDoc.equals("n")) {
        		dto.setLinkDocno(number_linkDoc);
        		accountService.change_originlinkDoc(dto);
        		//占쎈염野껉퀬釉�占쎈뮉 疫뀀뜆釉멩�⑨옙 占쎈꽰占쎌삢 疫뀀뜆釉몌옙�뵠 占쎌뵬燁살꼹釉�占쎈뮉 野껋럩�뒭 s5嚥∽옙 癰귨옙野껓옙
        		//占쎈릭筌욑옙筌랃옙 占쎈염野껉퀬釉�占쎈뮉 疫뀀뜆釉몌옙�뒲 占쎌뿳占쎈뮉占쎈쑓 占쎈꽰占쎌삢 疫뀀뜆釉멩�⑨옙 占쎌뵬燁살꼹釉�筌욑옙 占쎈륫占쎈뮉占쎈뼄筌롳옙 s3 (�뀎�똾釉� 占쎌뿯/�빊�뮄�닊占쎌뵠占쎌뵬 占쎄문揶쏄낱釉�筌롳옙 占쎈쭆占쎈뼄.)
        	}
        }
        dto.setLinkDocno(datalinkDocno);
        int bacIns = accountService.bacCheckConnect(dto);
        accountService.updatevatmultilinkedcheck(dto);
        accountService.updatelogIdlink(dto);
        if(bacIns > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        
        BigDecimal sum = new BigDecimal("0");
        List<AccountDTO> dataprice = accountService.dataprice(dto);
		for(int i=0; i < dataprice.size(); i++) {
			BigDecimal a = dataprice.get(i).getVatTax(); 
			BigDecimal b = dataprice.get(i).getVatAmount();
			sum = sum.add(a.add(b));
		}
		BigDecimal zeroBigDec = new BigDecimal("0");
		List<AccountDTO> totalprice = accountService.total_price(dto);
		BigDecimal in_num = totalprice.get(0).getInAmt();
		BigDecimal out_num = totalprice.get(0).getOutAmt();
		System.out.println("sum===============" + sum);
		System.out.println("zeroBigDec==============" + zeroBigDec);
		System.out.println("in_num=============" + in_num);
		System.out.println("out_num===========" + out_num);
		
		int compareResult = in_num.compareTo(out_num);
		int compareResult_in = sum.compareTo(in_num); 
		int compareResult_in_secound = in_num.compareTo(zeroBigDec);
		int compareResult_out = sum.compareTo(out_num);
		int compareResult_out_secound = out_num.compareTo(zeroBigDec);
		
		//
		if(compareResult > 0) {
			if(compareResult_in < 0){
				if(compareResult_in_secound > 0) {
					for(int i=0; i < totalprice.size(); i++) {
						dto.setLinkDocno(totalprice.get(i).getLinkDocno());
						accountService.update_s3(dto);
					}
				}
				//detail占쎈퓠 占쎈퉸占쎈뼣占쎈릭占쎈뮉 占쎈뻻�뵳�딅선占쎌벥 id揶쏅�れ뱽 揶쏉옙筌욑옙 swc_bacledger占쎌벥 in疫뀀뜆釉몌옙�뱽 占쎈�燁살꼵�� swc_vat占쎌벥 疫뀀뜆釉멩�⑨옙 揶쏆늾�뼄筌롳옙 占쎈퉸占쎈뼣 占쎈뻻�뵳�딅선�몴占� 揶쏉옙筌욑옙 swc_vat占쎌벥 lincked占쎈뮉 0, s5嚥∽옙 癰귨옙野껓옙.
				List <AccountDTO> checktotalprice_vat_and_detail = accountService.checktotalprice_vat_and_detail(dto);
				BigDecimal total_detail = checktotalprice_vat_and_detail.get(0).getTotal_Amt();
				int finalcompare = sum.compareTo(total_detail);
				if(finalcompare == 0) {
					accountService.update_s5(dto);
					accountService.updatevatmultilinkedcheck(dto);
				}
			}else if(compareResult_in == 0) {
				for(int i=0; i < totalprice.size(); i++) {
					dto.setLinkDocno(totalprice.get(i).getLinkDocno());
					accountService.update_s5(dto);
				}
			}else if(compareResult_in > 0) {
				for(int i=0; i < totalprice.size(); i++) {
					dto.setLinkDocno(totalprice.get(i).getLinkDocno());
					accountService.update_s3(dto);
					accountService.cancelconnect_linkedcheck(dto);
				}
				//detail占쎈퓠 占쎈퉸占쎈뼣占쎈릭占쎈뮉 占쎈뻻�뵳�딅선占쎌벥 id揶쏅�れ뱽 揶쏉옙筌욑옙 swc_bacledger占쎌벥 in疫뀀뜆釉몌옙�뱽 占쎈�燁살꼵�� swc_vat占쎌벥 疫뀀뜆釉멩�⑨옙 揶쏆늾�뼄筌롳옙 占쎈퉸占쎈뼣 占쎈뻻�뵳�딅선�몴占� 揶쏉옙筌욑옙 swc_vat占쎌벥 lincked占쎈뮉 0, s5嚥∽옙 癰귨옙野껓옙.
				List <AccountDTO> checktotalprice_vat_and_detail = accountService.checktotalprice_vat_and_detail(dto);
				BigDecimal total_detail = checktotalprice_vat_and_detail.get(0).getTotal_Amt();
				int finalcompare = sum.compareTo(total_detail);
				if(finalcompare == 0) {
					accountService.update_s5(dto);
					accountService.updatevatmultilinkedcheck(dto);
				}
			}
		}else if(compareResult < 0) {
			if(compareResult_out == 0) {
				//s5
				for(int i=0; i < totalprice.size(); i++) {
					dto.setLinkDocno(totalprice.get(i).getLinkDocno());
					accountService.update_b5(dto);
				}
			}else if(compareResult_out < 0){
				if(compareResult_out_secound > 0) {
					//s3
					for(int i=0; i < totalprice.size(); i++) {
						dto.setLinkDocno(totalprice.get(i).getLinkDocno());
						accountService.update_b3(dto);
					}
				}
				//detail占쎈퓠 占쎈퉸占쎈뼣占쎈릭占쎈뮉 占쎈뻻�뵳�딅선占쎌벥 id揶쏅�れ뱽 揶쏉옙筌욑옙 swc_bacledger占쎌벥 in疫뀀뜆釉몌옙�뱽 占쎈�燁살꼵�� swc_vat占쎌벥 疫뀀뜆釉멩�⑨옙 揶쏆늾�뼄筌롳옙 占쎈퉸占쎈뼣 占쎈뻻�뵳�딅선�몴占� 揶쏉옙筌욑옙 swc_vat占쎌벥 lincked占쎈뮉 0, s5嚥∽옙 癰귨옙野껓옙.
				List <AccountDTO> checktotalprice_vat_and_detail_out = accountService.checktotalprice_vat_and_detail_out(dto);
				BigDecimal total_detail = checktotalprice_vat_and_detail_out.get(0).getTotal_Amt();
				int finalcompare = sum.compareTo(total_detail);
				if(finalcompare == 0) {
					accountService.update_b5(dto);
					accountService.updatevatmultilinkedcheck(dto);
				}
			}else if(compareResult_out > 0) {
				for(int i=0; i < totalprice.size(); i++) {
					dto.setLinkDocno(totalprice.get(i).getLinkDocno());
					accountService.update_b3(dto);
					accountService.cancelconnect_linkedcheck(dto);
				}
				//detail占쎈퓠 占쎈퉸占쎈뼣占쎈릭占쎈뮉 占쎈뻻�뵳�딅선占쎌벥 id揶쏅�れ뱽 揶쏉옙筌욑옙 swc_bacledger占쎌벥 in疫뀀뜆釉몌옙�뱽 占쎈�燁살꼵�� swc_vat占쎌벥 疫뀀뜆釉멩�⑨옙 揶쏆늾�뼄筌롳옙 占쎈퉸占쎈뼣 占쎈뻻�뵳�딅선�몴占� 揶쏉옙筌욑옙 swc_vat占쎌벥 lincked占쎈뮉 0, s5嚥∽옙 癰귨옙野껓옙.
				List <AccountDTO> checktotalprice_vat_and_detail_out = accountService.checktotalprice_vat_and_detail_out(dto);
				BigDecimal total_detail = checktotalprice_vat_and_detail_out.get(0).getTotal_Amt();
				int finalcompare = sum.compareTo(total_detail);
				if(finalcompare == 0) {
					accountService.update_b5(dto);
					accountService.updatevatmultilinkedcheck(dto);
				}
			}
		}
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("bacCheckConnect_modal_update.do")
    public ResponseEntity<Object> bacCheckConnect_modal_update(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        accountService.bacCheckConnect_modal_update(dto);
		List <AccountDTO> check_lincked_last = accountService.check_lincked_last(dto);
		System.out.println(Integer.parseInt(check_lincked_last.get(0).getModal_vatmemo()));
		if(Integer.parseInt(check_lincked_last.get(0).getModal_vatmemo()) == 0) {
			if(check_lincked_last.get(0).getVatStatus().equals("S1") || check_lincked_last.get(0).getVatStatus().equals("S3") || check_lincked_last.get(0).getVatStatus().equals("S5")) {
				accountService.update_s5(dto);
				accountService.updatevatmultilinkedcheck(dto);
			}else if(check_lincked_last.get(0).getVatStatus().equals("B1") || check_lincked_last.get(0).getVatStatus().equals("B3") || check_lincked_last.get(0).getVatStatus().equals("B5")) {
				accountService.update_b5(dto);
				accountService.updatevatmultilinkedcheck(dto);
			}
		}
        return ResponseEntity.ok(param);
    }
    @RequestMapping("bacCheckConnect_modal_baclogId_memo.do")
    public ResponseEntity<Object> bacCheckConnect_modal_baclogId_memo(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        accountService.bacCheckConnect_modal_baclogId_memo(dto);
        
        List <AccountDTO> check_remain_money_from_swc_vat = accountService.check_remain_money_from_swc_vat(dto);
        if(check_remain_money_from_swc_vat.get(0).getModal_vatmemo() == "0"){
        	if(check_remain_money_from_swc_vat.get(0).getVatStatus() == "S1" || check_remain_money_from_swc_vat.get(0).getVatStatus() == "S3") {
        		accountService.update_check_remain_money_from_swc_vat(dto);
        	}else if(check_remain_money_from_swc_vat.get(0).getVatStatus() == "B1" || check_remain_money_from_swc_vat.get(0).getVatStatus() == "B3") {
        		accountService.update_check_remain_money_from_swc_vat_B(dto);
        	}
        }
        
        return ResponseEntity.ok(param);
    }
    
    
    @RequestMapping("connect_link_check_cancel.do")
    public ResponseEntity<Object> connect_link_check_cancel(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        
        //swc_bacledger_detail占쎈퓠 揶쏉옙占쎈땾
        int listNumber = accountService.connnectlist_Num(dto);
        int detail_Count_equal_baclogId = accountService.detail_Count_equal_baclogId(dto);
        List<AccountDTO> select_vatStatus = accountService.select_vatStatus(dto);
        if(listNumber != 0) {
        	if(detail_Count_equal_baclogId == 1) {
	        	//swc_bacledger占쎈뮉 delete 占쎈┷野껓옙 域밸챶�봺�⑨옙 占쎈퉸占쎈뼣 serial�몴占� 揶쏉옙筌욑옙 swc_vat占쏙옙 1嚥∽옙 癰귨옙野껓옙
	        	accountService.deleteconnectlist(dto);
	        	accountService.cancelconnect_linkedcheck(dto);
	        	if(select_vatStatus.get(0).getVatStatus().equals("S5")) {
	        		accountService.update_vatStatus(dto);
	        	}else if(select_vatStatus.get(0).getVatStatus().equals("S3")) {
	        		accountService.update_vatStatus(dto);
	        	}else if(select_vatStatus.get(0).getVatStatus().equals("B5")) {
	        		accountService.update_vatStatus_B(dto);
	        	}else if(select_vatStatus.get(0).getVatStatus().equals("B3")) {
	        		accountService.update_vatStatus_B(dto);
	        	}
        	}else if(detail_Count_equal_baclogId != 1) {
        		//占쎌뿯疫뀐옙 占쎌뵬占쎈르
        		if(select_vatStatus.get(0).getVatStatus().equals("S5") || select_vatStatus.get(0).getVatStatus().equals("S3")){
	        		accountService.deleteconnectlist_sub(dto);
	        		
	        		BigDecimal sum = new BigDecimal("0");
	        	    	List<AccountDTO> dataprice_secound = accountService.dataprice_secound(dto);
	        			for(int i=0; i < dataprice_secound.size(); i++) {
	        				BigDecimal a = dataprice_secound.get(i).getVatTax(); 
	        				BigDecimal b = dataprice_secound.get(i).getVatAmount();
	        				sum = sum.add(a.add(b));
	        			}
	        		System.out.println("sum=================" + sum);
	        		
	        		List <AccountDTO> checktotalprice_vat_and_detail = accountService.checktotalprice_vat_and_detail(dto);
					BigDecimal total_detail = checktotalprice_vat_and_detail.get(0).getTotal_Amt();
					int finalcompare = sum.compareTo(total_detail);
					System.out.println("finalcompare========================" + finalcompare);
					if(finalcompare == 0) {
						accountService.update_s5(dto);
						accountService.updatevatmultilinkedcheck(dto);
					}else if(finalcompare > 0) {
						accountService.update_s3(dto);
						accountService.cancelconnect_linkedcheck(dto);
					}
				//�빊�뮄�닊占쎌뵬占쎈르
        		}else if(select_vatStatus.get(0).getVatStatus().equals("B5") || select_vatStatus.get(0).getVatStatus().equals("B3")) {
        			accountService.deleteconnectlist_sub(dto);
	        		
	        		BigDecimal sum = new BigDecimal("0");
	        	    	List<AccountDTO> dataprice_secound = accountService.dataprice_secound(dto);
	        			for(int i=0; i < dataprice_secound.size(); i++) {
	        				BigDecimal a = dataprice_secound.get(i).getVatTax(); 
	        				BigDecimal b = dataprice_secound.get(i).getVatAmount();
	        				sum = sum.add(a.add(b));
	        			}
	        		System.out.println("sum=================" + sum);
	        		
	        		List <AccountDTO> checktotalprice_vat_and_detail = accountService.checktotalprice_vat_and_detail(dto);
					BigDecimal total_detail = checktotalprice_vat_and_detail.get(0).getTotal_Amt();
					int finalcompare = sum.compareTo(total_detail);
					System.out.println("finalcompare========================" + finalcompare);
					if(finalcompare == 0) {
						accountService.update_b5(dto);
						accountService.updatevatmultilinkedcheck(dto);
					}else if(finalcompare > 0) {
						accountService.update_b3(dto);
						accountService.cancelconnect_linkedcheck(dto);
					}
        		}
        	}
        }
        //0占쎌뵬 野껋럩�뒭占쎈뮉 占쎈あ揶쏉옙筌욑옙 野껋럩�뒭揶쏉옙 鈺곕똻�삺 (疫꿸퀣�덌옙肉� swc_bacledger占쎌벥 �뚎됱쓥占쎌몵嚥∽옙 占쎈굶占쎈선揶쏉옙 占쎌뿳占쎈뮉 野껋럩�뒭, 筌욊쑴彛� 占쎈툡�눧占� 占쎈염野껉퀣�뵠 占쎈씨占쎈뮉野껋럩�뒭)
        else if (listNumber == 0) {
        	int searchserial = accountService.searchserial(dto);
        	//swc_bacledger占쎌벥 �뚎됱쓥占쎈퓠 占쎈퉸占쎈뼣 serial占쎌뵠 占쎈씨占쎈뮉野껋럩�뒭 0占쎌뱽 獄쏆꼹�넎, 域밸챶�쟽野껓옙 占쎈┷筌롳옙 疫꿸퀣�덌옙肉� 占쎈염野껉퀡留� �눧紐꾧퐣占쎈즲 占쎈씨占쎈뼄占쎈뮉 占쎈꺖�뵳占�
        	if(searchserial != 0) {
        		accountService.cancelconnect_linkDoc(dto);
        		accountService.cancelconnect_linkedcheck(dto);
        		//swv_bacledger占쎌벥 占쎈퉸占쎈뼣 �뚎됱쓥 '' 域밸챶�봺�⑨옙 占쎈퉸占쎈뼣 serial�몴占� 揶쏉옙筌욑옙 swc_vat占쏙옙 1嚥∽옙 癰귨옙野껓옙
        	}
        }
        int listNumber_secound_check = accountService.connnectlist_Num(dto);
        int searchserial_secound_check = accountService.searchserial(dto);
        if(listNumber_secound_check == 0 ) {
        	if(searchserial_secound_check == 0) {
        		accountService.cancel_connect_final(dto);
        	}
        }
        //�뿆�뫁�꺖 占쎈뻻 占쎄텚占쏙옙 疫뀀뜆釉� 筌ㅼ뮇�뻿占쎌넅
        BigDecimal a = dto.getCancel_lincked_price();
        List <AccountDTO> getlicked_price = accountService.getlicked_price(dto);
        BigDecimal b = new BigDecimal(getlicked_price.get(0).getModal_vatmemo().replaceAll("\\,",""));
        BigDecimal c = getlicked_price.get(0).getModal_receive_data();
        BigDecimal d = a.add(b);
        BigDecimal e = c.subtract(a);
        dto.setModal_vatmemo(new java.text.DecimalFormat("#,###").format(d).toString());
        dto.setModal_receive_data(e);
        accountService.bacCheckConnect_modal_update(dto);
        //�④쑴伊� 占쎌삆占쎈연 疫뀀뜆釉�
        List <AccountDTO> getlicked_price_secound = accountService.getlicked_price_secound(dto);
        BigDecimal f = getlicked_price_secound.get(0).getDifference_price();
        BigDecimal g = a.add(f);
        dto.setDifference_price(g);
        accountService.bacCheckConnect_modal_update_secound(dto);
        
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("endusernamelist.do/{soppNo}")
    public ResponseEntity<Object> endusernamelist(@PathVariable("soppNo") int soppNo, HttpSession session, AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        dto.setSoppNo(soppNo);
        List<AccountDTO> endusernamelist = accountService.endusernamelist(dto);
        param.put("data", endusernamelist);
        return ResponseEntity.ok(param);
    }
    @RequestMapping("endusernamelist_cont.do/{contNo}")
    public ResponseEntity<Object> endusernamelist_cont(@PathVariable("contNo") int contNo, HttpSession session, AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        dto.setContNo(contNo);
        List<AccountDTO> endusernamelist_cont = accountService.endusernamelist_cont(dto);
        param.put("data", endusernamelist_cont);
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("vatHtml/{vatSerial}/{vatType}")
    public ModelAndView vatHtml(HttpSession session, ModelAndView mav, @PathVariable("vatSerial") String vatSerial, @PathVariable("vatType") String vatType) {
    	AccountDTO dto = new AccountDTO();
    	dto.setVatSerial(vatSerial);
    	dto.setVatType(vatType);
    	
    	if(vatType.equals("B")) {
    		mav.addObject("vatList", accountService.vatHtmlListB(dto));
    	}else {
    		mav.addObject("vatList", accountService.vatHtmlListS(dto));
    	}
    	mav.setViewName("form/vatHtml");
    	
    	return mav;
    }
    
    @RequestMapping("custVatListHtmlS/{compNo}/{vatBuyerCustNo}/{vatIssueDateFrom}/{vatIssueDateTo}/{selectYear}/{vatType}")
    public ModelAndView custVatListHtml(HttpSession session, ModelAndView mav, @PathVariable("compNo") int compNo, @PathVariable("vatBuyerCustNo") int vatBuyerCustNo, @PathVariable("vatIssueDateFrom") String vatIssueDateFrom, @PathVariable("vatIssueDateTo") String vatIssueDateTo, @PathVariable("selectYear") int selectYear, @PathVariable("vatType") String vatType) {
    	AccountDTO dto = new AccountDTO();
    	LocalDate now = LocalDate.now();
    	int year = now.getYear();
    	
    	if(!vatIssueDateFrom.equals("0")) {
    		dto.setVatIssueDateFrom(vatIssueDateFrom);
    	}else {
    		dto.setVatIssueDateFrom(year + "-01-01");
    	}
    	
    	if(!vatIssueDateTo.equals("0")) {
    		dto.setVatIssueDateTo(vatIssueDateTo);
        }else {
        	dto.setVatIssueDateTo(year + "-12-31");
        }
    	
    	if(selectYear > 0) {
    		dto.setSelectYear(selectYear);
    	}else {
    		dto.setSelectYear(year);
    	}
    	
		dto.setVatBuyerCustNo(vatBuyerCustNo);
		dto.setCompNo(compNo);
		dto.setVatType(vatType);
    	
		//mav.addObject("ledgerList", accountService.ledgerListS(session, dto));
		mav.addObject("custVatList", accountService.custVatListHtmlS(dto));
		mav.addObject("custBalance", accountService.custBalanceS(dto));
    	mav.setViewName("form/custVatListHtmlS");
    	return mav;
    }
    
    @RequestMapping("custVatListHtmlB/{compNo}/{vatSellerCustNo}/{vatIssueDateFrom}/{vatIssueDateTo}/{selectYear}/{vatType}")
    public ModelAndView custVatListHtmlB(HttpSession session, ModelAndView mav, @PathVariable("compNo") int compNo, @PathVariable("vatSellerCustNo") int vatSellerCustNo, @PathVariable("vatIssueDateFrom") String vatIssueDateFrom, @PathVariable("vatIssueDateTo") String vatIssueDateTo, @PathVariable("selectYear") int selectYear, @PathVariable("vatType") String vatType) {
    	AccountDTO dto = new AccountDTO();
    	LocalDate now = LocalDate.now();
    	int year = now.getYear();
    	
    	if(!vatIssueDateFrom.equals("0")) {
    		dto.setVatIssueDateFrom(vatIssueDateFrom);
    	}else {
    		dto.setVatIssueDateFrom(year + "-01-01");
    	}
    	
    	if(!vatIssueDateTo.equals("0")) {
    		dto.setVatIssueDateTo(vatIssueDateTo);
        }else {
        	dto.setVatIssueDateTo(year + "-12-31");
        }
    	
    	if(selectYear > 0) {
    		dto.setSelectYear(selectYear);
    	}else {
    		dto.setSelectYear(year);
    	}
    	
		dto.setVatSellerCustNo(vatSellerCustNo);
		dto.setCompNo(compNo);
		dto.setVatType(vatType);
    	
		//mav.addObject("ledgerList", accountService.ledgerListB(session, dto));
		mav.addObject("custVatList", accountService.custVatListHtmlB(dto));
		mav.addObject("custBalance", accountService.custBalanceB(dto));
    	mav.setViewName("form/custVatListHtmlB");
    	return mav;
    }
    
    @RequestMapping("bacUpdateMemo.do")
    public ResponseEntity<Object> bacUpdateMemo(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int bacUpdate = accountService.bacUpdateMemo(dto);
        if(bacUpdate > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("bacDrawInsert.do")
    public ResponseEntity<Object> bacDrawInsert(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int bacIns = accountService.bacDrawInsert(dto);
        param.put("getId", dto.getGetId());
        if(bacIns > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("bacDrawDelect.do")
    public ResponseEntity<Object> bacDrawDelect(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int bacDel = accountService.bacDrawDelect(dto);
        if(bacDel > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("bacDrawAfterUpdate.do")
    public ResponseEntity<Object> bacDrawAfterUpdate(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int bacUp = accountService.bacDrawAfterUpdate(dto);
        if(bacUp > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @ResponseBody
    @RequestMapping("selectExcelData.do")
    public AccountDTO selectExcelData(ModelAndView mav, @ModelAttribute AccountDTO dto)
    {
        AccountDTO vatDataList = accountService.selectExcelData(dto);
        
        return vatDataList;
    }
    
    @ResponseBody
    @RequestMapping("check_link_vatandbac.do")
    public List<AccountDTO> check_link_vatandbac(@ModelAttribute AccountDTO dto){
    	List<AccountDTO> check_link_vatandbac = accountService.check_link_vatandbac(dto);
    	
    	return check_link_vatandbac;
    }
    
    @ResponseBody
    @RequestMapping("check_link_vatandbacCnt.do")
    public AccountDTO check_link_vatandbacCnt(@ModelAttribute AccountDTO dto){
    	AccountDTO count = accountService.check_link_vatandbacCnt(dto);
    	
    	return count;
    }
    
    @RequestMapping("productUpdate.do")
    public ResponseEntity<Object> productUpdate(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int productUp = accountService.productUpdate(dto);
        if(productUp > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    @RequestMapping("modalVatB.do")
    public ResponseEntity<Object> modalVatB(HttpSession session, @ModelAttribute AccountDTO dto){
    	Map<String,Object> param = new HashMap<>();
    	Integer compNo = SessionInfoGet.getCompNo(session);
    	dto.setCompNo(compNo);
    	
	    List<AccountDTO> list = accountService.modalVatB(dto);
		List<AccountDTO> list_secound = accountService.list_secound_modalVatB(dto);
		param.put("data",list);
		param.put("data_secound",list_secound);
		return ResponseEntity.ok(param);
    }
    
    @ResponseBody
    @RequestMapping("modalVatListB.do")
    public List<AccountDTO> modalVatListB(HttpSession session, @ModelAttribute AccountDTO dto){
    	Integer compNo = SessionInfoGet.getCompNo(session);
    	dto.setCompNo(compNo);
    	List<AccountDTO> list = accountService.modalVatListB(dto);
    	
    	return list;
    }
    
    @ResponseBody
    @RequestMapping("modalVatBCnt.do")
    public AccountDTO modalVatBCnt(HttpSession session, @ModelAttribute AccountDTO dto){
    	Integer compNo = SessionInfoGet.getCompNo(session);
    	dto.setCompNo(compNo);
    	AccountDTO count = accountService.modalVatBCnt(dto);
    	
    	return count;
    }
    @RequestMapping("modalVatS.do")
    public ResponseEntity<Object> modalVatS(HttpSession session, @ModelAttribute AccountDTO dto){
    	Map<String,Object> param = new HashMap<>();
    	Integer compNo = SessionInfoGet.getCompNo(session);
    	dto.setCompNo(compNo);
	    List<AccountDTO> list = accountService.modalVatS(dto);
		List<AccountDTO> list_secound = accountService.list_secound_modalVatB(dto);
		param.put("data",list);
		param.put("data_secound",list_secound);
		return ResponseEntity.ok(param);
    }
    @ResponseBody
    @RequestMapping("modalVatSCnt.do")
    public AccountDTO modalVatSCnt(HttpSession session, @ModelAttribute AccountDTO dto){
    	Integer compNo = SessionInfoGet.getCompNo(session);
    	dto.setCompNo(compNo);
    	AccountDTO count = accountService.modalVatSCnt(dto);
    	
    	return count;
    }
    @RequestMapping("update_card_data.do")
    public ResponseEntity<Object> update_card_data(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        
        accountService.update_card_data(session, dto);

        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("Search_treqCardList.do")
    public ResponseEntity<Object> Search_treqCardList(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        
        List <AccountDTO> Search_treqCardList = accountService.Search_treqCardList(session, dto);
        param.put("data", Search_treqCardList);
        
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("vatContUpdate.do")
    public ResponseEntity<Object> vatContUpdate(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int vatUp = accountService.vatContUpdate(dto);
        if(vatUp > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @ResponseBody
    @RequestMapping("reloadVatListB.do")
    public List<AccountDTO> reloadVatListB(@ModelAttribute AccountDTO dto){
    	List<AccountDTO> list = accountService.reloadVatListB(dto);
    	
    	return list;
    }
    
    @RequestMapping("count_maintenance.do")
    public ResponseEntity<Object> count_maintenance(HttpSession session, @ModelAttribute AccountDTO dto){
    	
        Map<String,Object> param = new HashMap<>();
        
        List <AccountDTO> count1 = accountService.count1(session);
        List <AccountDTO> count2 = accountService.count2(session);
        List <AccountDTO> count3 = accountService.count3(session);
        
        BigDecimal sum = new BigDecimal("0");
        for(int i=0; i < count2.size(); i++) {
        	if(i == 0) {
        		sum = count2.get(i).getTest();
        	}else {
        		sum.add(count2.get(i).getTest());
        	}
        }
        
        param.put("count1", count1);
        param.put("count2", count2);
        param.put("count3", count3);
        param.put("sum", sum);
        
        return ResponseEntity.ok(param);
    }
    
    @ResponseBody
    @RequestMapping("drCustCheck")
    public AccountDTO drCustCheck(HttpSession session, @ModelAttribute AccountDTO dto) {
    	AccountDTO count = accountService.drCustCheck(dto);
    	return count;
    }
    
    @RequestMapping("drCustInsert.do")
    public ResponseEntity<Object> drCustInsert(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int insert = accountService.drCustInsert(dto);
        if(insert > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("drCustUpdate.do")
    public ResponseEntity<Object> drCustUpdate(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int update = accountService.drCustUpdate(dto);
        if(update > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @ResponseBody
    @RequestMapping("crCustCheck")
    public AccountDTO crCustCheck(HttpSession session, @ModelAttribute AccountDTO dto) {
    	AccountDTO count = accountService.crCustCheck(dto);
    	return count;
    }
    
    @RequestMapping("crCustInsert.do")
    public ResponseEntity<Object> crCustInsert(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int insert = accountService.crCustInsert(dto);
        if(insert > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("crCustUpdate.do")
    public ResponseEntity<Object> crCustUpdate(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int update = accountService.crCustUpdate(dto);
        if(update > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @ResponseBody
    @RequestMapping("getCustList.do")
    public List<CustDTO> getCustList(HttpSession session){
    	List<CustDTO> list = custService.listCust(session);
    	return list;
    }
    
    @ResponseBody
    @RequestMapping("checkCardNum.do")
    public String checkCardNum(@ModelAttribute AccountDTO dto) {
    	String result = accountService.checkCardNum(dto);
		return result;
    }
}
