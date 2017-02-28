package com.gh.greenhouse.dao;

import org.springframework.stereotype.Repository;

import com.gh.core.dao.BasicDao;
import com.gh.core.utils.daoutils.Cnd;
import com.gh.greenhouse.domain.Soil;

@Repository
public class SoilDao extends BasicDao<Soil> {

	public SoilDao() {
		super("soil", Soil.class);
	}

	public Soil findById(Integer id){
		return super.load(Cnd.where("Soil_id", "=", id));
	}
}
