package kr.swcore.sderp.account;

import kr.swcore.sderp.account.dto.AccountDTO;
import kr.swcore.sderp.account.service.AccountService;
import kr.swcore.sderp.code.service.CodeService;

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
import javax.servlet.http.HttpSession;

import java.math.BigDecimal;
import java.time.LocalDate;
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
            if(vatIssueDateFrom != null) dto.setVatIssueDateFrom(vatIssueDateFrom);
            if(vatIssueDateTo != null) dto.setVatIssueDateTo(vatIssueDateTo);
            
            if(selectYear != null) {
            	dto.setSelectYear(selectYear);
            }else {
            	dto.setSelectYear(year);
            }
            
            mav.addObject("vatList", accountService.sumBvatSearch(session, dto));
        } else {
            AccountDTO dto = new AccountDTO();
            LocalDate now = LocalDate.now();
            int year = now.getYear();
            dto.setVatIssueDateFrom(year + "-01-01");
            dto.setVatIssueDateTo(year + "-12-31");
            dto.setSelectYear(year);
            mav.addObject("vatList", accountService.sumBvat(session, dto));
        }
        mav.setViewName("settle/sumBvatlist");
        return mav;
    }

    @RequestMapping("sumSvatlist.do")
    public ModelAndView sumSvatList(HttpSession session, ModelAndView mav,
                                    @RequestParam(value = "vatBuyerCustNo", required = false) Integer vatBuyerCustNo,
                                    @RequestParam(value = "vatIssueDateFrom", required = false) String vatIssueDateFrom,
                                    @RequestParam(value = "vatIssueDateTo", required = false) String vatIssueDateTo, 
                                    @RequestParam(value = "selectYear", required = false) Integer selectYear) {
        if(vatBuyerCustNo != null || vatIssueDateFrom != null || vatIssueDateTo != null){
            AccountDTO dto = new AccountDTO();
            LocalDate now = LocalDate.now();
            int year = now.getYear();
            if(vatBuyerCustNo != null) dto.setVatBuyerCustNo(vatBuyerCustNo);
            if(vatIssueDateFrom != null) dto.setVatIssueDateFrom(vatIssueDateFrom);
            if(vatIssueDateTo != null) dto.setVatIssueDateTo(vatIssueDateTo);
            
            if(selectYear != null) {
            	dto.setSelectYear(selectYear);
            }else {
            	dto.setSelectYear(year);
            }
            
            mav.addObject("vatList", accountService.sumSvatSearch(session, dto));
        } else {
            AccountDTO dto = new AccountDTO();
            LocalDate now = LocalDate.now();
            int year = now.getYear();
            dto.setVatIssueDateFrom(year + "-01-01");
            dto.setVatIssueDateTo(year + "-12-31");
            dto.setSelectYear(year);
            mav.addObject("vatList", accountService.sumSvat(session, dto));
        }
        mav.setViewName("settle/sumSvatlist");
        return mav;
    }
    
    @RequestMapping("vatlistB.do")
    public ModelAndView vatListB(HttpSession session, ModelAndView mav, 
            @RequestParam(value = "vatSellerCustNo", required = false) Integer vatSellerCustNo,
            @RequestParam(value = "vatIssueDateFrom", required = false) String vatIssueDateFrom,
            @RequestParam(value = "vatIssueDateTo", required = false) String vatIssueDateTo) {
    	if(vatSellerCustNo != null || vatIssueDateFrom != null || vatIssueDateTo != null){
			AccountDTO dto = new AccountDTO();
			if(vatSellerCustNo != null) dto.setVatSellerCustNo(vatSellerCustNo);
			if(vatIssueDateFrom != null) dto.setVatIssueDateFrom(vatIssueDateFrom);
			if(vatIssueDateTo != null) dto.setVatIssueDateTo(vatIssueDateTo);
			mav.addObject("vatList", accountService.listvatSearchB(session, dto));
		} else {
			AccountDTO dto = new AccountDTO();
            LocalDate now = LocalDate.now();
            int year = now.getYear();
            dto.setVatIssueDateFrom(year + "-01-01");
            dto.setVatIssueDateTo(year + "-12-31");
			mav.addObject("vatList", accountService.listvatB(session, dto));
		}
        mav.setViewName("settle/vatListB");
        return mav;
    }
    
    @RequestMapping("vatlistS.do")
    public ModelAndView vatListS(HttpSession session, ModelAndView mav, 
            @RequestParam(value = "vatBuyerCustNo", required = false) Integer vatBuyerCustNo,
            @RequestParam(value = "vatIssueDateFrom", required = false) String vatIssueDateFrom,
            @RequestParam(value = "vatIssueDateTo", required = false) String vatIssueDateTo) {
    	if(vatBuyerCustNo != null || vatIssueDateFrom != null || vatIssueDateTo != null){
			AccountDTO dto = new AccountDTO();
			if(vatBuyerCustNo != null) dto.setVatBuyerCustNo(vatBuyerCustNo);
			if(vatIssueDateFrom != null) dto.setVatIssueDateFrom(vatIssueDateFrom);
			if(vatIssueDateTo != null) dto.setVatIssueDateTo(vatIssueDateTo);
			mav.addObject("vatList", accountService.listvatSearchS(session, dto));
		} else {
			AccountDTO dto = new AccountDTO();
            LocalDate now = LocalDate.now();
            int year = now.getYear();
            dto.setVatIssueDateFrom(year + "-01-01");
            dto.setVatIssueDateTo(year + "-12-31");
			mav.addObject("vatList", accountService.listvatS(session, dto));
		}
        mav.setViewName("settle/vatListS");
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
    
    @RequestMapping("cardDetail.do")
    public ModelAndView cardDetail(HttpSession session, ModelAndView mav) {
        mav.addObject("cardList", accountService.listCard(session));
        mav.setViewName("settle/carddetail");
        return mav;
    }

    @RequestMapping("bacupdate.do")
    public ModelAndView bacUpload(HttpSession session, ModelAndView mav, @ModelAttribute AccountDTO dto) {
        mav.addObject("vatList", accountService.listvat(session, dto));
        mav.setViewName("settle/bacupload");
        return mav;
    }
    
    @RequestMapping("cardUpload.do")
    public ModelAndView cardUpload(HttpSession session, ModelAndView mav, @ModelAttribute AccountDTO dto) {
        mav.addObject("vatList", accountService.listvat(session, dto));
        mav.setViewName("settle/cardupload");
        return mav;
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
    @RequestMapping("bacSelectListCnt.do")
    public AccountDTO bacSelectListCnt(@ModelAttribute AccountDTO dto){
    	AccountDTO count = accountService.bacSelectListCnt(dto);
    	
    	return count;
    }
    
    @ResponseBody
    @RequestMapping("cardSelectList/{cardSerial}")
    public List<AccountDTO> cardSelectList(@PathVariable("cardSerial") String cardSerial){
    	List<AccountDTO> accList = accountService.cardSelectList(cardSerial);
    	
    	return accList;
    }
    
    @RequestMapping("vatupload.do")
    public ModelAndView vatUpload(HttpSession session, ModelAndView mav, @ModelAttribute AccountDTO dto) {
        mav.addObject("vatList", accountService.listvat(session, dto));
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
        //swc_bacledger의 linkDoc 값이 y가 아니고 ''값이 아닐때
        String datalinkDocno = dto.getLinkDocno();
        String number_linkDoc = accountService.number_linkDoc(dto);
        
        if(!number_linkDoc.equals("y")) {
        	if(!number_linkDoc.equals("")) {
        		dto.setLinkDocno(number_linkDoc);
        		accountService.change_originlinkDoc(dto);
        		//연결하는 금액과 통장 금액이 일치하는 경우 s5로 변경
        		//하지만 연결하는 금액운 있는데 통장 금액과 일치하지 않는다면 s3 (뷴할 입/출금이라 생각하면 된다.)
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
		
		if(compareResult > 0) {
			if(compareResult_in != 0){
				if(compareResult_in_secound > 0) {
					for(int i=0; i < totalprice.size(); i++) {
						dto.setLinkDocno(totalprice.get(i).getLinkDocno());
						accountService.update_s3(dto);
					}
				}
			}else if(compareResult_in == 0) {
				for(int i=0; i < totalprice.size(); i++) {
					dto.setLinkDocno(totalprice.get(i).getLinkDocno());
					accountService.update_s5(dto);
				}
			}
		}else if(compareResult < 0)
		  if(sum.equals(out_num)) {
			  //s5
			  for(int i=0; i < totalprice.size(); i++) {
				  dto.setLinkDocno(totalprice.get(i).getLinkDocno());
				  accountService.update_b5(dto);
			  }
		  }else if(compareResult_out != 0){
			  if(compareResult_out_secound > 0) {
				  //s3
				  for(int i=0; i < totalprice.size(); i++) {
					  dto.setLinkDocno(totalprice.get(i).getLinkDocno());
					  accountService.update_b3(dto);
				  }
			  }
		  }

        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("connect_link_check_cancel.do")
    public ResponseEntity<Object> connect_link_check_cancel(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        
        //swc_bacledger_detail에 갯수
        int listNumber = accountService.connnectlist_Num(dto);
        List<AccountDTO> select_vatStatus = accountService.select_vatStatus(dto);
        if(listNumber != 0) {
        	//swc_bacledger는 delete 되게 그리고 해당 serial를 가진 swc_vat은 1로 변경
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
        }
        //0일 경우는 두가지 경우가 존재 (기존에 swc_bacledger의 컬럼으로 들어가 있는 경우, 진짜 아무 연결이 없는경우)
        else if (listNumber == 0) {
        	int searchserial = accountService.searchserial(dto);
        	//swc_bacledger의 컬럼에 해당 serial이 없는경우 0을 반환, 그렇게 되면 기존에 연결된 문서도 없다는 소리
        	if(searchserial != 0) {
        		accountService.cancelconnect_linkDoc(dto);
        		accountService.cancelconnect_linkedcheck(dto);
        		//swv_bacledger의 해당 컬럼 '' 그리고 해당 serial를 가진 swc_vat은 1로 변경
        	}
        }
        int listNumber_secound_check = accountService.connnectlist_Num(dto);
        int searchserial_secound_check = accountService.searchserial(dto);
        if(listNumber_secound_check == 0 ) {
        	if(searchserial_secound_check == 0) {
        		accountService.cancel_connect_final(dto);
        	}
        }
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
    
    @RequestMapping("vatHtml/{vatId}/{contNo}")
    public ModelAndView vatHtml(HttpSession session, ModelAndView mav, AccountDTO dto) {
    	mav.setViewName("form/vatHtml");
		/*
		 * mav.addObject("detail",gwService.detailEst(dto));
		 * mav.addObject("list",gwService.listEstitems(dto)); mav.addObject("titleList",
		 * gwService.titleGroupBy(dto)); mav.addObject("comList",
		 * gwService.comList(session)); mav.addObject("infoItem",
		 * gwService.infoGetItem(dto));
		 */
    	return mav;
    }
}
