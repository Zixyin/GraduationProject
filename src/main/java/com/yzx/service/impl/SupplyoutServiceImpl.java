package com.yzx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yzx.mapper.SupplyoutMapper;
import com.yzx.pojo.Supplyout;
import com.yzx.service.SupplyoutService;

/**
 * @author YZX
 * @date 2020年5月3日
 * @time 下午1:56:22
 */
@Service
public class SupplyoutServiceImpl implements SupplyoutService{
	@Autowired
	private SupplyoutMapper supplyoutMapper;

	public int addSupplyout(Supplyout supplyout) {
		return supplyoutMapper.addSupplyout(supplyout);
	}

	public int delSupplyout(int id) {
		return supplyoutMapper.delSupplyout(id);
	}

	public int updSupplyout(Supplyout supplyout) {
		return supplyoutMapper.updSupplyout(supplyout);
	}

	public Supplyout selById(int id) {
		return supplyoutMapper.selById(id);
	}

	public List<Supplyout> selSupplyout(int pageNumber, int pageSize) {
		return supplyoutMapper.selSupplyout((pageNumber-1)*pageSize, pageSize);
	}

	public int selSupplyoutCount() {
		return supplyoutMapper.selSupplyoutCount();
	}

	public List<Supplyout> selSupplyoutByFlag(int pageNumber, int pageSize, int flag) {
		return supplyoutMapper.selSupplyoutByFlag((pageNumber-1)*pageSize, pageSize, flag);
	}

	public int selSupplyoutCountByFlag(int flag) {
		return supplyoutMapper.selSupplyoutCountByFlag(flag);
	}	
	
}
