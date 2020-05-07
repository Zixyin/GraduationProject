package com.yzx.service;

import java.util.List;

import com.yzx.pojo.Product;

/**
 * @author YZX
 * @date 2020年4月29日
 * @time 上午11:14:33
 */

public interface ProductService {
	
	Product selById(int id);
	
	List<Product> selProduct(Product product);
	
	List<Product> selProductPage(int pageNumber, int pageSize);
	
	int selCountProduct(Product product);
	
	int addProduct(Product product);
	
	int checkProductId(int productid);
	
	int delProduct(int id);
	
	int updProduct(Product product);
}
