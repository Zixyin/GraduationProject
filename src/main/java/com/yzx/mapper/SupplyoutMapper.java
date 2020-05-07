package com.yzx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.yzx.pojo.Supplyout;


/**
 * @author YZX
 * @date 2020年4月26日
 * @time 上午9:42:24
 */

public interface SupplyoutMapper {
	
	@Select("select * from supplyout order by date desc,id limit #{0},#{1}")
	List<Supplyout> selSupplyout(int pageNumber, int pageSize);

	@Select("select * from supplyout where flag=#{2} order by date desc,id limit #{0},#{1}")
	List<Supplyout> selSupplyoutByFlag(int pageNumber, int pageSize, int flag);
	
	@Select("select * from supplyout where id=#{0}")
	Supplyout selById(int id);
	
	@Select("select count(*) from supplyout")
	int selSupplyoutCount();

	@Select("select count(*) from supplyout where flag=#{0}")
	int selSupplyoutCountByFlag(int flag);
	
	
	@Insert("insert into supplyout values(default,#{productid},#{productname},#{quantity},#{date},0,#{remark})")
	int addSupplyout(Supplyout supplyout);

	@Delete("delete from supplyout where id=#{0}")
	int delSupplyout(int id);

	@Update("update supplyout set flag=#{flag} where id=#{id}")
	int updSupplyout(Supplyout supplyout);
	
}
