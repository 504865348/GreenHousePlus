package com.gh.core.domain;

public class Gh_Control_Device {
	/**
	 * 温室id
	 */
private int gh_id;
/**
 * 二氧化碳发生器
 */
private String cd_producer;
/**
 * 工作方式
 */
private String working_mode;

public int getGh_id() {
	return gh_id;
}
public void setGh_id(int gh_id) {
	this.gh_id = gh_id;
}
public String getCd_producer() {
	return cd_producer;
}
public void setCd_producer(String cd_producer) {
	this.cd_producer = cd_producer;
}
public String getWorking_mode() {
	return working_mode;
}
public void setWorking_mode(String working_mode) {
	this.working_mode = working_mode;
}

}
