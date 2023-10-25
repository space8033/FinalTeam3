package com.finalteam3.exodia.security.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.security.dto.EmpDetails;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws ServletException, IOException {
		//비밀번호 초기화 해야하는 대상이면 초기화 화면으로, 아니면 메인으로 이동
		EmpDetails empDetails = (EmpDetails)authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		
		if (loginResponse.isEmp_isinit()) {
            getRedirectStrategy().sendRedirect(request, response, "/employee/initialPassword");
        } else {
            getRedirectStrategy().sendRedirect(request, response, "/main");
        }
		
		super.onAuthenticationSuccess(request, response, authentication);
	}

}
