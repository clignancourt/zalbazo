package kr.zalbazo.controller.hospital;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.hospital.HospitalQna;
import kr.zalbazo.service.hospital.HospitalQnaService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/qna/")
@RestController
@Log4j
@AllArgsConstructor
public class QnaController {
	
	private HospitalQnaService qnaService;
	
//	@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
//	public ResponseEntity<String> create(@RequestBody Content content, @RequestBody HospitalQna hospitalQna){
//		int insertContent = qnaService.registerContent(content);
//		int insertQna = qnaService.registerQna(hospitalQna);
//		
//		return insertContent == 1 && insertQna == 1 
//			? new ResponseEntity<>("success", HttpStatus.OK)
//			: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
//	}
	
	@PostMapping(value = "/newCon", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> createCon(@RequestBody Content content){
		int insertContent = qnaService.registerContent(content);
		
		return insertContent == 1 
			? new ResponseEntity<>("success", HttpStatus.OK)
			: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
	}
	
	@PostMapping(value = "/newQna", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> createQna(@RequestBody HospitalQna hospitalQna){
		int insertQna = qnaService.registerQna(hospitalQna);
		
		return insertQna == 1 
			? new ResponseEntity<>("success", HttpStatus.OK)
			: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
	}
	
	@DeleteMapping(value="/delQna/{contentId}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> removeQna(@PathVariable("contentId") Long contentId) {
		return qnaService.removeQna(contentId) == 1
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value="/delCon/{contentId}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> removeCon(@PathVariable("contentId") Long contentId) {
		return qnaService.removeContent(contentId) == 1
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping(value = "/list/{hospitalId}", produces = { 
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<Content>> getList(@PathVariable("hospitalId") Long hospitalId) {
		return new ResponseEntity<>(qnaService.getList(hospitalId), HttpStatus.OK);
	}
	
}
