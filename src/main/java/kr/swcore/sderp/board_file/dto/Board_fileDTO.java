package kr.swcore.sderp.board_file.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Board_fileDTO {

	private int bf_pk;
	private String bf_Title;
	private String bf_Contents;
	private String file1;
	private String file2;
	private String bf_delflag;
	private int userNo;
	private String regDatetime;
	private String regSDate;	// 등록일 시작
	private String regEDate;
	private String userName;
}
