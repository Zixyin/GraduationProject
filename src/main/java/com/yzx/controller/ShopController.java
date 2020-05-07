package com.yzx.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yzx.pojo.Shop;
import com.yzx.service.ShopService;

/**
 * @author YZX
 * @date 2020年5月3日
 * @time 上午9:50:16
 */
@Controller
public class ShopController {
	@Autowired
	private ShopService shopServiceImpl;
	
	@RequestMapping("add_shop_con")
	@ResponseBody()
	public int add_supplier_con(int shopid,String shopname,String address,String daddress,String remark){
		Shop shop = new Shop();
		shop.setShopid(shopid);
		shop.setShopname(shopname);
		shop.setAdress(daddress);
		shop.setDadress(daddress);
		shop.setRemark(remark);
		return shopServiceImpl.addShop(shop);
	}
	
	@RequestMapping("detail_shop")
	public String shop(int id, HttpServletRequest req) {
		Shop shop = shopServiceImpl.selById(id);
		req.setAttribute("shop", shop);
		return "detail_shop";
	}
	
	@RequestMapping("delete_shop")
	public String delete_product(int id, HttpServletRequest req) {
		shopServiceImpl.delShop(id);
		return "search_shop";
	}
	
	@RequestMapping("modify_shop")
	@ResponseBody()
	public int modify_shop(int id,String shopname,String address,String daddress,String remark){
		Shop shop = new Shop();
		shop.setId(id);
		shop.setShopname(shopname);
		shop.setAdress(address);
		shop.setDadress(daddress);
		shop.setRemark(remark);
		return shopServiceImpl.updShop(shop);
	}
	
	@RequestMapping("shopCount")
	@ResponseBody()
	public int shopCount() {
		return shopServiceImpl.selShopCount();
	}
	
	@RequestMapping("shopContent")
	@ResponseBody()
	public List<Shop> shopContent(int pageNumber, int pageSize) {
		List<Shop> list = shopServiceImpl.selShop(pageNumber, pageSize);
		return list;
	}
}
