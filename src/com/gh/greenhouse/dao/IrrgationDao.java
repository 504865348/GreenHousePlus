package com.gh.greenhouse.dao;


import org.springframework.stereotype.Repository;

import com.gh.core.dao.BasicDao;
import com.gh.core.domain.Irrigation_Fertilization_Information;
import com.gh.core.entity.BaseAdminInfo;
import com.gh.core.utils.daoutils.Cnd;;

@Repository
public class IrrgationDao extends BasicDao<Irrigation_Fertilization_Information> {

	public IrrgationDao() {
		super("irrigation_fertilization_information", Irrigation_Fertilization_Information.class);
	}
	public Irrigation_Fertilization_Information getIrrigationInfo(){
		Irrigation_Fertilization_Information i = super.load(Cnd.where("base_id", "=", BaseAdminInfo.BASE__ID));
		return i;
	}
}

