package com.yzx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.yzx.pojo.User;

/**
 * @author YZX
 * @date 2020年4月26日
 * @time 上午9:40:02
 */

public interface UserMapper {
	
	@Select("select * from user limit #{0},#{1}	")
	List<User> selUser(int pageNumber, int pageSize);
	
	@Select("select count(*) from user")
	int selUserCount();
	
	@Insert("insert into user values(default,#{userid},#{psw},#{username},#{category},#{tel},#{remark})")
	int addUser(User user);
	
	@Select("select * from user where id=#{0}")
	User selById(int id);
	
	@Delete("delete from user where id=#{0}")
	int delUser(int id);
	
	@Update("update user set userid=#{userid},username=#{username},psw=#{psw}, category=#{category}, tel=#{tel}, remark=#{remark} where id=#{id}")
	int updUser(User user);
	
	@Select("select * from user where userid=#{0} and psw=#{1}")
	User checkUser(String userid, String psw);
}
