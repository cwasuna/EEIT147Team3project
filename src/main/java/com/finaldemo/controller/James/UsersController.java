package com.finaldemo.controller.James;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.finaldemo.model.Users;
import com.finaldemo.service.JamesService;


//@Controller
@SessionAttributes(names = { "memlogin", "mnglogin", "members" })
public class UsersController {

	private static final Model m = null;

	@Autowired
	private JamesService memService;

	@Autowired
	private HttpSession session;

	private String savePathid;

	@Autowired
	private ServletContext context;

	private Integer category;

	// 註冊頁面
	@GetMapping("/memberregister.controller")
	public String processMemberRegister() {
		return "memberRegister";
	}

	// 個人資訊頁面
	@GetMapping("/memberInformation.controller")
	public String processMemberInformationRegister() {
		return "memberInformation";
	}

	// 會員儀表板
	@GetMapping("/memberService.controller")
	public String memberService(Model m) {
		return "memberService";
	}

	// 修改個人資訊頁面
	@GetMapping("/memberInformationUpdate.controller")
	public String processMemberInformationUpdater() {
		return "memberInformationUpdate";
	}

	// 修改密碼頁面
	@GetMapping("/memberPasswordUpdate.controller")
	public String processMemberPasswordUpdate() {
		return "memberPasswordUpdate";
	}

	@GetMapping("/findallmembers.controller")
	public String processFindAll(Model m) {

		List<Users> members = memService.findAll();
		m.addAttribute("allMembers", members);

		return "backController_member";
	}

	@GetMapping("/insertmember.controller")
	public String insertMember(Model m) throws IOException {

		InputStream is1 = context.getResourceAsStream("/WEB-INF/Buy_again/images/memberimages/defaultpicture.jpg");
		byte[] pic = IOUtils.toByteArray(is1);

		m.addAttribute("pic", pic);

		return "memberInsert";
	}

	// 註冊會員
	@PostMapping("/insertmember2.controller")
	public String insertMember2(@RequestParam("photoPath") MultipartFile picture, @RequestParam("userId") Integer userId,
			@RequestParam("password") String password, @RequestParam("name") String name,
			@RequestParam("category") String birthday, @RequestParam("phone") String phone,
			@RequestParam("address") String address, @RequestParam("email") String email, Model m)
			throws IllegalStateException, IOException {

		String fileName = picture.getOriginalFilename();
		if (fileName.trim().length() != 0) {
			String fileString = fileName.substring(fileName.lastIndexOf(".")); // 只取副檔名

			ClassPathResource resource = new ClassPathResource(
					"/src/main/webapp/WEB-INF/Buy_again/images/memberimages/");
			String saveDirPath = resource.getPath();

			File saveDirPathFile = new File(saveDirPath); // new File(saveDirPath); 新建資料夾(路徑)
			saveDirPathFile.mkdirs(); // mkdirs()不管原本有沒有資料夾都幫我建立

			String savePath = saveDirPath + UUID.randomUUID() + fileString; // 設定儲存路徑
			File savePathFile = new File(savePath); // 儲存檔案
			savePathid = savePathFile.getName();
			picture.transferTo(savePathFile); // 檔案上傳
		} else {
			savePathid = "defaultpicture.jpg";
		}

		Users mbBean = new Users();
		mbBean.setUserId(userId);
		mbBean.setPassword(password);
		mbBean.setNickName(name);
		mbBean.setCategory(category);
		mbBean.setPhone(phone);
		mbBean.setAddress(address);
		mbBean.setEmail(email);
		mbBean.setPhotoPath(savePathid);

		Users account = memService.insertMember(mbBean);

		if (account != null) {
			m.addAttribute("memlogin", account);
		}

		if (session.getAttribute("mnglogin") != null) {
			return "redirect:/findallmembers.controller";
		}

		return "homepage";
	}

	@GetMapping("/deletemember.controller")
	public String deleteMember(@RequestParam("memberId") Integer id, Model m) {
		memService.deleteById(id);
		System.out.println("delete success!!");
		return "forward:/findallmembers.controller";
	}

	@GetMapping("/updatemember.controller")
	public String updateMember(@RequestParam("memberId") Integer id, Model m) throws IOException {

		Users mem = memService.findByMemberId(id);
		m.addAttribute("member", mem);

		InputStream is1 = context.getResourceAsStream("/WEB-INF/Buy_again/images/memberimages/" + mem.getPhotoPath());
		byte[] pic = IOUtils.toByteArray(is1);

		m.addAttribute("pic", pic);

		return "memberUpdate";
	}

	@PostMapping("/updatemember2.controller")
	public String updateMember2(@RequestParam("photoPath") MultipartFile photoPath,
			@RequestParam("memberId") Integer memberId, @RequestParam("userId") Integer userId,
			@RequestParam("password") String password, @RequestParam("name") String name,
			@RequestParam("category") Integer category, @RequestParam("phone") String phone,
			@RequestParam("address") String address, @RequestParam("email") String email
			) throws IllegalStateException, IOException {

		Users mbBean = memService.findByMemberId(memberId);
		mbBean.setUserId(userId);
		mbBean.setPassword(password);
		mbBean.setNickName(name);
		mbBean.setCategory(category);
		mbBean.setPhone(phone);
		mbBean.setAddress(address);
		mbBean.setEmail(email);

		String fileName = photoPath.getOriginalFilename();

		if (fileName.trim().length() != 0) { // 代表有重新上傳
			String fileString = fileName.substring(fileName.lastIndexOf(".")); // 只取副檔名

			ClassPathResource resource = new ClassPathResource(
					"/src/main/webapp/WEB-INF/Buy_again/images/memberimages/");
			String saveDirPath = resource.getPath();

			File saveDirPathFile = new File(saveDirPath); // new File(saveDirPath); 新建資料夾(路徑)
			saveDirPathFile.mkdirs(); // mkdirs()不管原本有沒有資料夾都幫我建立

			String savePath = saveDirPath + UUID.randomUUID() + fileString; // 設定儲存路徑
			File savePathFile = new File(savePath); // 儲存檔案
			savePathid = savePathFile.getName();
			photoPath.transferTo(savePathFile); // 檔案上傳

			mbBean.setPhotoPath(savePathid);
		}
	
	

		Users account = memService.updateMember(mbBean);

		if (session.getAttribute("mngLogin") != null) {
			return "redirect:/findallmembers.controller"; // redirect: 提出新的請求給 server
		}

		if (account != null) {
			m.addAttribute("memlogin", account);
		}

		return "homepage";
	}

	// 個人資訊單筆查詢
	@GetMapping("/memberInformation")
	public String processmemberInformationfindById(@RequestParam("memberId") Integer id, Model m) {
		Users memberBean = memService.findByMemberId(id);
		m.addAttribute("members", memberBean);
		return "memberInformation";
	}

}

