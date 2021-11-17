package kr.swcore.sderp.notice.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class NoticeDTO {
	private int notiNo;
	private String notiTitle;
	private String notiContents;
	private String notiDate;

}
