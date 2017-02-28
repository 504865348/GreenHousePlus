package com.gh.greenhouse.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gh.core.dao.BasicDao;
import com.gh.core.utils.daoutils.Cnd;
import com.gh.greenhouse.domain.Pesticides;

@Repository
public class PesticidesDao extends BasicDao<Pesticides> {

	public PesticidesDao() {
		super("Pesticides", Pesticides.class);
	}

	/**查找所有农药
	 * @return
	 */
	public List<Pesticides> findList(){
		return super.list(Cnd.where("deleted", "=", "N"));
	}
}
