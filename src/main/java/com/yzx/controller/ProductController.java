package com.yzx.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yzx.pojo.Product;

import com.yzx.service.ProductService;


/**
 * @author YZX
 * @date 2020年4月29日
 * @time 上午11:13:57
 */
@Controller
public class ProductController {
	@Autowired
	private ProductService productServiceImpl;

	@RequestMapping("find_pageCount")
	public String find_pageCount(String productname, String category, HttpSession session) {
		Product product = new Product();
		if(productname != null)
			product.setProductname(productname);
		if(category != null)
			product.setCategory(category);
		int count = productServiceImpl.selCountProduct(product);
		session.setAttribute("count", count);
		session.setAttribute("product", product);
		return "find_product";
	}
	
	@RequestMapping("find_pageContent")
	@ResponseBody()
	public List<Product> find_pageContent(int pageNumber, int pageSize, HttpSession session) {
		Product product = (Product)session.getAttribute("product");
		product.setPageNumber((pageNumber - 1) * pageSize);
		product.setPageSize(pageSize);
		List<Product> list = productServiceImpl.selProduct(product);
		return list;
	}
	
	@RequestMapping("pageCount")
	@ResponseBody()
	public int pageCount() {
		return productServiceImpl.selCountProduct(null);
	}
	
	@RequestMapping("pageContent")
	@ResponseBody()
	public List<Product> pageContent(int pageNumber, int pageSize) {
		List<Product> list = productServiceImpl.selProductPage(pageNumber, pageSize);
		return list;
	}
	
	@RequestMapping("detail_product")
	public String detail_product(int id, HttpServletRequest req) {
		Product product = productServiceImpl.selById(id);
		req.setAttribute("p", product);
		return "detail_product";
	}
	
	@RequestMapping("modify_product")
	@ResponseBody()
	public int modify_product(String productid,String productname,String price,String category,String unit,String remark){
		Product product = new Product();
		product.setProductid(Integer.parseInt(productid));
		product.setProductname(productname);
		product.setPrice(Double.parseDouble(price));
		product.setCategory(category);
		product.setUnit(unit);
		product.setRemark(remark);
		return productServiceImpl.updProduct(product);
		//return productServiceImpl.updProduct(product);		
	}
	

	
}

