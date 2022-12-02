package com.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.model.PageDTO;
import com.spring.model.ProductDTO;
import com.spring.model.Product_contentDTO;
import com.spring.service.ProductDAO;
import com.spring.service.Product_contentDAO;

@Controller
public class ProductController {
	
	@Autowired
	private ProductDAO dao;
	
	@Autowired
	private Product_contentDAO pcdao;
	
	// 한 페이지당 보여질 게시물의 수
	private final int rowsize = 4;
		
	// DB 상의 전체 게시물의 수
	private int totalRecord = 0;
	
	@RequestMapping("/store.do")
	public String store() {
		
		return "store/store_main";
	}
	
	// 탁주 페이지 이동 시 처음으로 상품의 정보를 불러오는 메서드
	@RequestMapping("/store_tlist.do")
	public String list(HttpServletRequest request, Model model) {
		// 페이징 처리 작업
		int page;	// 현재 페이지 변수
				
		if(request.getParameter("page") != null) {
					
			page = Integer.parseInt(request.getParameter("page"));
					
		}else {
					
			// 처음으로 게시물 전체 목록 태그를 클릭한 경우
			page = 1;
					
		}
				
		// DB상의 전체 게시물의 수를 확인하는 메서드
		totalRecord = this.dao.getListCount();
				
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
				
		// 페이지에 해당하는 게시물을 가져오는 메서드 호출.
		List<ProductDTO> list = this.dao.getProductList(dto);
		
		model.addAttribute("list", list);
		
		model.addAttribute("page", dto);
		
		return "store/store_takju";
		
	}
		
	@RequestMapping("/product_content_list.do")
	public String list(Model model) {
		List<Product_contentDTO> list = this.pcdao.getProductContList();
		model.addAttribute("List", list);
		return "content/product_content_list";
	}
	
	// 마지막 스크롤 이동 시 지속적으로 상품 리스트를 불러오는 메서드
	@RequestMapping("/infinite_scroll.do")
	@ResponseBody
	public Object infinitescroll(@RequestParam("page") int page){
		
		PageDTO dto = new PageDTO(page, rowsize);
		
		// 페이지에 해당하는 게시물을 가져오는 메서드 호출.
		List<ProductDTO> list = this.dao.getProductList(dto);
				
		return list;
	}
}

