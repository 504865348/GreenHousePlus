package com.gh.greenhouse.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gh.core.dao.BasicDao;
import com.gh.core.utils.daoutils.Cnd;
import com.gh.greenhouse.domain.Element_type;

@Repository
public class Element_typeDao extends BasicDao<Element_type> {
public Element_typeDao(){
	super("Element_type",Element_type.class);

}

public List<Element_type> findByGhId(int ghId){
	return super.list(Cnd.where("gh_id","=",ghId));
}
/**
 * 根据type获取elementtype
 * @param type
 * @return
 */
public Element_type findByType(String type){
	return super.load(Cnd.where("Type", "=", type));
}
public Element_type findById(Integer id){
	return super.load(Cnd.where("id", "=", id));
}
}

