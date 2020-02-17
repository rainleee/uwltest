package com.uwl.web.couple;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.uwl.common.Page;
import com.uwl.common.Search;
import com.uwl.service.community.CommunityService;
import com.uwl.service.couple.CoupleService;
import com.uwl.service.domain.Commentt;
import com.uwl.service.domain.Couple;
import com.uwl.service.domain.Matching;
import com.uwl.service.domain.Post;
import com.uwl.service.matching.MatchingService;

@RestController
@RequestMapping("/couple/*")
public class CoupleRestController {
	
	@Autowired
	@Qualifier("coupleServiceImpl")
	private CoupleService coupleService;
	
	@Autowired
	@Qualifier("matchingServiceImpl")
	private MatchingService matchingService;
	
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	public CoupleRestController() {
		
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value = "rest/login2/{userId}")
	public String login2(@PathVariable String userId) throws Exception {
		System.out.println("rest/login2/{userId} 시작");
		System.out.println("rest/login2/{userId} 끝");
		return userId;
	}
	
	@RequestMapping(value = "rest/getCoupleTimelinePostList/{userId}")
	public Map getCoupleTimelinePostList(@PathVariable String userId) throws Exception {
		System.out.println("rest/getCoupleTimelinePostList/{userId} 시작");
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(100);
		Map<String, Object> map = coupleService.getCoupleTimelinePostList(search, userId);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCoupleTimelinePost")).intValue(), pageUnit, pageSize);
		System.out.println("resultPage : " + resultPage);
		Map map2 = new HashMap();
		map2.put("list", map.get("list"));
		map2.put("resultPage", resultPage);
		map2.put("search", search);
		map2.put("userId", userId);
		System.out.println("rest/getCoupleTimelinePostList/{userId} 끝");
		return map2;
	}
	
	@RequestMapping(value = "rest/addCoupleTimelinePost/{userId}")
	public String addCoupleTimelinePost(@PathVariable String userId) throws Exception {
		System.out.println("rest/addCoupleTimelinePost/{userId} 시작");
		System.out.println("rest/addCoupleTimelinePost/{userId} 끝");
		return userId;
	}
	
