package com.finalteam3.exodia;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Main {
	
	@RequestMapping("/")
	public String login(Model model) {
		return "login";
	}
	
	@RequestMapping("/note")
	public String note(Model model) {
		return "note";
	}
	@RequestMapping("/note2")
	public String note2(Model model) {
		return "note2";
	}
	
	@RequestMapping("/chat")
	public String chat(Model model) {
		return "chat";
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
	@RequestMapping("/addUser")
	public String addUser(Model model) {
		return "addUser";
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
}
