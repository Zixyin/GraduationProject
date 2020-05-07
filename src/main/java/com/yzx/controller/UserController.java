package com.yzx.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yzx.pojo.User;
import com.yzx.service.ShopService;
import com.yzx.service.UserService;

/**
 * @author YZX
 * @date 2020年4月26日
 * @time 上午10:05:46
 */
@Controller
public class UserController {
	@Autowired
	private UserService userServiceImpl;
	@Autowired
	private ShopService shopServiceImpl;
	//管理员注册
	@RequestMapping("admin_reg")
	@ResponseBody()
	public int user_reg(int userid, String psw) {
		User user = new User();
		user.setPsw(psw);
		user.setUserid(userid);
		user.setTel("****");
		user.setCategory("0");
		user.setUsername("Boss");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String format = sdf.format(new Date()); 
		user.setRemark("创建于" + format);
		return userServiceImpl.addUser(user);
	}

	@RequestMapping("add_user_con")
	@ResponseBody()
	public int add_user_con(String userid,String psw,String username,String category,String tel,String remark){
		System.out.println("donne");
		User user = new User();
		user.setUserid(Integer.parseInt(userid));
		user.setPsw(psw);
		user.setUsername(username);
		user.setCategory(category);
		user.setTel(tel);
		user.setRemark(remark);
		return userServiceImpl.addUser(user);
	}
	
	@RequestMapping("detail_user")
	public String detail_user(int id, HttpServletRequest req) {
		User user = userServiceImpl.selById(id);
		req.setAttribute("userdetail", user);
		return "detail_user";
	}
	
	@RequestMapping("delete_user")
	public String delete_user(int id, HttpServletRequest req) {
		userServiceImpl.delUser(id);
		return "search_user";
	}
	
	@RequestMapping("modify_user")
	@ResponseBody()
	public int modify_user(int id,String userid,String username,String psw,String category,String tel,String remark){
		User user = new User();
		user.setId(id);
		user.setUserid(Integer.parseInt(userid));
		user.setPsw(psw);
		user.setUsername(username);
		user.setCategory(category);
		user.setTel(tel);
		user.setRemark(remark);
		System.out.println(userServiceImpl.updUser(user));
		return userServiceImpl.updUser(user);
	}
	
	@RequestMapping("userCount")
	@ResponseBody()
	public int userCount() {
		return userServiceImpl.selUserCount();
	}
	
	@RequestMapping("userContent")
	@ResponseBody()
	public List<User> userContent(int pageNumber, int pageSize) {
		List<User> list = userServiceImpl.selUser(pageNumber, pageSize);
		for(User u:list){
			int cat = Integer.parseInt(u.getCategory());
			switch(cat) {
			case 0:u.setCategory("管理员");break;
			case 1:u.setCategory("进货员");break;
			case 2:u.setCategory("仓库管理员");break;
			case 3:u.setCategory("销售员");break;
			}
		}
		return list;
	}
	
	//验证用户名密码
	@RequestMapping("user_check")
	@ResponseBody()
	public int user_check(String userid, String psw) {
		User user = userServiceImpl.checkUser(userid, psw);
		if(user != null) 
			return 1;
		else return 0;	
	}
	
	//登录
	@RequestMapping("login")
	public String login(String userid, String psw, HttpServletRequest req, HttpSession session) {
		User user = userServiceImpl.checkUser(userid, psw);
		List<String> namelist = shopServiceImpl.selShopName();
		if(user != null) {
			session.setAttribute("user", user);		
			if(!namelist.isEmpty()) {
				if(session.getAttribute("namelist") !=  null)
					session.removeAttribute("namelist");
				session.setAttribute("namelist", namelist);
			}
			return "main";	
		} else return "redirect:/login.jsp";
	}
	
	//退出登录
	@RequestMapping("loginout")
	public String out(HttpSession session) {
		if(session.getAttribute("user") != null) {
			session.removeAttribute("namelist");
			session.removeAttribute("user");
		}
		return "redirect:/login.jsp";
	}

	//修改密码
	@RequestMapping("psw_modify")
	@ResponseBody()
	public int pwd_mod(String psw, HttpSession session) {
		User user = (User) session.getAttribute("user");
		user.setPsw(psw);
		return userServiceImpl.updUser(user);	
	}

}
