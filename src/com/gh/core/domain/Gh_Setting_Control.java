package com.gh.core.domain;

public class Gh_Setting_Control {
	/**
	 * 温室id
	 */
private int gh_id;
/**
 * 农作物名称
 */
private String crop_name;
/**
 * 定植时叶片数
 */
private String crop_leaf;
/**
 * 定植日期
 */
private String setting_time;
/**
 *设定信息
 */
private String setting_info;

public int getGh_id() {
	return gh_id;
}
public void setGh_id(int gh_id) {
	this.gh_id = gh_id;
}
public String getCrop_name() {
	return crop_name;
}
public void setCrop_name(String crop_name) {
	this.crop_name = crop_name;
}
public String getCrop_leaf() {
	return crop_leaf;
}
public void setCrop_leaf(String crop_leaf) {
	this.crop_leaf = crop_leaf;
}
public String getSetting_time() {
	return setting_time;
}
public void setSetting_time(String setting_time) {
	this.setting_time = setting_time;
}
public String getSetting_info() {
	return setting_info;
}
public void setSetting_info(String setting_info) {
	this.setting_info = setting_info;
}


}
