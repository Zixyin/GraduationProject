package com.yzx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yzx.mapper.ProductMapper;
import com.yzx.pojo.Product;
import com.yzx.service.ProductService;

/**
 * @author YZX
 * @date 2020年4月29日
 * @time 上午11:16:50
 */
@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductMapper productMapper;
	
	public List<Product> selProduct(Product product) {
		
		return productMapper.selProduct(product);
	}

	public int addProduct(Product product) {

		return productMapper.addProduct(product);
	}

	public int delProduct(int id) {

		return productMapper.delProduct(id);
	}

	public int updProduct(Product product) {

		return productMapper.updProduct(product);
	}

	public List<Product> selProductPage(int pageNumber, int pageSize) {
		
		return productMapper.selProductPage((pageNumber - 1) * pageSize, pageSize);
	}

	public int selCountProduct(Product product) {
		return productMapper.selCountProduct(product);
	}

	public Product selById(int id) {
		return productMapper.selById(id);
	}

	public int checkProductId(int productid) {
		return productMapper.checkProductId(productid);
	}

}
