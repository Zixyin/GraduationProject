package com.yzx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.yzx.pojo.Supplier;


/**
 * @author YZX
 * @date 2020年4月26日
 * @time 上午9:42:24
 */

public interface SupplierMapper {
	
	@Select("select * from supplier limit #{0},#{1}	")
	List<Supplier> selSupplier(int pageNumber, int pageSize);
	
	@Select("select count(*) from supplier")
	int selSupplierCount();
	
	@Select("select * from supplier where id=#{0}")
	Supplier selById(int id);
	
	@Insert("insert into supplier values(default,#{supname},#{address},#{detailaddress},#{contactperson},#{tel},#{remark})")
	int addSupplier(Supplier supplier);

	@Delete("delete from supplier where id=#{0}")
	int delSupplier(int id);
	
	@Update("update supplier set supname=#{supname},address=#{address},detailaddress=#{detailaddress},contactperson=#{contactperson},tel=#{tel},remark=#{remark} where id=#{id} ")
	int updSupplier(Supplier supplier);
}
