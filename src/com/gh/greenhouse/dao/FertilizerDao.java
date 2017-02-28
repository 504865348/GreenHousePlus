package com.gh.greenhouse.dao;

import org.springframework.stereotype.Repository;

import com.gh.core.dao.BasicDao;
import com.gh.core.utils.daoutils.Cnd;
import com.gh.greenhouse.domain.Fertilizer;
@Repository
public class FertilizerDao extends BasicDao<Fertilizer> {
	public FertilizerDao(){
		super("Fertilizer",Fertilizer.class);
	}

	public Fertilizer findById(Integer id){
		return super.load(Cnd.where("Fert_id", "=", id));
	}
}
