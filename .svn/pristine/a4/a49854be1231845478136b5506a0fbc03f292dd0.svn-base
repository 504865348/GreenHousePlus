package com.gh.greenhouse.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.gh.core.dao.BasicDao;
import com.gh.core.utils.daoutils.Cnd;
import com.gh.greenhouse.domain.Crop;
import com.gh.greenhouse.domain.ShedCrop;

@Repository
public class ShedCroplDao extends BasicDao<ShedCrop> {
	
	@Resource
	private CropDao cropDao;
	@Resource
	private SoilDao soilDao;

	public ShedCroplDao() {
		super("Shed_crop", ShedCrop.class);
	}
	
	/**查找温室的作物，按时间找最新的，如果没有返回null
	 * @param ghId
	 * @return
	 */
	public ShedCrop findCropByGhId(Integer ghId){
		ShedCrop shedCrop  = super.load(Cnd.where("Shed_id", "=", ghId).desc("crop_time"));
		if(shedCrop == null) return null;
		shedCrop.setCrop(cropDao.findById(shedCrop.getCrop_id()));
		shedCrop.setSoil(soilDao.findById(shedCrop.getSoil_id()));
		return shedCrop;
	}
	
	/**查找那些还不属于任何温室的作物
	 * @return
	 */
	public List<Crop> findCropOfNoGh(){
		List<ShedCrop> shedCrop = super.list(Cnd.where().isNull("Shed_id"));
		List<Crop> crops = new ArrayList<Crop>();
		for(ShedCrop shed:shedCrop){
			Crop crop = cropDao.load(Cnd.where("Crop_id", "=", shed.getCrop_id()));
			crops.add(crop);
		}
		return crops;
	}
}
