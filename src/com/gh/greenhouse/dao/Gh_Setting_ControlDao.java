package com.gh.greenhouse.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import com.gh.core.dao.BasicDao;
import com.gh.core.domain.Gh_Setting_Control;
import com.gh.core.utils.daoutils.Cnd;

@Repository
public class Gh_Setting_ControlDao extends BasicDao<Gh_Setting_Control> {

	public Gh_Setting_ControlDao() {
		super("Gh_Setting_Control", Gh_Setting_Control.class);
	}

 
	
	public List<Gh_Setting_Control> findSettingByGhId(Integer ghId){
		List<Gh_Setting_Control> list = super.setting_list(Cnd.where("GH_id", "=", ghId));
		return list;
	}
	
	 
  
}
