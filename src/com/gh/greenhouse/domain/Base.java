package com.gh.greenhouse.domain;

import com.gh.core.domain.User;


/**
 * 基地信息
 * @author 吴奇俊
 * 2015-10-18 下午6:39:42
 */
public class Base {
	
	/**
	 * 主键id
	 */
	private Integer Base_id;
	
	/**
	 * 名称
	 */
	private String Base_name;
	
	/**
	 * 地址
	 */
	private String Base_address;
	
	/**
	 * 经度
	 */
	private String Base_lat;
	
	/**
	 * 纬度
	 */
	private String Base_long;
	
	/**
	 * 管理者id
	 */
	private Integer User_id;
	
		
	/**
	 * 是否被删除
	 */
	private String deleted;

	private User user;
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public Integer getBase_id() {
		return Base_id;
	}

	public void setBase_id(Integer base_id) {
		Base_id = base_id;
	}

	public String getBase_name() {
		return Base_name;
	}

	public void setBase_name(String base_name) {
		Base_name = base_name;
	}

	public String getBase_address() {
		return Base_address;
	}

	public void setBase_address(String base_address) {
		Base_address = base_address;
	}

	public String getBase_lat() {
		return Base_lat;
	}

	public void setBase_lat(String base_lat) {
		Base_lat = base_lat;
	}

	public String getBase_long() {
		return Base_long;
	}

	public void setBase_long(String base_long) {
		Base_long = base_long;
	}


	public Integer getUser_id() {
		return User_id;
	}

	public void setUser_id(Integer user_id) {
		User_id = user_id;
	}


}
