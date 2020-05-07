package com.yzx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yzx.mapper.StockMapper;
import com.yzx.pojo.Stock;
import com.yzx.service.StockService;

/**
 * @author YZX
 * @date 2020年5月2日
 * @time 上午8:42:12
 */
@Service
public class StockServiceImpl implements StockService{
	@Autowired
	private StockMapper stockMapper;

	public List<Stock> selStock(Stock stock) {
		return stockMapper.selStock(stock);
	}

	public int addStock(Stock stock) {
		return stockMapper.addStock(stock);
	}

	public int delStock(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updStock(Stock stock) {
		return stockMapper.updStock(stock);
	}

	public int selCount() {
		return stockMapper.selCount();
	}

	public List<Stock> selContentByShop(int pageNumber, int pageSize) {
		return stockMapper.selContentByShop((pageNumber-1)*pageSize, pageSize);
	}

	public List<Stock> selContentByProduct(int pageNumber, int pageSize) {
		return stockMapper.selContentByProduct((pageNumber-1)*pageSize, pageSize);
	}
	
	public int selCountByShop(Stock stock) {
		return stockMapper.selCountByShop(stock);
	}

	public int selCountByProduct(Stock stock) {
		return stockMapper.selCountByProduct(stock);
	}

	public List<Stock> selContentByFindShop(Stock stock) {
		return stockMapper.selContentByFindShop(stock);
	}

	public List<Stock> selContentByFindProduct(Stock stock) {
		return stockMapper.selContentByFindProduct(stock);
	}

	public Stock selById(int id) {
		return stockMapper.selById(id);
	}


}
