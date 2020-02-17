package com.uwl.web.social;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.uwl.common.Page;
import com.uwl.common.Search;
import com.uwl.service.community.CommunityService;
import com.uwl.service.domain.Ask;
import com.uwl.service.domain.Notification;
import com.uwl.service.domain.Post;
import com.uwl.service.domain.User;
import com.uwl.service.social.SocialService;

@RestController
@RequestMapping("/social/*")
public class SocialRestController {

	@Autowired
	private SocialService socialService;

	@Autowired
	private CommunityService communityService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping(value = "rest/addQuestion", method = RequestMethod.POST)
	public void addQuestion(@RequestBody Ask ask) throws Exception{
		socialService.addQuestion(ask);
	}
	
	
	@RequestMapping(value = "rest/getCommentList") // 페이지 넘기기 용?
	public Map<String, Object> getCommentList(@RequestBody HashMap<String, Object> dataMap) throws Exception {
		System.out.println("rest/getCommentList.POST or GET");
		Search search = new Search();
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		search.setPageSize(10000);
		search.setSearchCondition("1");
		search.setSearchKeyword((String)dataMap.get("searchKeyword"));

		System.out.println("dataMap" + dataMap);
		System.out.println(dataMap.get("postNo"));

		int postNo = Integer.parseInt((String) dataMap.get("postNo"));
		String userId = (String) dataMap.get("userId");

		Map<String, Object> map = communityService.getCommentList(search, postNo, userId);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);

		map.put("list", map.get("list"));
		map.put("resultPage", resultPage);
		map.put("search", search);
		return map;
	}
	
	@RequestMapping(value = "rest/updateTimeline", method = RequestMethod.POST)
	public void updateTimeline(@RequestBody Post post) throws Exception{
		socialService.updateTimeline(post);
	}
	
	@RequestMapping(value = "rest/replyQuestion", method = RequestMethod.POST)
	public void replyQuestion(@RequestBody Ask ask) throws Exception{
		socialService.replyQuestion(ask);
	}
	
	@RequestMapping(value = "rest/rejectQuestion", method = RequestMethod.POST)
	public void rejectQuestion(@RequestBody Ask ask) throws Exception{
		socialService.rejectQuestion(ask.getQuestionPostNo());
	}
	
	@RequestMapping(value = "rest/getAskQuestionList", method = RequestMethod.POST)
	public Map getQuestionList(@RequestBody Search search, HttpSession session) throws Exception{
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		System.out.println("search : " + search);
		System.out.println("userId : " + ((User)(session.getAttribute("user"))).getUserId());
		search.setPageSize(pageSize);
		Map<String, Object> map = socialService.getAskQuestionList(((User)(session.getAttribute("user"))).getUserId(), search, "1");
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		map.put("resultPage", resultPage);
		return map;
		
	}
	
	@RequestMapping(value = "rest/getAskList", method = RequestMethod.POST)
	public Map getAskList(@RequestBody HashMap<String, Object> hashmap) throws Exception{
		Search search = new Search();
		search.setCurrentPage((Integer)hashmap.get("currentPage"));
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = socialService.getAskList((String)hashmap.get("targetUserId"), search, "2");
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
		map.put("resultPage", resultPage);
		return map;
	}
	
	@RequestMapping(value = "rest/getTimelineList", method = RequestMethod.POST)
	public Map getTimelineList(@RequestBody HashMap<String, Object> hashmap, HttpSession session) throws Exception{
		String targetUserId = (String)hashmap.get("targetUserId");
		
		Search search = new Search();
		search.setCurrentPage((Integer)hashmap.get("currentPage"));
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		String sessionId = ((User)session.getAttribute("user")).getUserId();
		
		if (sessionId.equals(targetUserId)) {
			search.setSearchCondition("1");
		} else {
			search.setSearchCondition("0");
		}
		
		Map<String, Object> map = socialService.getTimelineList((String)hashmap.get("targetUserId"), search);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
		map.put("resultPage", resultPage);
		return map;
	}

	@RequestMapping(value = "rest/deleteTimeline", method = RequestMethod.POST)
	public void deleteTimeline(@RequestBody Post post) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		socialService.deleteTimeline(post.getPostNo());
		
	}
	
	///////////////////// NOTIFICATION //////////////////////
	
	@RequestMapping(value = "rest/addNoti", method = RequestMethod.POST)
	public void addNoti(@RequestBody Notification notification) throws Exception{
		socialService.addNoti(notification);
	}
	
	@RequestMapping(value = "rest/deleteNoti", method = RequestMethod.POST)
	public void deleteNoti(@RequestBody int notiNo) throws Exception{
		socialService.deleteNoti(notiNo);
	}
	
	@RequestMapping(value = "rest/deleteNotiAll", method = RequestMethod.POST)
	public void deleteNotiAll(@RequestBody String userId) throws Exception{
		socialService.deleteNotiAll(userId);
	}
	
	@RequestMapping(value = "rest/getNotiList", method = RequestMethod.POST)
	public Map getNotiList(@RequestBody Search search, HttpSession session) throws Exception{
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		String userId = ((User)session.getAttribute("user")).getUserId();
		return socialService.getNotiList(userId, search);
	}
	
	///////////////////// NOTIFICATION //////////////////////
}
