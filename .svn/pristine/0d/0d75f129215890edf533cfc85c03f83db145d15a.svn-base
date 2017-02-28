package com.gh.greenhouse.dao;

import org.springframework.stereotype.Repository;

import com.gh.core.dao.BasicDao;
import com.gh.core.utils.daoutils.Cnd;
import com.gh.greenhouse.domain.Control;

@Repository
public class ControlDao extends BasicDao<Control> {
	public ControlDao() {
		super("Control", Control.class);
	}

	/**查找制定设备的状态信息
	 * @param devId
	 * @return
	 */
	public Control findByDeviceId(Integer devId){
		return super.load(Cnd.where("Equip_id", "=", devId));
	}
}
