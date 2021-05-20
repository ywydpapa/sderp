package kr.swcore.sderp.board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardDTO {
	
	private Integer boardNo;
	private String boardDept;
	private String boardCode;
	private String boardNum;
	private String boardOpen;
	private String boardAdmin;
	private String boardTitle;
	private String boardType;
	private String boardRead;
	private String boardWrite;
	private String boardReply;
	private String boardDesc;
	private String boardDownyn;
	private String boardMoveyn;
	private String regDatetime;
	private String modDatetime;
	private String attrib;
	private Integer compNo;

	public BoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
