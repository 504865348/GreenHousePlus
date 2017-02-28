package com.gh.greenhouse.dao;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.gh.core.dao.BasicDao;
import com.gh.core.dao.UserDao;
import com.gh.core.utils.Pager;
import com.gh.core.utils.daoutils.Cnd;
import com.gh.greenhouse.domain.Base;


@Repository
public class BaseDao extends BasicDao<Base> {
	
	@Resource
	private UserDao userDao;
	
public BaseDao(){
	super("Base",Base.class);

}

/**
 * 根据基地Id查看基地
 * @param id
 * @return
 */
public Base findByBaseid(Integer baseId){
	return super.load(Cnd.where("Base_id","=",baseId));
}

/**
 * 根据基地管理员id查看基地
 * @param userId
 * @return
 */
public Base findByUserid(Integer userId){
	return super.load(Cnd.where("User_id","=",userId));
}


/**
 * 查询全部有效基地，分页
 * @param pageSize
 * @param pageNumber
 * @return
 */
public Pager<Base> listBase(Integer pageSize,Integer pageNumber){
	
	 Pager<Base> pager=super.listByPage(Cnd.where("deleted","=","N"), pageSize, pageNumber);	
	 for(Base item:pager.getList()){
		 item.setUser(userDao.findByUserid(item.getUser_id()));	 
	 }
	 return pager;
}


}
