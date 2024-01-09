package com.sul.app.address.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sul.app.address.service.AddressService;
import com.sul.app.address.vo.AddressVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("address")
@RequiredArgsConstructor
public class AddressController {

	private final AddressService service;
	
	//�ּ� �߰�
	@PostMapping("plus")
	public String plus(AddressVo vo) throws Exception {
		
		int result = service.plus(vo);
		
		if(result != 1) {
			throw new Exception();
		}
		return "redirect:/home";
	}
	
	//�ּ� ����
	@GetMapping("delete")
	public String delete(AddressVo vo, HttpSession session) throws Exception {
		
		int result = service.delete(vo);
		
		if(result != 1) {
			throw new Exception();
		}
			session.removeAttribute("address");
			session.setAttribute("alertMsg", "�ּҰ� ���� �Ǿ����ϴ�.");
			
			return "redirect:/home";
	}
}
