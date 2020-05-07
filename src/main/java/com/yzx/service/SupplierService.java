package com.yzx.service;

import java.util.List;

import com.yzx.pojo.Supplier;

/**
 * @author YZX
 * @date 2020年5月3日
 * @time 上午7:22:21
 */

public interface SupplierService {

	List<Supplier> selSupplier(int pageNumber, int pageSize);

	int selSupplierCount();
	
	Supplier selById(int id);
	
	int addSupplier(Supplier supplier);
	
	int delSupplier(int id);
	
	int updSupplier(Supplier supplier);
}
