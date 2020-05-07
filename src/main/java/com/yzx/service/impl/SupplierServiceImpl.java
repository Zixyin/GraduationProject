package com.yzx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yzx.mapper.SupplierMapper;
import com.yzx.pojo.Supplier;
import com.yzx.service.SupplierService;

/**
 * @author YZX
 * @date 2020年5月3日
 * @time 上午7:22:41
 */
@Service
public class SupplierServiceImpl implements SupplierService{

	@Autowired
	private SupplierMapper supplierMapper;
	
	public int addSupplier(Supplier supplier) {
		
		return supplierMapper.addSupplier(supplier);
	}

	public int delSupplier(int id) {
		
		return supplierMapper.delSupplier(id);
	}

	public int updSupplier(Supplier supplier) {
		
		return supplierMapper.updSupplier(supplier);
	}

	public Supplier selById(int id) {
		return supplierMapper.selById(id);
	}

	public List<Supplier> selSupplier(int pageNumber, int pageSize) {
		return supplierMapper.selSupplier((pageNumber-1)*pageSize, pageSize);
	}

	public int selSupplierCount() {
		return supplierMapper.selSupplierCount();
	}

}
