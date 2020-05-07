package com.yzx.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yzx.pojo.Stock;
import com.yzx.pojo.Supplyout;
import com.yzx.service.StockService;
import com.yzx.service.SupplyoutService;

/**
 * @author YZX
 * @date 2020年5月3日
 * @time 上午10:53:56
 */
@Controller
public class StockController {
	@Autowired
	private StockService stockServiceImpl;
	@Autowired
	private SupplyoutService supplyoutServiceImpl;
	
	@RequestMapping("stockCount")
	@ResponseBody()
	public int stockCount() {
		return stockServiceImpl.selCount();
	}
	
	@RequestMapping("stockContentByShop")
	@ResponseBody()
	public List<Stock> stockContentByShop(int pageNumber, int pageSize) {
		List<Stock> list =stockServiceImpl.selContentByShop(pageNumber, pageSize);
		return list;
	}
	
	@RequestMapping("stockContentByProduct")
	@ResponseBody()
	public List<Stock> stockContentByProduct(int pageNumber, int pageSize) {
		List<Stock> list =stockServiceImpl.selContentByProduct(pageNumber, pageSize);
		return list;
	}
	
	@RequestMapping("find_countByShop")
	public String find_countByShop(String shopid, String shopname, HttpSession session) {
		Stock stock= new Stock();
		if(shopid != null && shopid != "")
			stock.setShopid(Integer.parseInt(shopid));
		if(shopname != null)
			stock.setShopname(shopname);
		int count = stockServiceImpl.selCountByShop(stock);
		session.setAttribute("count", count);
		session.setAttribute("stock", stock);
		return "find_pageByShop";
	}
	
	@RequestMapping("find_countByProduct")
	public String find_countByProduct(String productid, String productname, HttpSession session) {
		Stock stock= new Stock();
		if(productid != null && productid != "")
			stock.setProductid(Integer.parseInt(productid));
		if(productname != null)
			stock.setProductname(productname);
		int count = stockServiceImpl.selCountByProduct(stock);
		session.setAttribute("count", count);
		session.setAttribute("stock", stock);
		return "find_pageByProduct";
	}
	
	@RequestMapping("find_contentByShop")
	@ResponseBody()
	public List<Stock> find_contentByShop(int pageNumber, int pageSize, HttpSession session) {
		Stock stock = (Stock)session.getAttribute("stock");
		stock.setPageNumber((pageNumber - 1) * pageSize);
		stock.setPageSize(pageSize);
		List<Stock> list = stockServiceImpl.selContentByFindShop(stock);
		return list;
	}
	
	@RequestMapping("find_contentByProduct")
	@ResponseBody()
	public List<Stock> find_contentByProductt(int pageNumber, int pageSize, HttpSession session) {
		Stock stock = (Stock)session.getAttribute("stock");
		stock.setPageNumber((pageNumber - 1) * pageSize);
		stock.setPageSize(pageSize);
		List<Stock> list = stockServiceImpl.selContentByFindProduct(stock);
		return list;
	}
	
	@RequestMapping("supplyoutCountByFlag")
	@ResponseBody()
	public int supplyoutCount() {
		return supplyoutServiceImpl.selSupplyoutCountByFlag(0);
	}
	
	@RequestMapping("supplyoutContentByFlag")
	@ResponseBody()
	public List<Supplyout> supplyoutContent(int pageNumber, int pageSize) {
		List<Supplyout> list = supplyoutServiceImpl.selSupplyoutByFlag(pageNumber, pageSize,0);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		for(Supplyout l : list) 
			l.setStr_date(sdf.format(l.getDate()));
		return list;
	}
	@RequestMapping("updStockForSale")
	public String updStockForSale(int id,HttpServletRequest req) {
		Supplyout supplyout = supplyoutServiceImpl.selById(id);
		Stock stock = new Stock();
		int productid = supplyout.getProductid();
		String productname = supplyout.getProductname();
		stock.setProductid(productid);
		stock.setProductname(productname);
		List<Stock> list = stockServiceImpl.selStock(stock);
		for(int i = 0;i < list.size();++ i) 
			if(list.get(i).getQuantity() < supplyout.getQuantity())
				list.remove(i);
		req.setAttribute("list", list);
		req.getSession().setAttribute("supid", id);
		return "updStockForSale";
	}
	@RequestMapping("updStockConfirm")
	public String updStockConfirm(int id,HttpServletRequest req) {
		int supid = (Integer) req.getSession().getAttribute("supid");
		Supplyout supplyout = supplyoutServiceImpl.selById(supid);
		Stock stock = stockServiceImpl.selById(supid);
		stock.setQuantity(stock.getQuantity() - supplyout.getQuantity());
		stockServiceImpl.updStock(stock);
		supplyout.setFlag(1);
		supplyoutServiceImpl.updSupplyout(supplyout);
		return "search_supplyoutbyflag";
	}
	
	
}
