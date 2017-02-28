package com.gh.greenhouse.dao;

import org.springframework.stereotype.Repository;

import com.gh.core.dao.BasicDao;
import com.gh.core.utils.Pager;
import com.gh.core.utils.daoutils.Cnd;
import com.gh.greenhouse.domain.ModelBase;

@Repository
public class ModelBaseDao extends BasicDao<ModelBase> {

	public ModelBaseDao() {
		super("ModelBase", ModelBase.class);
	}

	/**
	 * 根据id查询模型库
	 * 
	 * @param modelId
	 * @return
	 */
	public ModelBase findByModelid(Integer modelId) {
		return super.load(Cnd.where("Model_id", "=", modelId));
	}

	/**
	 * 根据类型显示模型库，分页
	 * 
	 * @param type
	 * @param pageSize
	 * @param pageNumber
	 * @return
	 */
	public Pager<ModelBase> listByType(Integer type, Integer pageSize,
			Integer pageNumber) {
		return super.listByPage(
				Cnd.where("deleted", "=", "N").and("Monitor_type", "=", type),
				pageSize, pageNumber);
	}
}
