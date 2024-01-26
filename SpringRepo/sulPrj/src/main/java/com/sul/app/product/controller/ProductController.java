package com.sul.app.product.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sul.app.product.service.ProductService;
import com.sul.app.product.vo.ProductVo;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("product")
@RequiredArgsConstructor
public class ProductController {
	
	private final ProductService service;

	//제품 전체 조회
	@GetMapping("listByEnrollDate")
	public List<ProductVo> listByEnrollDate(ProductVo vo){
		List<ProductVo> voList = service.listByEnrollDate(vo);
//		System.out.println("전체조회 오나?");
//		System.out.println(voList);
		return voList;
	}
	
	//제품 별점별 조회
	@GetMapping("listByRating")
	public List<ProductVo> listByRating(ProductVo vo){
		List<ProductVo> voList = service.listByRating(vo);
//		System.out.println("별점별 조회 컨트롤러 오나?");
//		System.out.println(voList);
		return voList;
	}
	
	//제품 카테고리 별 전체 조회
	@GetMapping("list/{str}")
	public List<ProductVo> listByCategory(@PathVariable (name = "str") String str){
		List<ProductVo> voList = service.listByCategory(str);
		return voList;
	}
	
	//제품 상세 조회
	@GetMapping("detail")
	public ProductVo detail(ProductVo vo) {
//		System.out.println("detail vo값 : " + vo);
		ProductVo productVo = service.detail(vo);
//		System.out.println("상세조회 vo: " + productVo);
		return productVo;
	}
	
	//제품 검색
	@GetMapping("search")
	public List<ProductVo> search(ProductVo vo) {
		List<ProductVo> voList = service.searchByName(vo);
		return voList;
	}
}
