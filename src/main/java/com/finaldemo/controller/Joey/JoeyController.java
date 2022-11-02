package com.finaldemo.controller.Joey;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.finaldemo.dto.ImageDto;
import com.finaldemo.dto.ProductDto;
import com.finaldemo.model.Donate;
import com.finaldemo.model.Foundation;
import com.finaldemo.model.Orders;
import com.finaldemo.model.PostImg;
import com.finaldemo.model.Posts;
import com.finaldemo.model.Products;
import com.finaldemo.model.Users;
import com.finaldemo.model.UsersRepository;
import com.finaldemo.service.JoeyService;
import com.finaldemo.service.PhoebeService;
import com.finaldemo.service.TimmyService;

@Controller
public class JoeyController {

	@Autowired
	private JoeyService service;

	@Autowired
	private PhoebeService PhoebeService;

	@Autowired
	private TimmyService TimmyService;
	
	@Autowired
	private UsersRepository uDao;

	@InitBinder
	public void InitBinder(WebDataBinder binder) {
		// 前端传入的时间格式必须是"yyyy-MM-dd"效果!
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		CustomDateEditor dateEditor = new CustomDateEditor(df, true);
		binder.registerCustomEditor(Date.class, dateEditor);
	}

//	@GetMapping("/findById")
//	public String findAnUserById(@RequestParam(name = "id") Integer id, Model model) {
//
//		Users oneMember = service.findById(id);
//		Set<Donate> donation = oneMember.getDonate();
//
//		System.out.println("dotation:" + donation);
//		model.addAttribute("oneMember", oneMember);
//		model.addAttribute("dotation", donation);
//		model.addAttribute("userId", id);
//
//		return "joey/editMember";
//
//	}

	@GetMapping("/findById2")
	public String findAnUserById2(HttpSession session, Model model) {
		Users u1 = (Users) session.getAttribute("user");
		Integer userId = ((Users) session.getAttribute("user")).getUserId();
		List<Products> produtsToShow = service.findProudtsByUserId(u1.getFoundation().getFoundationId());
		List<Posts> postsToShow = PhoebeService.getPostsByUserId(userId);
		List<Orders> ordersToShow = service.findOrdersByUserId(u1.getFoundation().getFoundationId());
		
		//把重複抓到的訂單刪掉
		for (int i = 0; i < ordersToShow.size() - 1; i++) {
	        for (int j = ordersToShow.size() - 1; j > i; j--) {
	            if (ordersToShow.get(j).equals(ordersToShow.get(i))) {
	            	ordersToShow.remove(j);
	            }
	        }
	    }
			
		
		System.out.println("************ordersToShow:"+ordersToShow+"************");
		
		
		model.addAttribute("ordersToShow", ordersToShow);
		model.addAttribute("produtsToShow", produtsToShow);
		model.addAttribute("postsToShow", postsToShow);
		Users users = new Users();
		model.addAttribute("u", users);
		
	
		Users userBefore = (Users) session.getAttribute("user");
		Users userAfter = service.findById(userBefore.getUserId());
		session.setAttribute("user", userAfter);

		Set<Donate> donation = userAfter.getDonate();
		model.addAttribute("oneMember", userAfter);
		model.addAttribute("dotation", donation);

		return "joey/editMember";
	}

	// 新增商品
	@PostMapping("/addProductJoey")
	public String addProduct(@RequestParam String productName, @RequestParam Integer productPrice,
			@RequestParam String productContext, @RequestParam MultipartFile[] productImg,
			HttpSession session, Model m)
			throws IllegalStateException, IOException {
		

		Products products = new Products();
		Users user = (Users) session.getAttribute("user");
		Foundation fundation = PhoebeService.getUserById(user.getUserId()).getFoundation();
		System.out.println("fundation:"+fundation);
		
		products.setProductName(productName);
		products.setProductPrice(productPrice);
		products.setProductStatus(1);
		products.setBuyCount(0);
		products.setProductContext(productContext);
		products.setProductDate(new Date());
//		System.out.println("root---------------------------------------------------:" + System.getProperty("user.dir"));
		

		for (MultipartFile img : productImg) {
			// 存資料夾
			if (!(img.isEmpty())) {
				String fileName = img.getOriginalFilename();
				String productImgPath = System.getProperty("user.dir") + "/src/main/webapp/img/joeyimg/joeyproductimg/"
						+ fileName;
				img.transferTo(new File(productImgPath));
//				// 存Product資料表
				products.setProductImg("/img/joeyimg/joeyproductimg/" + fileName);
				products.setFoundation(fundation);
				
				service.addProduct(products);

			} else {
				break;
			}

		}
		return "redirect:/findById2";
	}


