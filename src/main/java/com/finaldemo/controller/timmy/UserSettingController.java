package com.finaldemo.controller.timmy;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finaldemo.dto.CommentDto;
import com.finaldemo.dto.ImageDto;
import com.finaldemo.dto.UserDataDto;
import com.finaldemo.model.Pets;
import com.finaldemo.model.Posts;
import com.finaldemo.model.Users;
import com.finaldemo.service.TimmyService;

@Controller
public class UserSettingController {
	
	@Autowired
	private TimmyService service;
	
	@Autowired
	private JavaMailSender mailSender;
	 
	@PostMapping("/timmy/uploadImgAjax")
	@ResponseBody
	public String uploadImagAjax(@RequestBody ImageDto dto) throws FileNotFoundException {
		String extension = dto.getImg64().replaceAll("data:" + dto.getType().trim() + ";base64,", "");
		String type = dto.getType().replaceAll("image/", "");
		Integer id = dto.getId();
		byte[] content = Base64.decodeBase64(extension);
		try {
			FileUtils.writeByteArrayToFile(
					new File(System.getProperty("user.dir") + "\\src\\main\\webapp\\img\\userimg\\",
							id.toString() + "." + type),
					content);
			System.out.println("upload file to folder success");
			Users user = service.getUserById(id);
			user.setPhotoPath("/img/userimg/" + id.toString() + "." + type);
			service.insertNewUser(user);
			System.out.println("upload filepath to db success");
			return "success";
		} catch (IOException e) {
			e.printStackTrace();
			return "failed";
		}
	}

