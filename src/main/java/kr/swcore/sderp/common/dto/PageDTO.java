package kr.swcore.sderp.common.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
public class PageDTO {
    private Integer limit;
    private Integer offset;
    private String sSearch;
    private String orderColumn;
    private String orderOption;

    // 확장
    private String countQuery;
    private Integer cnt;
}
