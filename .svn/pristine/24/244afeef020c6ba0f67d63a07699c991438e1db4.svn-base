package com.gh.core.dao;

import java.util.List;

import com.gh.core.utils.Pager;
import com.gh.core.utils.daoutils.Cnd;
import com.gh.core.utils.daoutils.DBUtil;
import com.gh.core.utils.daoutils.Mapper;



public class BasicDao<T> {
	
	private DBUtil<T> util = null;

	public BasicDao(String tbName,Class<?> beanClass) {
		util = new DBUtil<T>(tbName,beanClass);
	}
	
	/**����һ����¼���������е�����²���ʹ��
	 * @param obj
	 * @return
	 */
	public int insert(T obj){
		return util.insert(obj);
	}
	
	/**逻辑删除函数，会尝试调用函数的setDeleted方法，所以必须存在deleted
	 * @param cnd
	 * @return
	 */
	public int logicDelete(Cnd cnd){
		return util.update(Mapper.make("deleted", 'Y').toMap(), cnd);
	}
	
	public int delete(Cnd cnd){
		return util.delete(cnd);
	}
	
	public int update(T obj,Cnd cnd){
		return util.update(obj, cnd);
	}
	
	/**
	 * @param cnd cnd
	 * @return
	 */
	public List<T> list(Cnd cnd){
		return util.list(cnd);
	}
	
	/**��ҳ��ѯ
	 * @param cnd
	 * @param pageSize
	 * @param pageNumber
	 * @return
	 */
	public Pager<T> listByPage(Cnd cnd,int pageSize,int pageNumber){
		
		Pager<T> pager = new Pager<T>();
		pager.setPageNumber(pageNumber);
		pager.setPageSize(pageSize);
		pager.setRecordCount(util.count(cnd));
		pager.setList(util.listByPage(cnd, pageSize, pageNumber));
		
		return pager;
	}
	
	public Pager<Mapper> listMapByPage(Cnd cnd,int pageSize,int pageNumber){
		
		Pager<Mapper> pager = new Pager<Mapper>();
		pager.setPageNumber(pageNumber);
		pager.setPageSize(pageSize);
		pager.setRecordCount(util.count(cnd));
		pager.setList(util.listMapByPage(cnd, pageSize, pageNumber));
		
		return pager;
	}

	public Pager<T> listByPage(String[] selectCols,Cnd cnd,int pageSize,int pageNumber){
		
		Pager<T> pager = new Pager<T>();
		pager.setPageNumber(pageNumber);
		pager.setPageSize(pageSize);
		pager.setRecordCount(util.count(cnd));
		pager.setList(util.listByPage(selectCols,cnd, pageSize, pageNumber));
		
		return pager;
	}
	public Pager<Mapper> listMapByPage(String[] selectCols,Cnd cnd,int pageSize,int pageNumber){
		
		Pager<Mapper> pager = new Pager<Mapper>();
		pager.setPageNumber(pageNumber);
		pager.setPageSize(pageSize);
		pager.setRecordCount(util.count(cnd));
		pager.setList(util.listMapByPage(selectCols,cnd, pageSize, pageNumber));
		
		return pager;
	}
	public List<T> list(){
		return util.list(null);
	}
	
	public List<T> list(String[] selectCols,Cnd cnd){
		return util.list(selectCols, cnd);
	}

	public DBUtil<T> getUtil() {
		return util;
	}

	public void setUtil(DBUtil<T> util) {
		this.util = util;
	}
	
	public T load(Cnd cnd){
		return util.load(cnd);
	}
	public T load(String[] selectCols,Cnd cnd){
		return util.load(selectCols,cnd);
	}
	
	public int count(Cnd cnd){
		return util.count(cnd);
	}
	public boolean exists(Cnd cnd){
		return util.count(cnd)!=0;
	}
}
