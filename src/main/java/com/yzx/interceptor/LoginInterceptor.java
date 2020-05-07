package com.yzx.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author YZX
 * @date 2020年4月23日
 * @time 下午8:02:02
 */

public class LoginInterceptor implements HandlerInterceptor{

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if(request.getRequestURI().endsWith("login")||request.getRequestURI().endsWith("reg") ||request.getRequestURI().endsWith("user_check")) {
			return true;
		} else {
			Object obj = request.getSession().getAttribute("user");
			if(obj != null)
				return true;
		}
		response.sendRedirect("/login.jsp");
		return false;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
