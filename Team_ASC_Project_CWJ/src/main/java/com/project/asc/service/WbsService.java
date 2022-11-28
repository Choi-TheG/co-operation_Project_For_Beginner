package com.project.asc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.asc.dao.WbsDAO;

@Service("wbsService")
public class WbsService {

	@Autowired
	private WbsDAO wbsDAO;
}
