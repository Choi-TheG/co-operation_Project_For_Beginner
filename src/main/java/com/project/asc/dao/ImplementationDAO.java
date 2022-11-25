package com.project.asc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("implementationDAO")
public class ImplementationDAO {
	
	@Autowired
	private SqlSession sqlSession;

}
