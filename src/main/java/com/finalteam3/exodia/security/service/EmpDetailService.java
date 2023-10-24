package com.finalteam3.exodia.security.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.finalteam3.exodia.employee.dao.EmployeeDao;
import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.security.dto.EmpDetails;

@Service
public class EmpDetailService implements UserDetailsService{
	@Resource
	private EmployeeDao employeeDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		LoginResponse loginResponse = employeeDao.selectEmpByEmpId(username);
		if(loginResponse == null) {
			throw new UsernameNotFoundException(username);
		}
		
		List<GrantedAuthority> authorities = new ArrayList<>();
		authorities.add(new SimpleGrantedAuthority(loginResponse.getRole_category().toString()));
		
		EmpDetails empDetails = new EmpDetails(loginResponse, authorities);
		
		return empDetails;
	}

}
