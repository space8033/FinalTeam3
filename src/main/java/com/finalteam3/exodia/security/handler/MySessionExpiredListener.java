package com.finalteam3.exodia.security.handler;

import org.springframework.context.ApplicationListener;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.web.session.HttpSessionDestroyedEvent;
import org.springframework.stereotype.Component;

import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.employee.service.EmployeeService;
import com.finalteam3.exodia.security.dto.EmpDetails;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class MySessionExpiredListener implements ApplicationListener<HttpSessionDestroyedEvent>{
	
	private final EmployeeService employeeService;
	
	public MySessionExpiredListener(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	
	@Override
	public void onApplicationEvent(HttpSessionDestroyedEvent event) {
		log.info("세션 만료!");
		SecurityContextImpl sessionSecurityContext = (SecurityContextImpl) event.getSession().getAttribute("SPRING_SECURITY_CONTEXT");
		
		Authentication authentication = sessionSecurityContext.getAuthentication();
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		
		String emp_id = loginResponse.getEmp_id();
		employeeService.updateLogoutStatus(emp_id);
		
	}

}
