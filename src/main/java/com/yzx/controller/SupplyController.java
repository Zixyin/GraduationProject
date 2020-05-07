package com.yzx.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yzx.pojo.Product;
import com.yzx.pojo.Stock;
import com.yzx.pojo.Supplyin;
import com.yzx.pojo.Supplyout;
import com.yzx.pojo.User;
import com.yzx.service.ProductService;
import com.yzx.service.ShopService;
import com.yzx.service.StockService;
import com.yzx.service.SupplyinService;
import com.yzx.service.SupplyoutService;

/**
 * @author YZX
 * @date 2020年5月2日
 * @time 上午9:26:34
 */
@Controller
public class SupplyController {
	@Autowired
	private ProductService productServiceImpl;
	@Autowired
	private StockService stockServiceImpl;
	@Autowired
	private ShopService shopServiceImpl;
	@Autowired
	private SupplyinService supplyinServiceImpl;
	@Autowired
	private SupplyoutService supplyoutServiceImpl;
	
	@RequestMapping("detail_supplyin")
	public String detail_supplyin(int id, HttpServletRequest req) {
		Supplyin supplyin = supplyinServiceImpl.selById(id);
		req.setAttribute("si", supplyin);
		return "detail_supplyin";
	}
	
	@RequestMapping("delete_supplyin")
	public String delete_supplyin(int id, HttpServletRequest req) {
		supplyinServiceImpl.delSupplyin(id);
		return "search_supplyin";
	}
	
	@RequestMapping("supplyinCount")
	@ResponseBody()
	public int supplyinCount() {
		return supplyinServiceImpl.selSupplyinCount();
	}
	@RequestMapping("supplyinContent")
	@ResponseBody()
	public List<Supplyin> supplyinContent(int pageNumber, int pageSize) {
		List<Supplyin> list = supplyinServiceImpl.selSupplyin(pageNumber, pageSize);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		for(Supplyin l : list) 
			l.setStr_date(sdf.format(l.getDate()));
		return list;
	}
	
	@RequestMapping("add_supplyin_con")
	@ResponseBody()
	public int add_supplyin_con(String productid,String productname,String price,String category,String unit,String count, String supplier, String shopname, String remark, HttpSession session) {
	    if(session.getAttribute("user") == null)
	    	return 0;
		int shopid = shopServiceImpl.selIdByName(shopname);
		Product product = new Product();
		product.setProductid(Integer.parseInt(productid));
		product.setProductname(productname);
		product.setPrice(Double.parseDouble(price));
		product.setCategory(category);
		product.setUnit(unit);
		product.setRemark(remark);
		if(productServiceImpl.checkProductId(Integer.parseInt(productid)) == 0)
			productServiceImpl.addProduct(product);		
		
		Stock stock = new Stock();
		stock.setProductid(Integer.parseInt(productid));
		stock.setProductname(productname);
		stock.setQuantity(Integer.parseInt(count));
		stock.setShopname(shopname);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        User user =(User)session.getAttribute("user");
        stock.setRemark(user.getUsername()+":"+df.format(new Date()));// new Date()为获取当前系统时间
        stock.setShopid(shopid);
        if(stockServiceImpl.addStock(stock) < 1)
        	return 0;

        Supplyin supplyin = new Supplyin();
        supplyin.setProductname(productname);
        supplyin.setQuantity(Integer.parseInt(count));
        supplyin.setShopid(shopid);
        supplyin.setPrice(Double.parseDouble(price));
        supplyin.setSupname(supplier);
        supplyin.setDate(new Timestamp(System.currentTimeMillis()));
        if(supplyinServiceImpl.addSupplyin(supplyin) < 1)
        	return 0;
		return 1;
	}
	
	@RequestMapping("add_supplyout_con")
	@ResponseBody()
	public int add_product(String productid,String productname,String count, String remark, HttpSession session) {
		Supplyout supplyout = new Supplyout();
		supplyout.setProductid(Integer.parseInt(productid));
		supplyout.setProductname(productname);
		supplyout.setQuantity(Integer.parseInt(count));
		supplyout.setRemark(remark);
		Timestamp d = new Timestamp(System.currentTimeMillis()); 
		supplyout.setDate(d);
		return supplyoutServiceImpl.addSupplyout(supplyout);
	}
	
	@RequestMapping("detail_supplyout")
	public String detail_supplyout(int id, HttpServletRequest req) {
		Supplyout supplyout = supplyoutServiceImpl.selById(id);
		req.setAttribute("so", supplyout);
		return "detail_supplier";
	}
	
	@RequestMapping("delete_supplyout")
	public String delete_supplyout(int id, HttpServletRequest req) {
		supplyoutServiceImpl.delSupplyout(id);
		return "search_supplyout";
	}
	
	@RequestMapping("supplyoutCount")
	@ResponseBody()
	public int supplyoutCount() {
		return supplyoutServiceImpl.selSupplyoutCount();
	}
	
	@RequestMapping("supplyoutContent")
	@ResponseBody()
	public List<Supplyout> supplyoutContent(int pageNumber, int pageSize) {
		List<Supplyout> list = supplyoutServiceImpl.selSupplyout(pageNumber, pageSize);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		for(Supplyout l : list) 
			l.setStr_date(sdf.format(l.getDate()));
		return list;
	}
}
