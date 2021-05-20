package kr.swcore.sderp.common.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@ToString
public class DeptToPlanTblDTO {
    private Integer id;
    private Integer orgId;
    private String tableName;

    // 확장
    private Integer compNo;
}
