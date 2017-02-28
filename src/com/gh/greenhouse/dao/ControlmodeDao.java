package com.gh.greenhouse.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gh.core.dao.BasicDao;
import com.gh.core.utils.Pager;
import com.gh.core.utils.daoutils.Cnd;
import com.gh.greenhouse.domain.Controlmode;
@Repository
public class ControlmodeDao extends BasicDao<Controlmode> {
	public ControlmodeDao(){
		super("Controlmode",Controlmode.class);
	}

	public List<Controlmode> findByType(Integer type){
		return super.list(Cnd.where("Mode", "=", type));
	}
	
	public Pager<Controlmode > findPageByGhId(Integer ghId,int ps,int pn){
		return listByPage(Cnd.where("GH_id", "=", ghId).and("deleted", "!=", "Y"), ps, pn);
	}
}
