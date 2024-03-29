package kr.zalbazo.model.pic;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@ToString
@AllArgsConstructor
@Getter
@Setter
public class PicLib {
	
	private Long picLibId;
	private String uploadPath;
	private String fileName;

}
