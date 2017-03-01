package com.gh.greenhouse.dao;

import org.springframework.stereotype.Repository;

import com.gh.core.dao.BasicDao;
import com.gh.core.domain.Crop_Grouth_Info;
import com.gh.core.utils.daoutils.Cnd;
@Repository
public class CropGrouthDao extends BasicDao<Crop_Grouth_Info>{

	public CropGrouthDao(){
		super("Crop_Grouth_Info",Crop_Grouth_Info.class);
	}

	public Crop_Grouth_Info findById(Integer id){
		return load(Cnd.where("gh_id", "=", id));
	}

}