	@RequestMapping(value = "rest/addCoupleTimelinePost2/{userId}")
	public Map addCoupleTimelinePost2(@PathVariable String userId, @RequestBody Post post) throws Exception {
		System.out.println("rest/addCoupleTimelinePost2/{userId} 시작");
		coupleService.addCoupleTimelinePost(post);
		Map<String, Object> map = new HashMap();
		map.put("userId", userId);
		map.put("post", post);
		System.out.println("rest/addCoupleTimelinePost2/{userId} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/getCoupleTimelinePost/{userId}/{postNo}")
	public Map getCoupleTimelinePost(@PathVariable String userId, @PathVariable int postNo) throws Exception {
		System.out.println("rest/getCoupleTimelinePost/{userId} 시작");
		Map<String, Object> map = new HashMap();
		map.put("userId", userId);
		Post post = coupleService.getCoupleTimelinePost(postNo);
		map.put("post", post);
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(100);
		Map<String, Object> map2 = coupleService.getCoupleTimelineCommentList(search, postNo);
		map.put("list", map2.get("list"));
		System.out.println("rest/getCoupleTimelinePost/{userId} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/updateCoupleTimelinePost/{userId}/{postNo}")
	public Map updateCoupleTimelinePost(@PathVariable String userId, @PathVariable int postNo) throws Exception {
		System.out.println("rest/updateCoupleTimelinePost/{userId}/{postNo} 시작");
		Map<String, Object> map = new HashMap();
		map.put("userId", userId);
		Post post = coupleService.getCoupleTimelinePost(postNo);
		map.put("post", post);
		System.out.println("rest/updateCoupleTimelinePost/{userId}/{postNo} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/updateCoupleTimelinePost2/{userId}/{postNo}")
	public Map updateCoupleTimelinePost2(@PathVariable String userId, @PathVariable int postNo, @RequestBody Post post) throws Exception {
		System.out.println("rest/updateCoupleTimelinePost2/{userId}/{postNo} 시작");
		Map<String, Object> map = new HashMap();
		map.put("userId", userId);
		map.put("postNo", postNo);
		coupleService.updateCoupleTimelinePost(post);
		Post post2 = coupleService.getCoupleTimelinePost(postNo);
		map.put("post", post2);
		System.out.println("rest/updateCoupleTimelinePost2/{userId}/{postNo} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/deleteCoupleTimelinePost/{userId}/{postNo}")
	public Map deleteCoupleTimelinePost(@PathVariable String userId, @PathVariable int postNo) throws Exception {
		System.out.println("rest/deleteCoupleTimelinePost/{userId}/{postNo} 시작");
		Map<String, Object> map = new HashMap();
		map.put("userId", userId);
		map.put("postNo", postNo);
		System.out.println("rest/deleteCoupleTimelinePost/{userId}/{postNo} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/deleteCoupleTimelinePost2/{postNo}")
	public void deleteCoupleTimelinePost(@PathVariable int postNo) throws Exception {
		System.out.println("rest/deleteCoupleTimelinePost2/{postNo} 시작");
		Post post = coupleService.getCoupleTimelinePost(postNo);
		coupleService.deleteCoupleTimelinePost(post);
		System.out.println("rest/deleteCoupleTimelinePost2/{postNo} 끝");
	}
	
	@RequestMapping(value = "rest/addCoupleTimelineComment2")
	public Commentt addCoupleTimelineComment2(@RequestBody Commentt comment) throws Exception {
		System.out.println("rest/addCoupleTimelineComment2 시작");
		coupleService.addCoupleTimelineComment(comment);
		Commentt comment2 = communityService.getComment(comment.getUserId(), comment.getPostNo());
		
		System.out.println("rest/addCoupleTimelineComment2 끝");
		return comment2;
	}
	
	@RequestMapping(value = "rest/addCoupleTimelineComment/{userId}/{postNo}")
	public Map addCoupleTimelineComment(@PathVariable String userId, @PathVariable int postNo) throws Exception {
		System.out.println("rest/addCoupleTimelineComment/{userId}/{postNo} 시작");
		Map<String, Object> map = new HashMap();
		map.put("userId", userId);
		map.put("postNo", postNo);
		System.out.println("rest/addCoupleTimelineComment/{userId}/{postNo} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/deleteCoupleTimelineComment/{userId}/{commentNo}")
	public Map deleteCoupleTimelineComment(@PathVariable String userId, @PathVariable int commentNo) throws Exception {
		System.out.println("rest/deleteCoupleTimelineComment/{userId}/{commentNo} 시작");
		Map<String, Object> map = new HashMap();
		map.put("userId", userId);
		map.put("commentNo", commentNo);
		System.out.println("rest/deleteCoupleTimelineComment/{userId}/{commentNo} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/deleteCoupleTimelineComment2/{userId}/{commentNo}")
	public Commentt deleteCoupleTimelineComment2(@PathVariable String userId, @PathVariable int commentNo) throws Exception {
		System.out.println("rest/deleteCoupleTimelineComment2/{userId}/{commentNo} 시작");
		Commentt comment = coupleService.getCoupleTimelineComment(commentNo);
		coupleService.deleteCoupleTimelineComment(comment);
		System.out.println("rest/deleteCoupleTimelineComment2/{userId}/{commentNo} 끝");
		return comment;
	}
	
//	@RequestMapping(value = "rest/getScheduleList/{userId}")
//	public Map getScheduleList(@PathVariable String userId) throws Exception {
//		System.out.println("rest/getScheduleList/{userId} 시작");
//		Map<String, Object> map = new HashMap();
//		map.put("userId", userId);
//		Search search = new Search();
//		search.setCurrentPage(1);
//		search.setPageSize(100);
//		Map<String, Object> map2 = coupleService.getScheduleList2(search, userId);
//		map.put("list", map2.get("list"));
//		System.out.println("rest/getScheduleList/{userId} 끝");
//		return map;
//	}
	
	@RequestMapping(value = "rest/getScheduleList/{userId}")
	public String getScheduleList(@PathVariable String userId) throws Exception {
		System.out.println("rest/getScheduleList/{userId} 시작");
		System.out.println("rest/getScheduleList/{userId} 끝");
		return userId;
	}
	
	@RequestMapping(value ="rest/getScheduleList2/{userId}/{postDate}")
	public Map getScheduleList2(@PathVariable String userId, @PathVariable String postDate) throws Exception {
		System.out.println("rest/getScheduleList2/{userId}/{postDate} 시작");
		Map<String, Object> map = new HashMap();
		map.put("userId", userId);
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(100);
		Map<String, Object> map2 = coupleService.getScheduleList(search, userId, postDate);
		map.put("list", map2.get("list"));
		System.out.println("rest/getScheduleList2/{userId}/{postDate} 끝");
		return map;
	}
	
	
	
	@RequestMapping(value = "rest/addSchedule/{userId}")
	public String addSchedule(@PathVariable String userId) throws Exception {
		System.out.println("rest/addSchedule/{userId} 시작");
		System.out.println("rest/addSchedule/{userId} 끝");
		return userId;
	}
	
	@RequestMapping(value = "rest/addSchedule2")
	public Post addSchedule2(@RequestBody Post post) throws Exception {
		System.out.println("rest/addSchedule2 시작");
		coupleService.addSchedule(post);
		System.out.println("rest/addSchedule2 끝");
		return post;
	}
	
	@RequestMapping(value = "rest/getSchedule/{userId}/{postNo}")
	public Map getSchedule(@PathVariable String userId, @PathVariable int postNo) throws Exception {
		System.out.println("rest/getSchedule/{userId}/{postNo} 시작");
		Post post = coupleService.getSchedule(postNo);
		Map<String, Object> map = new HashMap();
		map.put("userId", userId);
		map.put("post", post);
		System.out.println("rest/getSchedule/{userId}/{postNo} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/updateSchedule/{userId}/{postNo}")
	public Map updateSchedule(@PathVariable String userId, @PathVariable int postNo) throws Exception {
		System.out.println("rest/updateSchedule/{userId}/{postNo} 시작");
		Map<String, Object> map = new HashMap();
		map.put("userId", userId);
		map.put("postNo", postNo);
		Post post = coupleService.getSchedule(postNo);
		map.put("post", post);
		System.out.println("rest/updateSchedule/{userId}/{postNo} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/updateSchedule/{postNo}")
	public void updateSchedule(@PathVariable int postNo, @RequestBody Post post) throws Exception {
		System.out.println("rest/updateSchedule/{postNo} 시작");
		coupleService.updateSchedule(post);
		System.out.println("rest/updateSchedule/{postNo} 끝");
	}
	
	@RequestMapping(value = "rest/deleteSchedule/{userId}/{postNo}")
	public Map deleteSchedule(@PathVariable String userId, @PathVariable int postNo) throws Exception {
		System.out.println("rest/deleteSchedule/{userId}/{postNo} 시작");
		Map<String, Object> map = new HashMap();
		map.put("userId", userId);
		map.put("postNo", postNo);
		System.out.println("rest/deleteSchedule/{userId}/{postNo} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/deleteSchedule2/{postNo}")
	public void deleteSchedule2(@PathVariable int postNo) throws Exception {
		System.out.println("json/deleteSchedule2/{postNo} 시작");
		Post post = coupleService.getSchedule(postNo);
		coupleService.deleteSchedule(post);
		System.out.println("rest/deleteSchedule2/{postNo} 끝");
	}
	
	@RequestMapping(value = "rest/deleteCouple/{userId}")
	public Map deleteCouple(@PathVariable String userId) throws Exception {
		System.out.println("rest/deleteCouple/{userId} 시작");
		Map<String, Object> map = new HashMap();
		map.put("userId", userId);
		if(coupleService.getCouple(userId) != null) {
			Couple couple = coupleService.getCouple(userId);
			map.put("couple", couple);
		}
		System.out.println("rest/deleteCouple/{userId} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/deleteCouple2/{userId}")
	public Map deleteCouple2(@PathVariable String userId) throws Exception {
		System.out.println("rest/deleteCouple2/{userId} 시작");
		Map<String, Object> map = new HashMap();
		map.put("userId", userId);
		Couple couple = coupleService.getCouple(userId);
		String secondUserId = couple.getSecondUserId();
		map.put("secondUserId", secondUserId);
		System.out.println("rest/deleteCouple2/{userId} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/deleteCouple3/{userId}/{secondUserId}")
	public void deleteCouple3(@PathVariable String userId, @PathVariable String secondUserId) throws Exception {
		System.out.println("rest/deleteCouple3/{userId}/{secondUserId} 시작");
		Couple couple = coupleService.getCouple(userId);
		coupleService.deleteCouple(couple);
		Matching matching = matchingService.getMatching(userId);
		Matching matching2 = matchingService.getMatching(secondUserId);
		matchingService.deleteMatching(matching);
		matchingService.deleteMatching(matching2);
		coupleService.deleteCoupleTimeline(userId, secondUserId);
		System.out.println("rest/deleteCouple3/{userId}/{secondUserId} 끝");
	}
}
