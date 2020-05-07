package com.yzx.service;

import java.util.List;

import com.yzx.pojo.Supplyout;

/**
 * @author YZX
 * @date 2020年5月2日
 * @time 上午9:37:59
 */

public interface SupplyoutService {

	List<Supplyout> selSupplyout(int pageNumber, int pageSize);
	
	List<Supplyout> selSupplyoutByFlag(int pageNumber, int pageSize, int flag);
	
	Supplyout selById(int id);

	int selSupplyoutCount();
	
	int selSupplyoutCountByFlag(int flag);
	
	int addSupplyout(Supplyout supplyout);
	
	int delSupplyout(int id);
	
	int updSupplyout(Supplyout supplyout);
}
