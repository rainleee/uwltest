package com.uwl.service.challenge.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.uwl.common.Search;
import com.uwl.service.challenge.ChallengeDAO;
import com.uwl.service.challenge.ChallengeService;
import com.uwl.service.domain.Challenge;
import com.uwl.service.domain.Commentt;
import com.uwl.service.domain.Post;
import com.uwl.service.domain.Reward;
import com.uwl.service.domain.SchoolRank;
import com.uwl.service.post.PostDAO;
import com.uwl.service.reward.RewardDAO;

@Service("challengeServiceImpl")
public class ChallengeServiceImpl implements ChallengeService{
	
	//Field
	@Autowired
	@Qualifier("challengeDAOImpl")
	private ChallengeDAO challengeDAO;
	
	@Autowired
	@Qualifier("rewardDAOImpl")
	private RewardDAO rewardDAO;
	
	@Autowired
	@Qualifier("postDAOImpl")
	private PostDAO postDAO;
	
	//Setter
	public void setChallengeDAO(ChallengeDAO challengeDAO) {
		this.challengeDAO = challengeDAO;
	}
	
	public void setRewardDAO(RewardDAO rewardDAO) {
		this.rewardDAO = rewardDAO;
	}



	//Constructor
	public ChallengeServiceImpl() {
		// TODO Auto-generated constructor stub
	}
	
	//Method
	@Override
	public void addChallenge(Challenge challenge) throws Exception {
		challengeDAO.addChallenge(challenge);
	}
	
	@Override
	public void addWeeklyStart(Challenge challenge) throws Exception {
		challengeDAO.addWeeklyStart(challenge);
	}

	@Override
	public void updateChallenge(Challenge challenge) throws Exception {
		challengeDAO.updateChallenge(challenge);
	}
	
	@Override
	public void deleteChallenge(Challenge challenge) throws Exception {
		challengeDAO.deleteChallenge(challenge);
	}
	
	@Override
	public Map<String, Object> getAdminChallengeList(Search search) throws Exception {
		
		List<Challenge> list = challengeDAO.getAdminChallengeList(search);
		int totalCount = challengeDAO.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public Challenge getChallengeAdmin(int challNo) throws Exception {
		return challengeDAO.getChallengeAdmin(challNo);
	}
	
	@Override
	public Challenge getNextOrPrePost(int challNo) throws Exception {
		return challengeDAO.getNextOrPrePost(challNo);
	}


	@Override
	public Map<String, Object> getChallengeList() throws Exception {
		
//		Map<String, Object> map = new HashMap<String,Object>();
//		map.put("list", list);
//		map.put("totalCount", new Integer(totalCount));
		
		
		List<Challenge> list = challengeDAO.getChallengeList();
		//challenge.setWeeklyStart(weeklyStart);
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("list", list);
		
		return map;
	}

//	@Override
//	public Challenge weeklyStart() throws Exception {
//		challengeDAO.weeklyStart();
//	}

	@Override
	public Map<String, Object> getCompleteChallengeList(Search search, String userId) throws Exception {
		
		System.out.println("ChallengeService의 search : " + search);
		System.out.println("ChallengeService의 userId : " + userId);
		
		int totalCount = challengeDAO.getTotalCountOne(userId);
		
		Map<String, Object> completeMap = challengeDAO.getCompleteChallengeList(search, userId);
		
		
		completeMap.put("totalCount", new Integer(totalCount));
		completeMap.put("list", completeMap.get("list"));
		
		return completeMap;
	}


	@Override
	public boolean completeChallenge(Reward reward, Challenge challenge, Map<String, Object> map, boolean completeCheck) throws Exception {
		
		
		List<Challenge> list = (List<Challenge>)(map.get("list"));
		Post challpost = challenge.getPost();
		Commentt commentt = challenge.getCommentt();
		
		for (int i = 0; i < list.size(); i++) {
			System.out.println("challengeServiceImpl의 completeChallenge() list: " + list.get(i));
			System.out.println("======================시작========================");
			list.get(i).setPost(challpost);
			list.get(i).setCommentt(commentt);
			System.out.println("challengeServiceImpl의 completeChallenge()의 주간도전과제 list("+i+") : " + list.get(i));
			
			//게시판활동 도전과제를 수행한다면 카테고리 3: 게시판활동 도전과제
			if (list.get(i).getChallCategory().equals("3")) {
				if (challengeDAO.getChallPostCompleteCount(list.get(i)) == list.get(i).getPostCommentComplete()) {
					System.out.println("challengeDAO.getChallPostCompleteCount(challenge) : " + challengeDAO.getChallPostCompleteCount(challenge) );
					reward.setChallenge(list.get(i)); 
					rewardDAO.increasePoint(reward);
					
					//조건이 충족되면 트루
					completeCheck = true;
					System.out.println("boolean : " + completeCheck);
					
					System.out.println("게시글작성 도전과제 조건이 충족되었음.");
					return completeCheck;
					
					//코멘트 조건이 충족했을 경우
				}else if(challengeDAO.getChallCommentCompleteCount(list.get(i)) == list.get(i).getPostCommentComplete()) {
					System.out.println("challengeDAO.getChallCommentCompleteCount(challenge) : " + challengeDAO.getChallPostCompleteCount(challenge) );
					reward.setChallenge(list.get(i)); 
					rewardDAO.increasePoint(reward);
					System.out.println("코멘트작성 도전과제 조건이 충족되었음.");
					
					//조건이 충족되면 트루
					completeCheck = true;
					System.out.println("boolean : " + completeCheck);
					
					return completeCheck;
				}
				
			}//end of if
			else {System.out.println("다른 도전과제를 검증하세요");}
			System.out.println("======================끝========================");
		} //end of for
		
		//조건이 충족되지않으면 false
		return completeCheck;
	}

	

}
