package com.finalteam3.exodia.security.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LogoutSuccessHandler extends SimpleUrlLogoutSuccessHandler{
	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
		setDefaultTargetUrl("/employee/login");
		log.info("로갓");
		super.onLogoutSuccess(request, response, authentication);
	}
}
