package com.uwl.web.post;

import java.io.File;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/post/*")
public class PostRestController {

	public PostRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="/rest/addSummerNoteFile", method=RequestMethod.POST)
	public String addSummerNoteFile(MultipartFile file) throws Exception{
		System.out.println("addSummerNoteFile.POST");
		String path = "C:\\Users\\User\\git\\UWL\\uwl\\WebContent\\resources\\images\\";
		String name = "";
		file.transferTo(new File(path, file.getOriginalFilename()));
		name = file.getOriginalFilename();
		return name;
	}
}
