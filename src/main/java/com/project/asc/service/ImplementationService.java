package com.project.asc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.asc.dao.ImplementationDAO;

@Service("implementationService")
public class ImplementationService {

	@Autowired
	private ImplementationDAO implementationDAO;
}
