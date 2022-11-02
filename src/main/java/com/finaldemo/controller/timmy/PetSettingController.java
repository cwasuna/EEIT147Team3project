package com.finaldemo.controller.timmy;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.finaldemo.dto.PetDto;
import com.finaldemo.model.Pets;
import com.finaldemo.model.Users;
import com.finaldemo.service.TimmyService;

@Controller
public class PetSettingController {

	@Autowired
	private TimmyService service;

	@InitBinder
	public void InitBinder(WebDataBinder binder) {
		// 前端传入的时间格式必须是"yyyy-MM-dd"效果!
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		CustomDateEditor dateEditor = new CustomDateEditor(df, true);
		binder.registerCustomEditor(Date.class, dateEditor);
	}

	@PostMapping("/pet/insertNewPet.controller")
	public String insertNewPet(@RequestParam(name = "petName", defaultValue = "none") String petName,
			@RequestParam(name = "petBirthday", defaultValue = "2010-01-01") Date petBirthday,
			@RequestParam(name = "petDescription", defaultValue = "say something") String petDescription,
			@RequestParam(name = "file") MultipartFile file,
			@RequestParam(name = "petType", defaultValue = "0") Integer petType,
			@RequestParam(name = "petGender", defaultValue = "0") Integer petGender, HttpSession session, Model model) {
		Users user = (Users) session.getAttribute("user");
		String type = file.getContentType().replaceAll("image/", "");
		Set<Pets> petSet = user.getPets();
		Pets pet = new Pets(petName, petType, petBirthday, petGender, petDescription, user);
		if (!type.contains("application")) {
			pet.setPetPhotoPath("/img/petimg/" + user.getUserId() + "-" + (petSet.size() + 1) + "." + type);
		} else {
			pet.setPetPhotoPath("/img/petimg/" + user.getUserId() + "-" + (petSet.size() + 1));
		}
		petSet.add(pet);
		service.insertNewUser(user);
		try {
			if (!type.contains("application")) {
				FileUtils.writeByteArrayToFile(new File(System.getProperty("user.dir")
						+ "\\src\\main\\webapp\\img\\petimg\\" + user.getUserId() + "-" + petSet.size() + "." + type),
						file.getBytes());
				System.out.println("insert file ok");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "redirect:/timmy/accountsetting.controller";
	}

	@PostMapping("/timmy/updatePetDataAjax")
	@ResponseBody
	public String updatePetDataAjax(@RequestBody PetDto dto) {
		Pets pet = service.getPetByPetId(Integer.parseInt(dto.getId()));
		pet.setPetName(dto.getName());
		pet.setPetGender(Integer.parseInt(dto.getGender()));
		pet.setPetDescription(dto.getIntroduction());
		try {
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Calendar calendar = Calendar.getInstance();
			Date date = dateFormat.parse(dto.getBirthday());
			calendar.setTime(date);
			pet.setPetBirthday(calendar.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String file = dto.getFile();
		if (file.contains("base64")) {
			String extension = file.replaceAll(file.substring(file.indexOf("data"), file.indexOf("base64,") + 7), "");
			byte[] content = Base64.decodeBase64(extension);
			String type = file.substring(file.indexOf("image/") + 6, file.indexOf("base64,") - 1);
			try {
				if (!pet.getPetPhotoPath().contains(".")) {
					FileUtils.writeByteArrayToFile(new File(System.getProperty("user.dir") + "\\src\\main\\webapp"
							+ pet.getPetPhotoPath() + "." + type), content);
					pet.setPetPhotoPath(pet.getPetPhotoPath() + "." + type);
				} else {
					FileUtils.writeByteArrayToFile(new File(System.getProperty("user.dir") + "\\src\\main\\webapp"
							+ pet.getPetPhotoPath()), content);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		service.savePet(pet);
		System.out.println(dto.getBirthday());
		return dto.getBirthday();
	}
	
	@GetMapping("/timmy/deletePetById/{id}")
	@ResponseBody
	public String deletePetById(@PathVariable Integer id) {
		service.deletePetById(id);
		return "success";
	}
}
