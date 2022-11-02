package com.finaldemo.controller.timmy;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finaldemo.dto.ImageDto;
import com.finaldemo.model.PostImg;
import com.finaldemo.model.Posts;
import com.finaldemo.service.PhoebeService;
import com.finaldemo.service.TimmyService;

@Controller
public class PostSettingController {
	
	@Autowired
	private TimmyService service;
	
	@Autowired
	private PhoebeService pService;
	
	@PostMapping("/timmy/uploadPostImgAjax")
	@ResponseBody
	public String uploadPostImgAjax(@RequestBody List<ImageDto> dtoList) throws InterruptedException, ParseException {
		for (ImageDto dto:dtoList) {
			// 處理圖片資源 bytes type
			
			String deleteTime = dto.getType().substring(dto.getType().length() - 1, dto.getType().length());
			String extension = dto.getImg64().replaceAll("data:" + dto.getType().trim().replaceAll(deleteTime, "") + ";base64,", "");
			String type = dto.getType().replaceAll("image/", "").replaceAll(deleteTime, "");
			Integer id = dto.getId();
			byte[] content = Base64.decodeBase64(extension);
			// 取得 post 
			Posts p1 = service.getPostById(id);
			// 從 post 拿到 圖片集合
			Set<PostImg> postImg = p1.getPostImg();
			// new PostImg
			PostImg postImg2 = new PostImg();
			// 指定路徑
//			Thread.sleep(1000);
			SimpleDateFormat sdFormat = new SimpleDateFormat("yyyyMMddHHmmss");
			Date current = new Date();
			String now = sdFormat.format(current);
			String newPath = "/img/postimg/"+ id.toString() + "-" + now + (postImg.size() + 1) + "." + type;
			// 從圖片集合裡找，若有相同路徑者，該筆資料取代新 new 的 PostImg
		
			try {
				// 存進硬碟 檔名由 PostID + 該圖片生成時間 + 單筆資料的第幾張圖片 + type 命名
				FileUtils.writeByteArrayToFile(
						new File(System.getProperty("user.dir") + "\\src\\main\\webapp\\img\\postimg\\" + id.toString() + "-" + now + (postImg.size() + 1) + "." + type),
						content);
				// 設定存進資料庫的屬性並存進資料庫
				postImg2.setPostImgPath(newPath);
				postImg2.setPost(p1);
				postImg2.setNumberForAdd(postImg.size() + 1 + Integer.parseInt(deleteTime));
				postImg.add(postImg2);
				service.insertNewPost(p1);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		Integer postImgId = service.getAllPostImg().get(service.getAllPostImg().size()-1).getPostImgId() + 1;
		return postImgId.toString();
	}
	
	@GetMapping("/timmy/deletePostImgAjax")
	@ResponseBody
	public String deletePostImgAjax(@RequestParam(name = "imgId") String imgId, @RequestParam(name = "postId") String postId, @RequestParam(name="onceAdd") String onceAdd) {
//		判斷是不是臨時加的圖片想刪掉
		if (imgId.contains("add")) {
			Integer postIdNum = Integer.parseInt(postId);
			imgId = imgId.replaceAll("add", "");
			Integer newImgId = Integer.parseInt(imgId);
			List<PostImg> postImgList = service.getPostImgListByPostIdOrderById(postIdNum);
			PostImg p1 = new PostImg();
			for (PostImg postImg:postImgList) {
				if (postImg.getNumberForAdd() ==  newImgId) {
					p1 = postImg;
				}
			}
			Integer toDelete = p1.getPostImgId();
			service.deletePostImgById(toDelete);
		} else {
			service.deletePostImgById(Integer.parseInt(imgId));
		}
		System.out.println("---------------------------------------");
		return imgId;
	}
	
	@GetMapping("/timmy/updatePostTextAjax")
	@ResponseBody
	public String updatePostTextAjax(@RequestParam("text") String text, @RequestParam("id") Integer id) {
		Posts p1 = service.getPostById(id);
		p1.setPostText(text);
		service.insertNewPost(p1);
		return "success";
	}
	
	@PostMapping("/movePostToTrash.controllerT")
	public String movePostToTrash(@RequestParam Integer postId) {
		pService.movePostToTrash(0, postId);
		return "redirect:/timmy/accountsetting.controller";
	}
}	
