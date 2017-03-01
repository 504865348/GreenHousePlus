package com.gh.core.domain;

public class Irrigation_Fertilization_Information {
/**
 * 温室id
 */
private int base_id;
	/**
	 * 控制模式
	 * 0，停止；1，手动；2，单机 自动；3，联机手动；4，联机自动
	 */
private String control_mode;
/**
 * 施肥机状态 
 * 1，正在施肥；0，停止 施肥
 */
private String fertilizer_status;
/**
 * 温室1灌溉阀状态
 * 1，开启；0，关闭
 */
private String gh_one_irrigation_status;
/**
 * 温室2灌溉阀状态
 */
private String gh_two_irrigation_status;

/**
 * 温室3灌溉阀状态
 */
private String gh_three_irrigation_status;

/**
 * 温室4灌溉阀状态
 */
private String gh_four_irrigation_status;

/**
 * 温室5灌溉阀状态
 */
private String gh_five_irrigation_status;
/**
 * 温室6灌溉阀状态
 */
private String gh_six_irrigation_status;
/**
 * EC
 */
private String EC;
/**
 * PH
 */
private String PH;
/**
 * 流量
 */
private String flow;
/**
 * 灌溉量
 */
private String irrigation_amount;

	public int getBase_id() {
	return base_id;
}
public void setBase_id(int base_id) {
	this.base_id = base_id;
}
public String getControl_mode() {
	return control_mode;
}
public void setControl_mode(String control_mode) {
	this.control_mode = control_mode;
}
public String getFertilizer_status() {
	return fertilizer_status;
}
public void setFertilizer_status(String fertilizer_status) {
	this.fertilizer_status = fertilizer_status;
}
public String getGh_one_irrigation_status() {
	return gh_one_irrigation_status;
}
public void setGh_one_irrigation_status(String gh_one_irrigation_status) {
	this.gh_one_irrigation_status = gh_one_irrigation_status;
}
public String getGh_two_irrigation_status() {
	return gh_two_irrigation_status;
}
public void setGh_two_irrigation_status(String gh_two_irrigation_status) {
	this.gh_two_irrigation_status = gh_two_irrigation_status;
}
public String getGh_three_irrigation_status() {
	return gh_three_irrigation_status;
}
public void setGh_three_irrigation_status(String gh_three_irrigation_status) {
	this.gh_three_irrigation_status = gh_three_irrigation_status;
}
public String getGh_four_irrigation_status() {
	return gh_four_irrigation_status;
}
public void setGh_four_irrigation_status(String gh_four_irrigation_status) {
	this.gh_four_irrigation_status = gh_four_irrigation_status;
}
public String getGh_five_irrigation_status() {
	return gh_five_irrigation_status;
}
public void setGh_five_irrigation_status(String gh_five_irrigation_status) {
	this.gh_five_irrigation_status = gh_five_irrigation_status;
}
public String getGh_six_irrigation_status() {
	return gh_six_irrigation_status;
}
public void setGh_six_irrigation_status(String gh_six_irrigation_status) {
	this.gh_six_irrigation_status = gh_six_irrigation_status;
}
public String getEC() {
	return EC;
}
public void setEC(String eC) {
	EC = eC;
}
public String getPH() {
	return PH;
}
public void setPH(String pH) {
	PH = pH;
}
public String getFlow() {
	return flow;
}
public void setFlow(String flow) {
	this.flow = flow;
}
public String getIrrigation_amount() {
	return irrigation_amount;
}
public void setIrrigation_amount(String irrigation_amount) {
	this.irrigation_amount = irrigation_amount;
}
}
