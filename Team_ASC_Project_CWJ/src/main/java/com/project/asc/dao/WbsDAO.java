package com.project.asc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("wbsDAO")
public class WbsDAO {
	
	@Autowired
	private SqlSession sqlSession;
}
