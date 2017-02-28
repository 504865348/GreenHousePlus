package com.gh.greenhouse.dao;

import org.springframework.stereotype.Repository;

import com.gh.core.dao.BasicDao;
import com.gh.core.domain.Gh_Outer_Meteorological;
import com.gh.core.entity.BaseAdminInfo;
import com.gh.core.utils.daoutils.Cnd;

@Repository
public class OuterMeteorologicalDao extends BasicDao<Gh_Outer_Meteorological>{

	public OuterMeteorologicalDao() {
		super("gh_outer_meteorological", Gh_Outer_Meteorological.class);
	}
	
	public Gh_Outer_Meteorological getOuterInfo(){
		Gh_Outer_Meteorological i = super.load(Cnd.where("base_id", "=", BaseAdminInfo.BASE__ID));
		return i;
	}

}
