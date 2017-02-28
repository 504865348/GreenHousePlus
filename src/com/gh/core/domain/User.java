package com.gh.core.domain;

public class User {
	private Integer User_id;
	private String User_realname;
	private String User_mobile;
	/**
	 * 3-系统管理员
		2-基地管理员
		1-生产者（温室管理员）
		0-访客
	 */
	private Integer User_type;
	/**
	 * 用户的上级id
	 */
	private Integer pid;
	private String Username;
	private String Password;
	/**
	 * 二级密码，更换控制模式时使用
	 */
	private String sec_password;
	
	public String getSec_password() {
		return sec_password;
	}

	public void setSec_password(String sec_password) {
		this.sec_password = sec_password;
	}

	/**
	 * 是否被删除
	 */
	private String deleted;

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public boolean isSysManager(){
		return User_type == 3;
	}
	
	public boolean isBaseManager(){
		return User_type == 2;
	}
	public boolean isGhManager(){
		return User_type == 1;
	}
	
	public boolean isVisitor(){
		return User_type == 0;
	}
	
	public Integer getUser_id() {
		return User_id;
	}

	public void setUser_id(Integer user_id) {
		User_id = user_id;
	}

	public String getUser_realname() {
		return User_realname;
	}

	public void setUser_realname(String user_realname) {
		User_realname = user_realname;
	}

	public String getUser_mobile() {
		return User_mobile;
	}

	public void setUser_mobile(String user_mobile) {
		User_mobile = user_mobile;
	}

	public Integer getUser_type() {
		return User_type;
	}

	public void setUser_type(Integer user_type) {
		User_type = user_type;
	}

	public String getUsername() {
		return Username;
	}

	public void setUsername(String username) {
		Username = username;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}
	

	
	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}
}