	@PostMapping("/timmy/updateDataAjax")
	@ResponseBody
	public String updateDataAjax(@RequestBody UserDataDto data, HttpSession session) {
		Users user = (Users) session.getAttribute("user");
		System.out.println("nickname_before: " + user.getNickName());
		System.out.println("userid: " + user.getUserId());
		System.out.println("value: " + data.getValue());
		System.out.println("header: " + data.getHeader());
		Users u1 = service.getUserById(user.getUserId());
		if (data.getHeader().equals("nickName")) {
			u1.setNickName(data.getValue());
		}
		if (data.getHeader().equals("phone"))
			u1.setPhone(data.getValue());
		if (data.getHeader().equals("address"))
			u1.setAddress(data.getValue());
		if (data.getHeader().equals("selfIntroduction"))
			u1.setSelfIntroduction(data.getValue());
		if (data.getHeader().equals("birthday")) {
			try {
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				Calendar calendar = Calendar.getInstance();
				Date date = dateFormat.parse(data.getValue());
				calendar.setTime(date);
				u1.setBirthday(calendar.getTime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		service.insertNewUser(u1);
		return data.getValue();
	}

	@PostMapping("/timmy/updateEmailAjax")
	@ResponseBody
	public String updateEmailAjax(@RequestBody UserDataDto dto, HttpSession session) {
		String email = dto.getValue() + "@" + dto.getHeader();
		System.out.println("email: " + email);
		if (service.checkEmail(email)) {
			Users user = (Users) session.getAttribute("user");
			Users u1 = service.getUserById(user.getUserId());
			u1.setEmail(email);
			service.insertNewUser(u1);
			return email;
		} else {
			return "email has been used";
		}
	}

	@PostMapping("/timmy/checkPasswordAjax")
	@ResponseBody
	public String checkPassword(@RequestBody UserDataDto dto, HttpSession session) {
		String password = dto.getValue();
		Users user = (Users) session.getAttribute("user");
		Users u1 = service.getUserById(user.getUserId());
		if (password.equals(u1.getPassword()))
			return "correctpassword";
		else
			return "wrongpassword";
	}

	@PostMapping("/timmy/updatePasswordAjax")
	@ResponseBody
	public String updatePassword(@RequestBody UserDataDto dto, HttpSession session) {
		if (dto.getValue() != null) {
			String password = dto.getValue();
			Users user = (Users) session.getAttribute("user");
			Users u1 = service.getUserById(user.getUserId());
			u1.setPassword(password);
			service.insertNewUser(u1);
			return "success";
		}
		return "failed";
	}

	@GetMapping("/timmy/updateAddressAjax/")
	@ResponseBody
	public String updateAddress(@RequestParam(name = "address") String address, HttpSession session) {
		if (address != null) {
			Users user = (Users) session.getAttribute("user");
			Users u1 = service.getUserById(user.getUserId());
			u1.setAddress(address);
			service.insertNewUser(u1);
			return address;
		}
		return "failed";
	}
	
	@GetMapping("/timmy/readUserById/{id}")
	public String readUserById(@PathVariable Integer id, Model m, HttpSession session) {
		Users guest = service.getUserById(id);
		m.addAttribute("guest", guest);
		List<Posts> postsToShow = new ArrayList<>();
		if ((Users) session.getAttribute("user") != null) {
			postsToShow.addAll(service.getPostsByUserId(guest.getUserId())); // 取得登入者發的貼文
		}
		postsToShow.sort(Comparator.comparing(Posts::getPostId).reversed());
		m.addAttribute("postsToShow", postsToShow);
		Users user = (Users) session.getAttribute("user");
		Users u1 = service.getUserById(user.getUserId());
		session.setAttribute("user", u1);
		
		m.addAttribute("newPet", new Pets());
		return "timmy/NormalMember";
	}
	
//	@GetMapping("/timmy/checkEmailAjax")
//	@ResponseBody
//	public String checkEmailAjax(@RequestParam String email) {
//		if (service.getUsersByEmail(email).size() == 0) {
//			return "emailNotFound";
//		}
//		MimeMessage mimeMessage = mailSender.createMimeMessage();
//        try {
//			MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
//			helper.setFrom("eeit14719@outlook.com");
//	        helper.setTo(email);
//	        helper.setSubject("主旨：認證email");
//	        helper.setText("<html><body>"
//	        		+ "<a href='http://localhost:8080/demo/timmy/buildEmailCertificationRP.controller?email="+ email +"'>click here to verify the email</a>"
//	        		+ "</body></html>", true);
//	        mailSender.send(mimeMessage);
//		} catch (MessagingException e) {
//			e.printStackTrace();
//		}
//		return email;
//	}
	
	@GetMapping("/timmy/checkEmailAjax")
    @ResponseBody
    public String checkEmailAjax(@RequestParam ("email") String email,Model model) throws FileNotFoundException{
        if (service.getUsersByEmail(email).size() == 0) {
            return "emailNotFound";
        }
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        try {
            StringBuilder verificationCode = new StringBuilder();
            Random randomNuRandom = new Random();
            for (int i = 0 ; i < 6 ; i++) {
                verificationCode.append(randomNuRandom.nextInt(10));
            }
            System.out.println(verificationCode);
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom("eeit14719@outlook.com");
            message.setTo(email);
            message.setSubject("PEEiT147.com - Welcome");
            message.setText("Welcome, this number is your verification-code: " + verificationCode);
            mailSender.send(message);
            model.addAttribute("message", message);
            model.addAttribute("verificationCode", verificationCode);
            return verificationCode.toString();
        }
         catch (Exception e) {
            e.printStackTrace();
        }
        return email;
    }
	
	@GetMapping("/timmy/buildEmailCertificationRP.controller")
	public String buildEmailCertificationRP(@RequestParam String email, Model m) {
		m.addAttribute("verifyingEmail", email);
		return "timmy/login";
	}
	
	@PostMapping("/timmy/updateForgottenPwdAjax")
	@ResponseBody
	public String updateForgottenPwdAjax(@RequestBody CommentDto dto) {
		System.out.println("email: " + dto.getPostId());
		List<Users> users = service.getUsersByEmail(dto.getPostId()); // postid 其實是email, commenttext 是密碼
		Users u1 = users.get(0);
		u1.setPassword(dto.getCommentText());
		service.insertNewUser(u1);
		return "update pwd success";
	}
	
	@PostMapping("/timmy/oneBtnToUpdateUserAjax")
	@ResponseBody
	public String oneBtnToUpdateUserAjax(@RequestBody Map<String, Object> jsonData, HttpSession session) {
		Users user = (Users) session.getAttribute("user");
		Users u1 = service.getUserById(user.getUserId());
		u1.setNickName(jsonData.get("name").toString());
		try {
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Calendar calendar = Calendar.getInstance();
			Date date = dateFormat.parse(jsonData.get("birthday").toString());
			calendar.setTime(date);
			u1.setBirthday(calendar.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		u1.setPhone(jsonData.get("phone").toString());
		u1.setSelfIntroduction(jsonData.get("introduction").toString());
		service.insertNewUser(u1);
		return "success";
	}
}
