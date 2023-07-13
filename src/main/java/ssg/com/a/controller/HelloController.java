package ssg.com.a.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ssg.com.a.dto.MemberDto;
import ssg.com.a.service.MemberService;

@Controller
public class HelloController {
	
	@Autowired
	MemberService service;	// MemberService service = new MemberServiceImpl();

	@RequestMapping(value = "hello.do", method = RequestMethod.GET)
	public String hello(Model model) {
		System.out.println("HelloController hello() " + new Date());
		
		List<MemberDto> list = service.allMember();		
		model.addAttribute("list", list);
		
		return "hello";  // hello.jsp
	}
	
	@GetMapping("find.do")
	public String findMember(String id, Model model) {
		System.out.println("HelloController findMember() " + new Date());
		
		MemberDto mem = service.find(id);
		model.addAttribute("mem", mem);
		
		return "hello"; // jsp 파일명
	}
	
	@ResponseBody	// <- ajax인 경우에만 추가!!!
	@RequestMapping(value = "idcheck.do", 
					method = RequestMethod.GET, 
					produces="application/String; charset=utf-8") // <- 문자열의 한글인 경우만
	public String idcheck(String id) {
		System.out.println("HelloController idcheck() " + new Date());
		System.out.println("id:" + id);
		
		return "오케이";	// <- value
	}
	
	@ResponseBody
	@PostMapping("account.do")
	public String account(MemberDto mem) {
		System.out.println("HelloController account() " + new Date());
		
		System.out.println(mem.toString());		
		return "OK";	// <- value
	}
	
	@ResponseBody
	@GetMapping("getlist.do")
	public List<MemberDto> getlist(){
		System.out.println("HelloController getlist() " + new Date());
		
		List<MemberDto> list = service.allMember();
		return list;
	}
	
	@ResponseBody
	@GetMapping("getmap.do")
	public Map<String, Object> getmap(){
		System.out.println("HelloController getmap() " + new Date());
		
		String message = "이것은 성공의 열쇠다";
		List<MemberDto> list = service.allMember();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("message", message);
		map.put("list", list);
		
		return map;
	}
	
}










