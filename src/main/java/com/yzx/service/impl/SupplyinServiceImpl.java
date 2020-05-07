package com.yzx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yzx.mapper.SupplyinMapper;
import com.yzx.pojo.Supplyin;
import com.yzx.service.SupplyinService;

/**
 * @author YZX
 * @date 2020年5月2日
 * @time 上午9:38:25
 */
@Service
public class SupplyinServiceImpl implements SupplyinService{

	@Autowired
	private SupplyinMapper supplyinMapper;
	
	public int selSupplyinCount() {
		return supplyinMapper.selSupplyinCount();
	}
	
	public List<Supplyin> selSupplyin(int pageNumber, int pageSize) {
		return supplyinMapper.selSupplyin((pageNumber - 1) * pageSize, pageSize);
	}

	public int addSupplyin(Supplyin supplyin) {
		return supplyinMapper.addSupplyin(supplyin);
	}

	public int delSupplyin(int id) {
		return supplyinMapper.delSupplyin(id);
	}

	public int updSupplyin(Supplyin supplyin) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Supplyin selById(int id) {
		return supplyinMapper.selById(id);
	}


}
