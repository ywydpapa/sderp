package kr.swcore.sderp.product.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Getter
@Setter
@ToString
public class ProductDTO {

	private Integer productNo;				// 상품 번호(AUTO)
	private Integer productCategoryNo;		// 상품 카테고리 번호
	private String productCategoryName;	// 상품 카테고리 이름
	private Integer compNo;					// 회사 구분 코드(외래키)
	private Integer userNo;					// 유저 번호
	private String productName;			// 상풍 명
	private Integer productDefaultPrice;	// 상품 기본 가격
	private String productDesc;			// 상품 설명
	private Integer productImageNo;			// 상품 이미지 번호
	private Integer custNo;					// 공급사(외래키)
	private String attrib;				// 속성
	
	// 확장
	private MultipartFile productImage;	// 상품 새 이미지
	private String custName;			// 공급사 명
	private List<ProductdataDTO> productdataDTOList;	// 하위 상품 리스트
	private Integer productDataLastNo;

	public ProductDTO() {
			// TODO Auto-generated constructor stub
	}
}
