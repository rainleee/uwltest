package com.uwl.service.schoolRank;

import java.util.List;
import java.util.Map;

import com.uwl.common.Search;
import com.uwl.service.domain.Reward;
import com.uwl.service.domain.SchoolRank;

public interface SchoolRankService {
	
	//회원가입 했을때 해당학교 no가 없으면 add한다
	public void addSchoolRank(SchoolRank schoolRank) throws Exception;
	
	//회원가입 시 해당 학교no가 테이블에 존재한다면 update
	public void updateSchoolRank(SchoolRank schoolRank) throws Exception;

	//학교랭킹 리스트를 확인하기 위한 method (flag 1:학교이름, 2:학교주소 LIKE를 써서 일부 단어로 검색가능)
	public Map<String, Object> getSchoolRankingList(Search search) throws Exception;
	
	//유저가 검색한 학교리스트
	public SchoolRank getSearchRank(int schoolNo) throws Exception;
			
}