	@GetMapping("/findProductsById")
	public String findPrductsById(HttpSession session, Model model) {
		Integer userId = ((Users) session.getAttribute("user")).getUserId();
		List<Products> productsToShow = service.findProudtsByUserId(userId);
		model.addAttribute("productsToShow", productsToShow);
		Users users = new Users();
		model.addAttribute("u", users);

		return "redirect:/findById2";
	}

	// 修改商品（待完成）
	@PostMapping("/editProdutjoey")
	public String editProduct(@RequestParam Integer productId, @RequestParam String productName, @RequestParam Integer productPrice, @RequestParam String productContext, @RequestParam MultipartFile[] productImg) throws IllegalStateException, IOException{
		Products product = service.findProductById(productId);
		product.setProductName(productName);
		product.setProductPrice(productPrice);
		product.setProductContext(productContext);
		service.editProduct(product);
		
		// 存圖片
				for (MultipartFile img : productImg) {
					// 存資料夾
					if (!(img.isEmpty())) {
						String fileName = img.getOriginalFilename();
						String productImgPath = System.getProperty("user.dir") + "/src/main/webapp/img/joeyimg/joeyproductimg/"
								+ fileName;
						img.transferTo(new File(productImgPath));
						product.setProductImg(productImgPath);
						// 存PostImg資料表
			
						product.setProductImg("/img/joeyimg/joeyproductimg/" + fileName);
						service.editProduct(product);

						
					} else {
						break;
					}
				}
		
		return "redirect:/findById2";

	}

	@PostMapping("/editMember")
	public String editAnUser(@ModelAttribute Users user, Model model) {
		Users u1 = service.findById(user.getUserId());
		if (user.getSelfIntroduction() != null) 
			u1.setSelfIntroduction(user.getSelfIntroduction());
		if (user.getNickName() != null) 
			u1.setNickName(user.getNickName());
		if (user.getPhone() != null) 
			u1.setPhone(user.getPhone());
		if (user.getAddress() != null) 
			u1.setAddress(user.getAddress());
		if (user.getBirthday() != null) 
			u1.setBirthday(user.getBirthday());
		if (user.getCategory() != null) 
			u1.setCategory(user.getCategory());
		if (user.getEmail() != null) 
			u1.setEmail(user.getEmail());
		if (user.getGender() != null) 
			u1.setGender(user.getGender());
		if (user.getPassword() != null) 
			u1.setPassword(user.getPassword());
		if (user.getPhotoPath() != null) 
			u1.setPhotoPath(user.getPhotoPath());
		service.editUser(u1);

		return "redirect:/findById2";
	}

	@PostMapping("/fileuploadjoey")
	public String uploadNewPhoto(@RequestParam("userId") String userId, @RequestParam("file") MultipartFile file) {
		
		System.out.println("userId:"+userId+" "+"file:"+file);
		
		String photoPath = "/img/joeyimg/";
		String contentType = file.getContentType();
		String photoType = "." + contentType.substring(6);
		Users oneMember = service.findById(Integer.parseInt(userId));
		Foundation foundation = oneMember.getFoundation();
		oneMember.setUserId(Integer.parseInt(userId));
		oneMember.setPhotoPath(photoPath + userId + photoType);
		oneMember.setFoundation(foundation);
		System.out.println("before save :" + foundation.getFoundationId());
		service.editUser(oneMember);
		if (foundation != null) {
			System.out.println("after save :" + foundation.getFoundationId());
		}
		try {
			byte[] bytes = file.getBytes();
			FileUtils.writeByteArrayToFile(
					new File(System.getProperty("user.dir") + "\\src\\main\\webapp\\img\\joeyimg\\",
							userId + photoType),bytes);

			return "redirect:/findById2";
		} catch (IOException e) {
			e.printStackTrace();
			return "redirect:/findById2";
		}
	}

