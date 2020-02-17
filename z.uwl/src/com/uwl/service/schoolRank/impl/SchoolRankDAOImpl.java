package com.uwl.service.schoolRank.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.uwl.common.Search;
import com.uwl.service.domain.Reward;
import com.uwl.service.domain.SchoolRank;
import com.uwl.service.schoolRank.SchoolRankDAO;

@Repository("schoolRankDAOImpl")
public class SchoolRankDAOImpl implements SchoolRankDAO {
	
	//field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public SchoolRankDAOImpl() {
		// TODO Auto-generated constructor stub
	}
	
	//setSqlSession
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void addSchoolRank(SchoolRank schoolRank) throws Exception {
		sqlSession.insert("SchoolRankMapper.addSchoolRank",schoolRank);
		
	}

	@Override
	public void updateSchoolRank(SchoolRank schoolRank) throws Exception {
		sqlSession.update("SchoolRankMapper.updateSchoolRank",schoolRank);
		
	}

	@Override
	public List<SchoolRank> getSchoolRankingList(Search search) throws Exception {
		return sqlSession.selectList("SchoolRankMapper.getSchoolRankingList", search);
	}

	@Override
	public SchoolRank getSearchRank(int schoolNo) throws Exception {
		return sqlSession.selectOne("SchoolRankMapper.getSearchRank", schoolNo);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("SchoolRankMapper.getTotalCount", search);
	}

	
	
	

}
