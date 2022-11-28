package com.project.asc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("functionDAO")
public class FunctionDAO {

	@Autowired
	private SqlSession sqlSession;
}