	// 新增post
	@PostMapping("/addPostJoey")
	public String addPostJoey(@RequestParam String postText, @RequestParam MultipartFile[] postImg,
			@RequestParam MultipartFile postVideo, @RequestParam Integer whoCanSeeIt, HttpSession session,
			HttpServletRequest request) throws IllegalStateException, IOException {
		Posts posts = new Posts();
		Users user = (Users) session.getAttribute("user");
		Users author = TimmyService.getUserById(user.getUserId());
		posts.setIsReport(0);
		posts.setPostLike(0);
		posts.setPostText(postText);
		posts.setPostTime(new Date());
		posts.setPostVideoSrc(postVideo.getOriginalFilename());
		posts.setWhoCanSeeIt(whoCanSeeIt);
		posts.setPostUser(author);

		Posts newPost = PhoebeService.addPost(posts);

		// 存圖片
		PostImg newPostImg = new PostImg();
		for (MultipartFile img : postImg) {
			// 存資料夾
			if (!(img.isEmpty())) {
				String fileName = img.getOriginalFilename();
				String postImgPath = System.getProperty("user.dir") + "/src/main/webapp/img/joeyimg/joeypostimg/"
						+ fileName;
//				String postImgPath = "C:/upload/" + fileName;
				img.transferTo(new File(postImgPath));
				// 存PostImg資料表
				newPostImg.setPost(newPost);
				newPostImg.setPostImgPath("/img/joeyimg/joeypostimg/" + fileName);
				PhoebeService.addPostImg(newPostImg);
			} else {
				break;
			}
		}

		// 影片存資料夾
		if (!(postVideo.isEmpty())) {
			String fileName = postVideo.getOriginalFilename();
			String videoPath = System.getProperty("user.dir") + "/src/main/webapp/video/" + fileName;
			postVideo.transferTo(new File(videoPath));
		}
		return "redirect:/findById2";
	}

	@PostMapping("/postuploadjoey")
	public String uploadPost(@RequestParam Integer postId, @RequestParam String postText,
			@RequestParam MultipartFile[] postImg, @RequestParam MultipartFile postVideo,
			@RequestParam Integer whoCanSeeIt, HttpSession session) throws IllegalStateException, IOException {
		Posts post = PhoebeService.getPostByPostId(postId);
		post.setPostText(postText);
		post.setPostTime(new Date());
		post.setPostVideoSrc(postVideo.getOriginalFilename());
		post.setWhoCanSeeIt(whoCanSeeIt);
		PhoebeService.editPost(post);
		PhoebeService.deleteExtraImgs(postId);
		
		// 存圖片
		PostImg newPostImg = new PostImg();
		for (MultipartFile img : postImg) {
			// 存資料夾
			if (!(img.isEmpty())) {
				String fileName = img.getOriginalFilename();
				String postImgPath = System.getProperty("user.dir") + "/src/main/webapp/img/joeyimg/joeypostimg/"
						+ fileName;
				img.transferTo(new File(postImgPath));
				newPostImg.setPostImgPath(postImgPath);
				// 存PostImg資料表
				newPostImg.setPost(post);
			
				newPostImg.setPostImgPath("/img/joeyimg/joeypostimg/" + fileName);
				PhoebeService.addPostImg(newPostImg);
		
			} else {
				break;
			}
		}

		return "redirect:/findById2";

	}
	
	@PostMapping("/joey/removeProductAjax")
	@ResponseBody
	public String RemoveProductAjax(@RequestBody ProductDto dto) {
		Products p1 = service.findProductById(Integer.parseInt(dto.getProductId()));
		p1.setProductStatus(0);
		//(dto.getProductName());
		service.editProduct(p1);
		return "success";
	}
	
