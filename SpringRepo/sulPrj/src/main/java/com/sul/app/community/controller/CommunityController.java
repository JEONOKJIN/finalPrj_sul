package com.sul.app.community.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sul.app.community.service.CommunityService;
import com.sul.app.community.vo.CommunityVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("board")
@RequiredArgsConstructor
public class CommunityController {

	private final CommunityService service;
	
	//�Խñ��ۼ�
	@PostMapping("insert")
	public String insert(CommunityVo vo) throws Exception {
		
		int result = service.insert(vo);
		
		if(result != 1) {
			throw new Exception();
		}
		return "redirect:/community/list";
	}
	
	//�Խñ� ��� ��ȸ (data jsp�Ѱܼ� ȭ�� �������)
	@GetMapping("list")
	public String list(Model model) {
		
		List<CommunityVo> voList = service.list();
		model.addAttribute("communityVoList", voList);
		
		return "community/list";
 	}
	
	//�Խñ� ��� ��ȸ(data��)
	@GetMapping("rest/list")
	@ResponseBody
	public List<CommunityVo> restList(){
		List<CommunityVo> voList = service.list();
		return voList;
	}
	
	//�Խñ� ����ȸ (��ȣ)
	@GetMapping("detail")
	public String detail(CommunityVo vo, Model model) {
		CommunityVo communityVo = service.detail(vo);
		model.addAttribute("communityVo", communityVo);
		return "community/detail";
 	}
	
	//�Խñ� ����
	@PostMapping("edit")
	public String edit(CommunityVo vo) throws Exception {
		int result = service.edit(vo);
		if(result != 1) {
			throw new Exception();
		}
		return "redirect:/community/detail?no=" + vo.getCommunityNo();
	}
	
	//�Խñ� ����
	@GetMapping("delete")
	public String delete(CommunityVo vo) throws Exception{
		int result = service.delete(vo);
		if(result != 1) {
			throw new Exception();
		}
		return "redirect:/community/list";
	}
	
	
}
