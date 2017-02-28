package com.gh.greenhouse.dao;

import org.springframework.stereotype.Repository;

import com.gh.core.dao.BasicDao;
import com.gh.greenhouse.domain.CropGH;
@Repository
public class CropGHDao extends BasicDao<CropGH> {
	public CropGHDao(){
		super("CropGH",CropGH.class);
	}
}
