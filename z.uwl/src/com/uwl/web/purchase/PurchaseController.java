package com.uwl.web.purchase;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.uwl.common.Page;
import com.uwl.common.Search;
import com.uwl.service.imp.ImpService;
import com.uwl.service.imp.impl.ImpServiceImpl;
import com.uwl.service.purchase.PurchaseService;

@Controller
@RequestMapping(value = "/purchase/*")
public class PurchaseController {

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@Autowired
	private PurchaseService purchaseService;
	
	@Autowired
	private ImpService impService;
	
	@RequestMapping(value = "/getPurchaseList", method = RequestMethod.POST)
	public String getPurchaseList(@ModelAttribute Search search, @RequestParam String userId, Model model) throws Exception{
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		Map<String, Object> map = purchaseService.getPurchaseList(userId, search);
		map.put("search", search);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
		map.put("resultPage", resultPage);
		model.addAttribute("map", map);
		return "forward:/purchase/listPurchase.jsp";
	}
}
