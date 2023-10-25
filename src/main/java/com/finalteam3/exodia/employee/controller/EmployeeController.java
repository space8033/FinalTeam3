package com.finalteam3.exodia.employee.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Iterator;

import javax.annotation.Resource;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalteam3.exodia.employee.dto.request.JoinList;
import com.finalteam3.exodia.employee.dto.request.JoinRequest;
import com.finalteam3.exodia.employee.dto.request.PasswordRequest;
import com.finalteam3.exodia.employee.dto.response.LoginResponse;
import com.finalteam3.exodia.employee.service.EmployeeService;
import com.finalteam3.exodia.employee.service.EmployeeService.JoinResult;
import com.finalteam3.exodia.employee.service.EmployeeService.PasswordResult;
import com.finalteam3.exodia.security.dto.EmpDetails;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/employee")
@Slf4j
public class EmployeeController {
	private String filePath = "C:\\Users\\KOSA\\Desktop";
	private static String fileNm = "exodiahr.xlsx";

	@Resource
	private EmployeeService employeeService;
	
	@GetMapping("/login")
	public String loginForm() {
		return "/login";
	}
	
	@GetMapping("/initialPassword")
	public String initialPasswordForm(Authentication authentication, Model model) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		
		model.addAttribute("loginEmp", loginResponse.getEmp_id());
		
		
		return "/initialPassword";
	}
	
	@PostMapping("/initialPassword")
	public String initialPassword(Authentication authentication, PasswordRequest passwordRequest) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		String emp_id = loginResponse.getEmp_id();
		passwordRequest.setEmp_id(emp_id);
		
		if(employeeService.changePassword(passwordRequest).equals(PasswordResult.PCHANGE_SUCCESS)) {
			return "redirect:/logout";			
		}else {
			return "redirect:/employee/initialPassword";
		}
		
	}
	
	@GetMapping("/addUser")
	public String joinForm(Authentication authentication, Model model) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		
		return "/addUser";
	}
	
	
	@PostMapping("/addUser")
	public String join(JoinList joinRequest) {
		
		log.info(joinRequest.toString());
		
		//employeeService.join(joinRequest);
		
		return "/addUser";
	}
	
	//프로젝트 진행을 위한 임시 부분/////////////////////////////////////////////////////////
	@GetMapping("/jjoin")
	public String jjoinForm(Authentication authentication, Model model) {
		EmpDetails empDetails = (EmpDetails) authentication.getPrincipal();
		LoginResponse loginResponse = empDetails.getLoginResponse();
		
		String emp_name = loginResponse.getEmpInfo_name();
		model.addAttribute("empInfo_name", emp_name);
		return "/jjoin";
	}
	
	@PostMapping("/jjoin")
	public String jjoin(JoinRequest joinRequest) {
		if(employeeService.join(joinRequest).equals(JoinResult.JOIN_SUCCESS)) {
			return "redirect:/employee/login";			
		}else {
			return "/redirect:/employee/jjoin";
		}
	}
	//프로젝트 진행을 위한 임시 부분/////////////////////////////////////////////////////////
	@PostMapping("/poiJoin")
	public String poiJoin() {
	    
		try {
            FileInputStream file = new FileInputStream(new File(filePath, fileNm));

            // 엑셀 파일로 Workbook instance를 생성한다.
            XSSFWorkbook workbook = new XSSFWorkbook(file);

            // workbook의 첫번째 sheet를 가저온다.
            XSSFSheet sheet = workbook.getSheetAt(0);

            // 만약 특정 이름의 시트를 찾는다면 workbook.getSheet("찾는 시트의 이름");
            // 만약 모든 시트를 순회하고 싶으면
            // for(Integer sheetNum : workbook.getNumberOfSheets()) {
            //      XSSFSheet sheet = workbook.getSheetAt(i);
            // }
            // 아니면 Iterator<Sheet> s = workbook.iterator() 를 사용해서 조회해도 좋다.

            // 모든 행(row)들을 조회한다.
            Iterator<Row> rowIterator = sheet.iterator();
            while (rowIterator.hasNext()) {
                Row row = rowIterator.next();
                if(row.getRowNum() == 0) {
                	continue;
                }else {
                	JoinRequest joinRequest = new JoinRequest();
                	
                	Iterator<Cell> cellIterator = row.cellIterator();
                	
                	while (cellIterator.hasNext()) {
                		Cell cell = cellIterator.next();
                		if(cell.getColumnIndex() == 0) {
                			joinRequest.setEmpinfo_name(cell.getStringCellValue());
                		}else if(cell.getColumnIndex() == 1) {
                			joinRequest.setEmp_id(cell.getStringCellValue());
                		}else if(cell.getColumnIndex() == 2) {
                			joinRequest.setEmpinfo_phone(cell.getStringCellValue());
                		}else if(cell.getColumnIndex() == 3) {
                			joinRequest.setEmpinfo_email(cell.getStringCellValue());
                		}else if(cell.getColumnIndex() == 4) {
                			joinRequest.setEmpinfo_position(cell.getStringCellValue());
                		}
                	}
                	
                	employeeService.join(joinRequest);
                }
            }
            file.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
		
		return "redirect:/employee/jjoin";
	}
}
