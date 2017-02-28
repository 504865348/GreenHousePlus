package com.gh.greenhouse.dao;

import org.springframework.stereotype.Repository;

import com.gh.core.dao.BasicDao;
import com.gh.core.utils.daoutils.Cnd;
import com.gh.greenhouse.domain.Crop;
@Repository
public class CropDao extends BasicDao<Crop> {
	public CropDao(){
		super("Crop",Crop.class);
	}

	public Crop findById(Integer id){
		return load(Cnd.where("Crop_id", "=", id));
	}
}
