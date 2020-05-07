package com.yzx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.yzx.pojo.Supplyin;


/**
 * @author YZX
 * @date 2020年4月26日
 * @time 上午9:42:24
 */

public interface SupplyinMapper {
	
	@Select("select * from supplyin limit #{0},#{1}	")
	List<Supplyin> selSupplyin(int pageNumber, int pageSize);
	
	@Select("select * from supplyin where id=#{0}")
	Supplyin selById(int id);
	
	@Select("select count(*) from supplyin")
	int selSupplyinCount();
	
	@Insert("insert into supplyin values(default,#{productname},#{quantity},#{price},#{shopid},#{supname},#{date},#{remark})")
	int addSupplyin(Supplyin supplyin);
	
	@Delete("delete from supplyin where id=#{0}")
	int delSupplyin(int id);
	
	int updSupplyin(Supplyin supplyin);
}
