package kr.swcore.sderp.common.service;

import kr.swcore.sderp.common.dao.DeptToPlanTblDAO;
import kr.swcore.sderp.common.dto.DeptToPlanTblDTO;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;
import java.util.Map;

@Service
public class DeptToPlanTblServiceImpl implements DeptToPlanTblService {

    @Inject
    DeptToPlanTblDAO deptToPlanTblDAO;

    @Override
    public List<DeptToPlanTblDTO> listWithOrgId(int orgId) {
        DeptToPlanTblDTO dto = new DeptToPlanTblDTO();
        dto.setOrgId(orgId);
        return deptToPlanTblDAO.listWithOrgId(dto);
    }
}
