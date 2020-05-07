package com.yzx.service;

import java.util.List;

import com.yzx.pojo.Stock;

/**
 * @author YZX
 * @date 2020年5月2日
 * @time 上午8:41:11
 */
public interface StockService {
	
	List<Stock> selStock(Stock stock);
	
	List<Stock> selContentByFindShop(Stock stock);
	
	List<Stock> selContentByFindProduct(Stock stock);
	
	int selCount();
	
	Stock selById(int id);
	
	int selCountByShop(Stock stock);

	int selCountByProduct(Stock stock);
	
	List<Stock> selContentByShop(int pageNumber,int pageSize);

	List<Stock> selContentByProduct(int pageNumber,int pageSize);
	
	int addStock(Stock stock);
	
	int delStock(int id);
	
	int updStock(Stock stock);
}
