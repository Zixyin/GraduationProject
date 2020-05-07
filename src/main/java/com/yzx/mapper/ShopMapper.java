package com.yzx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.yzx.pojo.Shop;


/**
 * @author YZX
 * @date 2020年4月26日
 * @time 上午9:42:24
 */

public interface ShopMapper {
	

	@Select("select * from shop limit #{0},#{1}	")
	List<Shop> selShop(int pageNumber, int pageSize);
	
	@Select("select count(*) from shop")
	int selShopCount();
	
	@Select("select shopname from shop")
	List<String> selShopName();
	
	@Select("select * from shop where id=#{0}")
	Shop selById(int id);
	
	@Select("select shopid from shop where shopname=#{0}")
	int selIdByName(String shopname);
	
	@Insert("insert into shop values(default,#{shopid},#{shopname},#{address},#{daddress},#{remark})")
	int addShop(Shop shop);
	
	@Delete("delete from shop where id=#{0}")
	int delShop(int id);
	
	@Update("update shop set shopname=#{shopname},address=#{address},daddress=#{daddress},remark=#{remark} where id=#{id} ")
	int updShop(Shop shop);
}
