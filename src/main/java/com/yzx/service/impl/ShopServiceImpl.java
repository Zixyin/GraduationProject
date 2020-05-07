package com.yzx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yzx.mapper.ShopMapper;
import com.yzx.pojo.Shop;
import com.yzx.service.ShopService;

/**
 * @author YZX
 * @date 2020年5月1日
 * @time 上午11:37:20
 */
@Service
public class ShopServiceImpl implements ShopService{
	@Autowired
	private ShopMapper shopMapper;

	public List<String> selShopName() {
		return shopMapper.selShopName();
	}

	public int selIdByName(String shopname) {
		return shopMapper.selIdByName(shopname);
	}

	public int addShop(Shop shop) {
		return shopMapper.addShop(shop);
	}

	public int delShop(int id) {
		return shopMapper.delShop(id);
	}

	public int updShop(Shop shop) {
		return shopMapper.updShop(shop);
	}

	public List<Shop> selShop(int pageNumber, int pageSize) {
		return shopMapper.selShop((pageNumber-1)*pageSize, pageSize);
	}

	public int selShopCount() {
		return shopMapper.selShopCount();
	}

	public Shop selById(int id) {
		return shopMapper.selById(id);
	}
	
	
}
