package com.finaldemo.controller.Alan;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.hibernate.dialect.identity.Ingres10IdentityColumnSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.finaldemo.dto.IdDto;
import com.finaldemo.model.Foundation;
import com.finaldemo.model.Posts;
import com.finaldemo.model.Products;
import com.finaldemo.model.ProductsRepository;
import com.finaldemo.model.ShoppingCar;
import com.finaldemo.model.Users;
import com.finaldemo.service.AlanService;

@Controller
public class ShoppingCarController {

	@Autowired
	private AlanService alanService;

	@Autowired
	private HttpSession session; // 宣告session 出現兩次以上不用重複宣告
	
	

	/***
	 * 取得目前購物車商品資料
	 */
	@RequestMapping(path = "/Alan/shoppingCar")
	public String getShoppingCarProduct(Model model) { // 取得值的話使用Model
		Integer usersId = ((Users) session.getAttribute("user")).getUserId(); // 取得Users session 用來維持登入會員資料 有Users
																				// Bean裡面的資料
		System.out.println(usersId); // 列印usersId確認是否取得資料
		List<ShoppingCar> ShoppingCarList = alanService.findAllShoppingCarProducts(Integer.toString(usersId)); // 啟動Service
		model.addAttribute("ShoppingCarProducts", ShoppingCarList); // 建立ShoppingCarProducts Model 來裝ShoppingCarList
																	// 裡面的資料方便前端JSP取得
		System.out.println("ShoppingCarProducts:" + ShoppingCarList); // 列印出ShoppingCarList 裡面的值 來確認是否為購物車所需
		
		
		
		return "Alan/shoppingCar";
	}

	/***
	 * 新增購物車商品資料
	 * 
	 * @param checkbox
	 */
	@PostMapping(path = "/Alan/insertShoppingCar")
	 public String insertShoppingCarProduct(Model model, @RequestParam("checkbox") List<String> productIdList,
	            @RequestParam("quantity") List<Integer> quantityList) {  
		 System.out.println("----------" + productIdList);
		 System.out.println("++++++++++" + quantityList);
		 
		Integer usersId = ((Users) session.getAttribute("user")).getUserId(); 
		System.out.println("================" + usersId);
		
		for (int i = 0; i < productIdList.size(); i++) {      
			Users usBean = alanService.usersfindById(usersId);   //session UsersId 去抓Bean
			ShoppingCar shBean = new ShoppingCar();              //new 一個容器 有ShoppingCar Bean的欄位
			Products pdBean = alanService.productsfindById(Integer.parseInt(productIdList.get(i)));  //前端回傳productIdList
			System.out.println("4444444444:"+shBean);
			System.out.println("55555555555:"+usBean);
			System.out.println("6666666666:"+pdBean);
			shBean.setProducts(pdBean);
			shBean.setShopUser(usBean);
			shBean.setQuantity(quantityList.get(i));
			System.out.println("77777777777:"+shBean);
			System.out.println("888888888888:"+usBean);
			System.out.println("999999999999:"+pdBean);
			alanService.insertShoppingCar(shBean, usBean, pdBean);
		}
		System.out.println("productId::::" + productIdList);
		System.out.println("count::::" + quantityList);
		return this.getShoppingCarProduct(model);
	}

	/***
	 * 成立訂單商品頁面(尚未下單)
	 */
	@RequestMapping(path = "/Alan/order")
	public String getOrderShoppingCarProduct(Model model) {
		Integer usersId = ((Users) session.getAttribute("user")).getUserId(); // 取得session 資料
		List<ShoppingCar> shoppingCarList = alanService.findAllShoppingCarProducts(Integer.toString(usersId));
		model.addAttribute("ShoppingCarProducts", shoppingCarList);
		System.out.println("ShoppingCarProducts:" + shoppingCarList);
		return "Alan/foundOrder";
	}

	/***
	 * 刪除購物車商品
	 */
	@GetMapping(path = "/Alan/deleteShoppingCarProduct")
	public String deleteShoppingCarProducts(Model model,
			@RequestParam("deleteShoppingCarProducts") Integer shoppingCarId) {
		alanService.deleteShoppingCarProducts(shoppingCarId);
		return this.getShoppingCarProduct(model);
	}

	/***
	 * 修改購物車商品+1
	 */
	@GetMapping(path = "/Alan/newShoppingCarProduct")
	public String editShoppingCarProducts(Model model, @RequestParam("add") String add,
			@RequestParam("updateShoppingCarProducts") String updateShoppingCarProducts) {
		if (add.equals("1")) {
			ShoppingCar shoppingCar = alanService.findShoppingCarProducts(Integer.parseInt(updateShoppingCarProducts));
			int quantity = shoppingCar.getQuantity() - 1;
			alanService.updatequantityShoppingCarProducts(quantity, Integer.parseInt(updateShoppingCarProducts));
		} else {
			ShoppingCar ShoppingCar = alanService.findShoppingCarProducts(Integer.parseInt(updateShoppingCarProducts));
			int quantity = ShoppingCar.getQuantity() + 1;
			alanService.updatequantityShoppingCarProducts(quantity, Integer.parseInt(updateShoppingCarProducts));
		}

		return "redirect:/Alan/shoppingCar";
	}
	/***
	 * 將購物車畫面新增進結帳頁面
	 */
	@RequestMapping(path = "/Alan/ShoppingCarcheckbox")
	public String insertOeders(Model model, @RequestParam("oldchange") List<String> strId) {
		Integer usersId = ((Users) session.getAttribute("user")).getUserId();
	 	 List<ShoppingCar> shoppingCarList  = alanService.findShoppingCarProductsToOrders(strId);
	 	 
		System.out.print("購物車新增進結帳畫面="+ shoppingCarList);
		
		model.addAttribute("shoppingCarList", shoppingCarList);
		
		
        return "Alan/foundOrder";
    }
	
	

}
