package com.finalteam3.exodia.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.socket.sockjs.support.SockJsHttpRequestHandler;

import com.finalteam3.exodia.employee.dto.response.LoginResponse;

public class LoginCheckInterceptor implements HandlerInterceptor{
	

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		if(handler instanceof SockJsHttpRequestHandler) {
			return true;
		}
		
		HandlerMethod handlerMethod = (HandlerMethod) handler;
		Login login = handlerMethod.getMethodAnnotation(Login.class);
		
		if(login != null) {
			//로그인 어노테이션이 있는 경우
			HttpSession session = request.getSession();
			LoginResponse loginResponse = (LoginResponse) session.getAttribute("login");
			
			if(loginResponse != null) {
				return true;
			}else {
				session.setAttribute("redirectUrl", request.getRequestURL().toString());
				response.sendRedirect(request.getContextPath() + "/employee/login");
				
				return false;
			}
		}else {
			//로그인 어노테이션이 없는 경우
			return true;
		}
		
	}
}
