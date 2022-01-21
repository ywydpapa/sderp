package kr.swcore.sderp.board_file.dto;


	import lombok.Getter;
	import lombok.Setter;
	import lombok.ToString;

	@Getter
	@Setter
	@ToString
	public class Board_fileDataDTO {

		private String fileId;
		private String fileName;
		private String fileDesc;
		private String uploadDate;
		private byte[] fileContent;
		private Integer bf_pk;
		private Integer userNo;

		public Board_fileDataDTO() {
			super();
			// TODO Auto-generated constructor stub
		}
	}