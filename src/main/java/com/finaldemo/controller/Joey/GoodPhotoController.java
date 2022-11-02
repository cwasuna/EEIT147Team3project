package com.finaldemo.controller.Joey;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class GoodPhotoController {

	@PostMapping("/fileupload2")
	public String uploadNewPhoto2(@RequestParam("photoName") String photoName,
			@RequestParam("file") MultipartFile file) {

		try {
			file.transferTo(new File("C:\\SpringBoot\\workspace\\springbootdemo_test0803\\src\\main\\webapp\\img\\" + photoName + ".jpg"));
			return "goodphoto/uploadPageTest";
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "goodphoto/uploadPageTest";
	};
	
	@GetMapping("/listPhoto2")
	public String listPhoto2(Model model) {
	

		return "goodphoto/listPhotoTest";
	}

}
