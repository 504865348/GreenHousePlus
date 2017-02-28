package com.gh.greenhouse.dao;

import org.springframework.stereotype.Repository;

import com.gh.core.dao.BasicDao;
import com.gh.greenhouse.domain.ProjectMan;

@Repository
public class ProjectManDao extends BasicDao<ProjectMan> {

	public ProjectManDao() {
		super("ProjectMan", ProjectMan.class);
	}

}
