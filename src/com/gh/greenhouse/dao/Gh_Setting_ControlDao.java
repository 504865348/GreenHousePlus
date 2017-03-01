package com.gh.greenhouse.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.gh.core.dao.BasicDao;
import com.gh.core.domain.Gh_Setting_Control;
import com.gh.core.utils.Pager;
import com.gh.core.utils.daoutils.Cnd;
import com.gh.core.utils.daoutils.Mapper;
import com.gh.greenhouse.domain.SetupCon;

@Repository
public class Gh_Setting_ControlDao extends BasicDao<Gh_Setting_ControlDao> {

	public Gh_Setting_ControlDao() {
		super("Gh_Setting_Control", Gh_Setting_Control.class);
	}

 
	
	public List<Gh_Setting_ControlDao> findSettingByGhId(Integer ghId){
		List<Gh_Setting_ControlDao> list = super.list(Cnd.where("GH_id", "=", ghId));
		System.out.println("list"+list.toString());
		return list;
	}
	
	 
  
}
