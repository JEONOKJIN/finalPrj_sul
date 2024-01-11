package com.sul.app.delivery.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sul.app.delivery.service.DeliveryService;
import com.sul.app.delivery.vo.DeliveryVo;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("adminDelivery")
public class AdminDeliveryController {

	private final DeliveryService service;

	// 배송목록 조회
	@GetMapping("list")
	public List<DeliveryVo> list() {
		return service.list();
	}

	// 배송목록 상세 조회
	@GetMapping("detail")
	public DeliveryVo detail(String no) {
		return service.detail(no);
	}

	// 배송상태 수정
	@PostMapping("status")
	public Map<String, String> status(DeliveryVo vo) {

		Map<String, String> map = new HashMap<String, String>();
		int result = service.status(vo);

		if (result == 1) {
			map.put("msg", "good");
		} else {
			map.put("msg", "bad");
		}
		return map;
	}

}