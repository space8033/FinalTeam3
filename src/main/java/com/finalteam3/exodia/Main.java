package com.finalteam3.exodia;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Main {
	
	@RequestMapping("/")
	public String login(Model model) {
		return "redirect:/employee/login";
	}
	
/*	@RequestMapping("/note")
	public String note(Model model) {
		return "note";
	}*/
	@RequestMapping("/note2")
	public String note2(Model model) {
		return "note2";
	}
	

	@RequestMapping("/chat2")
	public String chat2(Model model) {
		return "chat2";
	}
	
	@RequestMapping("/searchUser")
	public String searchUser(Model model) {
		return "searchUser";
	}
	

	@RequestMapping("/calendar")
	public String calendar(Model model) {
		return "calendar";
	}
	
	@RequestMapping("/noticeList")
	public String noticeList(Model model) {
		return "noticeList";
	}
	
	@RequestMapping("/noticeAdd")
	public String noticeAdd(Model model) {
		return "noticeAdd";
	}
	
	@RequestMapping("/initialPassword")
	public String initialPassword(Model model) {
		return "initialPassword";
	}
	
	@RequestMapping("/addProject")
	public String addProject(Model model) {
		return "addProject";
	}
	
	@RequestMapping("/userManagement")
	public String userManagement(Model model) {
		return "userManagement";
	}
	@RequestMapping("/userProfile")
	public String userProfile(Model model) {
		return "userProfile";
	}
	@RequestMapping("/userModify")
	public String userModify(Model model) {
		return "userModify";
	}
	@RequestMapping("/userModify2")
	public String userModify2(Model model) {
		return "userModify2";
	}
	
	@RequestMapping("/projectList")
	public String projectList(Model model) {
		return "projectList";
	}
	
	@RequestMapping("/qnaList")
	public String qnaList(Model model) {
		return "qnaList";
	}
	
	@RequestMapping("/qnaDetail")
	public String qnaDetail(Model model) {
		return "qnaDetail";
	}
	
	@RequestMapping("/qnaAdd")
	public String qnaAdd(Model model) {
		return "qnaAdd";
	}
	
	@RequestMapping("/noticeDetail")
	public String noticeDetail(Model model) {
		return "noticeDetail";
	}
	
	@RequestMapping("/main")
	public String main(Model model) {
		return "main";
	}
	
	@RequestMapping("/mainCalendar")
	public String mainCalendar(Model model) {
		return "mainCalendar";
	}
}
