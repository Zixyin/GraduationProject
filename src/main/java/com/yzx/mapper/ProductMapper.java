package com.yzx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.yzx.pojo.Product;


/**
 * @author YZX
 * @date 2020年4月26日
 * @time 上午9:42:24
 */

public interface ProductMapper {
	
	@Select("select * from product where id = #{0}")
	Product selById(int id);
	
	List<Product> selProduct(Product product);
	
	List<Product> selProductPage(int pageNumber, int pageSize);
	
	int selCountProduct(Product product);
	
	@Insert("insert into product values(default,#{productid},#{productname},#{price},#{category},#{unit},#{remark})")
	int addProduct(Product product);
	
	@Select("select count(*) from product where productid=#{0}")
	int checkProductId(int productid);
	
	int delProduct(int id);
	
	@Update("update product set productname=#{productname},price=#{price},category=#{category},unit=#{unit},remark=#{remark} where productid=#{productid} ")
	int updProduct(Product product);
}
