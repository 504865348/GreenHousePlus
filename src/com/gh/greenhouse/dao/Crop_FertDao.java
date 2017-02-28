package com.gh.greenhouse.dao;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.gh.core.dao.BasicDao;
import com.gh.core.utils.Pager;
import com.gh.core.utils.daoutils.Cnd;
import com.gh.greenhouse.domain.Crop_Fert;
@Repository
public class Crop_FertDao extends BasicDao<Crop_Fert> {
	public Crop_FertDao(){
		super("Crop_Fert",Crop_Fert.class);
	}
	
	@Resource
	private FertilizerDao fertilizerDao;
	
	@Override
	public Pager<Crop_Fert> listByPage(Cnd cnd, int pageSize, int pageNumber) {
		Pager<Crop_Fert> pager = super.listByPage(cnd, pageSize, pageNumber);
		for(Crop_Fert fert:pager.getList()){
			fert.setFertilizer(fertilizerDao.findById(fert.getFert_id()));
		}
		return pager;
	}
}