	@GetMapping("/websocket")
	public String websocketTest(HttpSession session, Model model) {
		Users userBefore = (Users) session.getAttribute("user");
		Users userAfter = service.findById(userBefore.getUserId());
		session.setAttribute("user", userAfter);
		model.addAttribute("oneMember", userAfter);
		return "index";
	}

	@PostMapping("/deleteMember")
	public String deleteUser(@RequestParam Integer id) {
		service.deleteUser(id);

		return "/joey/editMember";
	}

	@GetMapping("/ajaxtest")
	public @ResponseBody String testAjax() {

		String ajaxText = "Ajax回傳內容";

		return ajaxText;

	}
	
	//Ajax找到所有使用者
	@GetMapping("/findUsers")
	public @ResponseBody List<Users> findUsers(){
		 List<Users> uList = uDao.findAll();
		 return uList;
	}
	
	@PostMapping("/joey/UpdateProductAjax")
	@ResponseBody
	public String UpdateProductAjax(@RequestBody ProductDto dto) {
		Products p1 = service.findProductById(Integer.parseInt(dto.getProductId()));
		p1.setProductName(dto.getProductName());
		p1.setProductPrice(Integer.parseInt(dto.getProductPrice()));
		p1.setProductContext(dto.getDescription());
		service.editProduct(p1);
		return "success";
	}
	
	@PostMapping("/joey/uploadProductImgAjax")
	@ResponseBody
	public String uploadProductImgAjax(@RequestBody ImageDto dto ) {
		String extension = dto.getImg64().replaceAll(dto.getImg64().substring(0, dto.getImg64().indexOf("base64,") + 7), "");
		byte[] content = Base64.decodeBase64(extension);
		Products p1 = service.findProductById(dto.getId());
		try {
			FileUtils.writeByteArrayToFile(
					new File(System.getProperty("user.dir") + "\\src\\main\\webapp\\" + p1.getProductImg()) ,content);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "success";
	}
	
	@PostMapping("/joey/addNewProductAjax")
	@ResponseBody
	public String addNewProductAjax(@RequestBody Map<String, Object> jsonData, HttpSession session) {
		Products products = new Products();
		Users user = (Users) session.getAttribute("user");
		Foundation fundation = PhoebeService.getUserById(user.getUserId()).getFoundation();
		products.setProductContext(jsonData.get("productContext").toString());
		products.setProductPrice(Integer.parseInt(jsonData.get("productPrice").toString()));
		products.setProductName(jsonData.get("productName").toString());
		products.setProductStatus(1);
		products.setProductDate(new Date());
		products.setBuyCount(0);
		products.setFoundation(fundation);
		String newImg64 = jsonData.get("img64").toString();
		String extension = newImg64.replaceAll(newImg64.substring(0, newImg64.indexOf("base64,") + 7), "");
		byte[] content = Base64.decodeBase64(extension);
		
		String imgType = jsonData.get("imgType").toString();
		System.out.println("type:" + imgType);
		System.out.println("name:" + jsonData.get("imgName").toString());
//		imgType = imgType.substring(imgType.indexOf("/") + 1, imgType.indexOf("image"));
		try {
			FileUtils.writeByteArrayToFile(
					new File(System.getProperty("user.dir") + "\\src\\main\\webapp\\img\\joeyimg\\joeyproductimg\\" + jsonData.get("imgName").toString()) ,content);
		} catch (IOException e) {
			e.printStackTrace();
		}
		products.setProductImg("/img/joeyimg/joeyproductimg/" + jsonData.get("imgName").toString());
		service.editProduct(products);
		System.out.println("imgType:"+imgType);
		System.out.println("products:"+products);
//		System.out.println(jsonData.get("productName").toString());
//		System.out.println(jsonData.get("productPrice").toString());
//		System.out.println(jsonData.get("productContext").toString());
//		System.out.println(jsonData.get("imgName").toString());
//		System.out.println(jsonData.get("imgType").toString());
		return "success";
	}
}
