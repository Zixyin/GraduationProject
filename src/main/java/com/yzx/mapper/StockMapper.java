package com.yzx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.yzx.pojo.Stock;


/**
 * @author YZX
 * @date 2020年4月26日
 * @time 上午9:42:24
 */

public interface StockMapper {
	
	@Select("select * from stock where productid=#{productid}")
	List<Stock> selStock(Stock stock);
	
	@Select("select * from stock where id=#{0}")
	Stock selById(int id);
	
	List<Stock> selContentByFindShop(Stock stock);
	
	List<Stock> selContentByFindProduct(Stock stock);
	
	@Select("select count(*) from stock ")
	int selCount();
	
	int selCountByShop(Stock stock);
	
	int selCountByProduct(Stock stock);
	
	
	@Select("select * from stock order by shopid,quantity,id limit #{0},#{1} ")
	List<Stock> selContentByShop(int pageNumber,int pageSize);
	
	@Select("select * from stock  order by productid,quantity,id limit #{0},#{1} ")
	List<Stock> selContentByProduct(int pageNumber,int pageSize);

	
	@Insert("insert into stock values(default,#{shopid},#{productid},#{quantity},#{shopname},#{productname},#{remark})")
	int addStock(Stock stock);
	
	int delStock(int id);
	
	@Update("update stock set quantity=#{quantity} where id=#{id}")
	int updStock(Stock stock);
}
