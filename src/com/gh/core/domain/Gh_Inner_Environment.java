package com.gh.core.domain;

public class Gh_Inner_Environment {
	/**
	 * 温室id
	 */
private int gh_id;
/**
 * 空气温度
 */
private String air_temperature;
/**
 * 空气湿度
 */
private String air_humidity;
/**
 * 土壤温度
 */
private String soil_temperature;
/**
 * 土壤水分
 */
private String soil_moisture;
/**
 * 二氧化碳浓度
 */
private String cd_thickness;
/**
 * 光照度
 */
private String illuminance;
public int getGh_id() {
	return gh_id;
}
public void setGh_id(int gh_id) {
	this.gh_id = gh_id;
}
public String getAir_temperature() {
	return air_temperature;
}
public void setAir_temperature(String air_temperature) {
	this.air_temperature = air_temperature;
}
public String getAir_humidity() {
	return air_humidity;
}
public void setAir_humidity(String air_humidity) {
	this.air_humidity = air_humidity;
}
public String getSoil_temperature() {
	return soil_temperature;
}
public void setSoil_temperature(String soil_temperature) {
	this.soil_temperature = soil_temperature;
}
public String getSoil_moisture() {
	return soil_moisture;
}
public void setSoil_moisture(String soil_moisture) {
	this.soil_moisture = soil_moisture;
}
public String getCd_thickness() {
	return cd_thickness;
}
public void setCd_thickness(String cd_thickness) {
	this.cd_thickness = cd_thickness;
}
public String getIlluminance() {
	return illuminance;
}
public void setIlluminance(String illuminance) {
	this.illuminance = illuminance;
}
}
