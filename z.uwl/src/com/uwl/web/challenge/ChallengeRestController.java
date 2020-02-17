package com.uwl.web.challenge;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.portlet.ModelAndView;

import com.uwl.common.Page;
import com.uwl.common.Search;
import com.uwl.service.challenge.ChallengeService;
import com.uwl.service.domain.Challenge;
import com.uwl.service.domain.Commentt;
import com.uwl.service.domain.Post;
import com.uwl.service.domain.Purchase;
import com.uwl.service.domain.Reward;
import com.uwl.service.domain.User;
import com.uwl.service.reward.RewardService;

import sun.security.util.PropertyExpander.ExpandException;

@RestController
@RequestMapping("/challenge/*")
public class ChallengeRestController {
	
	//Field ==> 더 필요하면 추가시킬것.
	@Autowired
	@Qualifier("challengeServiceImpl")
	private ChallengeService challengeService;
	
	//Field
	@Autowired
	@Qualifier("rewardServiceImpl")
	private RewardService rewardService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	//Constructor
	public ChallengeRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="/rest/addSummerNoteFile", method=RequestMethod.POST)
	public String addSummerNoteFile(MultipartFile file) throws Exception{
		System.out.println("addSummerNoteFile.POST");
		String path = "C:\\Users\\User\\git\\UWL\\uwl\\WebContent\\resources\\images\\";
		String name = "";
		file.transferTo(new File(path, file.getOriginalFilename()));
		name = file.getOriginalFilename();
		return name;
	}
	
	@RequestMapping(value = "/rest/completeChallenge", method = RequestMethod.POST)
	public boolean completeChallenge(HttpSession session) throws Exception{
		
		Map<String, Object> map = challengeService.getChallengeList();
		
		List<Challenge> list = (List<Challenge>)(map.get("list"));
		
		boolean completeCheck = false;
		
		System.out.println("/rest/completeChallenge completeChallenge() : POST");
		
		User user = (User) session.getAttribute("user");
		
		for (int i = 0; i < 1; i++) {
		
		Commentt commentt = new Commentt();
		commentt.setUserId(user.getUserId());
		Post post = new Post();
		post.setUserId(user.getUserId());
		post.setGatherCategoryNo(list.get(i).getPost().getGatherCategoryNo());
		
		
		Challenge challenge = new Challenge();
		challenge.setChallNo(list.get(i).getChallNo());
		challenge.setChallCategory(list.get(i).getChallCategory());
		challenge.setChallReward(list.get(i).getChallReward());
		challenge.setPostCommentComplete(list.get(i).getPostCommentComplete());
		challenge.setPost(post);
		challenge.setCommentt(commentt);
		System.out.println("/rest/completeChallenge challenge : " + challenge);
		System.out.println("/rest/completeChallenge challenge.getPost() : " + challenge.getPost());
		
		//null제약으로 인한 빈껍데기 넣어주기
		Purchase purchaseItem = new Purchase();
		
		Reward reward = new Reward();
		reward.setUserId(user.getUserId());
		
		//깡통만들어 넣어줌
		Search search = new Search();
		//토탈포인트의 정보를 가져오기 위한 긁어옴..
		Map<String, Object> rewardMap = rewardService.getUserBothPointList(search, reward);
		
		List<Reward> totalList = (List<Reward>)(map.get("list"));
		
		reward.setChallenge(challenge);
		reward.setPurchaseItem(purchaseItem);
		reward.setVariablePoint(challenge.getChallReward());
		reward.setVariableActivityPoint(challenge.getChallReward());
		reward.setTotalActivityPoint(totalList.get(0).getTotalActivityPoint());
		
		System.out.println("/rest/completeChallenge completeChallenge() reward : " + reward + "chall : " + challenge);
		challengeService.completeChallenge(reward, challenge, map, completeCheck);
		
		}
		
		
		return completeCheck;
	}
	
//	@RequestMapping( value = "rest/getSearchChallCategories")
//	public Map<String,Object> getSearchChallCategories(@RequestBody Map<String, Object> categoryCode) throws Exception{
//		
//		String challCategory = categoryCode.get("cetegoryCode");
//		System.out.println("ChallengeRestController getSearchChallCategories()의 challCategory : " + challCategory);
//		Map<String, Object> returnMap  = new HashMap<String, Object>();
//		
//		List<String> categoryValueList = new ArrayList<String>();
//		
//		//일단 2개만하는데 갯수가 늘어날수록 유동적으로 하는것으로 바꿀 것.
//		for (int i = 0; i < 2; i++) {
//			String categoryCompleteKey = challCategory + "0" + i;
//			System.out.println("categoryCompleteKey의 정보 : " + categoryCompleteKey);
//			categoryValueList.add(categoryCompleteKey);
//		}
//		
//		returnMap.put("categoryValueList", categoryValueList);
//		
//		return returnMap;
//	}
	
	
}
