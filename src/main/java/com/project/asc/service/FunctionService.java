package com.project.asc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.asc.dao.FunctionDAO;

@Service("functionService")
public class FunctionService {
	
	@Autowired
	private FunctionDAO functionDAO;

}
